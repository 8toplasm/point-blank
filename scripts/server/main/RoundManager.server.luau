local sys = require(Hidden.Systems)
local rs = sys.round
local zs = sys.zombie

local restart_msg = NetMessage.New()

local difficultyModifier = 1
local quantityModifier = 1.75
local maxZombieAmnt = 40
local z_storage = ServerHidden.zombieClasses

round_classes = {
	{
		singles = {},
		mod = 1,
		zombie = 78,
		skater = 10,
		scout = 10,
		jugger = 0, --3
		howler = 0, --5
		kami = 2,
		classname = "Regular",
		color = Color.FromHex("ffffff")
	},
	{
		singles = { "howler" },
		mod = 2,
		zombie = 0,
		skater = 10,
		scout = 0,
		jugger = 85,
		howler = 5,
		kami = 0,
		classname = "Silent",
		color = Color.FromHex("a24aff")
	},
	{
		singles = {},
		mod = 3,
		zombie = 50,
		skater = 25,
		scout = 25,
		jugger = 0,
		howler = 0,
		kami = 0,
		classname = "Horde",
		color = Color.FromHex("68ff75")
	},
	{
		singles = {},
		mod = .75,
		zombie = 0,
		skater = 0,
		scout = 0,
		jugger = 0,
		howler = 0,
		kami = 100,
		classname = "Bomb Rush",
		color = Color.FromHex("ff6103")
	}
}
round_chance = {
	80, --75
	0, --7
	15, --15
	5 --3
}

zombie_classes = {
	z_storage.zombie, 
	z_storage.skater,
	z_storage.scout,
	z_storage.juggernaut,
	z_storage.howler,
	z_storage.kamikaze
}

local spawns = Environment.CurrentMap:WaitChild("Spawns")
for i, v in pairs(spawns:GetChildren()) do
	v.Name = tostring(i)
end

function makeRound()
	print("Making round...")
	local chance = math.random(1, 100)
	local checked = 0

	--Choose the current round type
	for i, v in pairs(round_chance) do
		if chance > checked and chance <= (checked + v) then
			currentModifier = round_classes[i]
			rs.RoundClassName.Value = round_classes[i].classname
			rs.RoundColor.Value = round_classes[i].color
		end
		checked += v
	end
	print("Round chosen of type: "..currentModifier.classname)
	
	--Set-up all zombie chances & amounts
	local zombieList = {}
		zombieList[1] = currentModifier.zombie
		zombieList[2] = currentModifier.skater
		zombieList[3] = currentModifier.scout
		zombieList[4] = currentModifier.jugger
		zombieList[5] = currentModifier.howler
		zombieList[6] = currentModifier.kami
	
	difficultyModifier = math.min((rs.RoundNumber.Value * (quantityModifier * currentModifier.mod)), maxZombieAmnt)
	print("Zombie Count: "..difficultyModifier)
	
	--Spawn zombies
	for i = 1, difficultyModifier do
		local spawn_location = math.random(1, #spawns:GetChildren())
		local chance = math.random(1, 100)
		local checked = 0
		
		local chosen_zombie = nil
		for i, v in pairs(zombieList) do
			if chance > checked and chance <= (checked + v) then
				chosen_zombie = zombie_classes[i]
				print(chosen_zombie.Name)
			end
			checked += v
		end

		local c = chosen_zombie:Clone(Environment.Entities:WaitChild("Zombies"))
		c.Position = spawns[tostring(spawn_location)].Position + Vector3.New(math.random(-3, 3), 2, math.random(-3, 3))

		for i, v in pairs(currentModifier.singles) do
			local spawn_location = math.random(1, #spawns:GetChildren())
			local sc = z_storage:WaitChild(v):Clone()

			sc.Parent = Environment.Entities:WaitChild("Zombies")
			sc.Position = spawns[tostring(spawn_location)].Spawn.Position + Vector3.New(math.random(-3, 3), 5, math.random(-3, 3))
		end
	end
	wait(.05)
end

while true do
	wait(1)
	if rs.RoundTime.Value >= 1 then
		rs.RoundTime.Value -= 1
	else
		if rs.RoundClassName.Value ~= "" then
				rs.RoundClassName.Value = ""
				rs.RoundTime.Value = 10
		else
			for i, v in pairs(Players:GetPlayers()) do
				wait(.1)
				local health_t = Tween:NewTween()
				health_t:TweenNumber(v.Health, v.MaxHealth, 2, function(health)
					v.Health = health
				end)
			end
			rs.RoundNumber.Value += 1
			rs.RoundTime.Value = 150
			makeRound()
			wait(.1)
			rs.GameRestarted:Invoke(restart_msg)
		end
	end
	
	if #Environment.Entities.Zombies:GetChildren() == 0 and rs.RoundClassName.Value ~= "" and rs.RoundTime.Value > 3 then
		rs.RoundTime.Value = 3
	end
	
	if #Environment.Entities.Players:GetChildren() == 0 then
		for i, v in pairs(Environment.Entities.Zombies:GetChildren()) do
			v:Destroy()
		end
		rs.RoundNumber.Value = 0
	end
end
