repeat wait() until script.Parent:IsA("Player")

local sys = require(Hidden.Systems)
local rs = sys.round

local tools = ServerHidden.tools

-- Movement
function speedShit()
	if script.Parent.Character.CurrentState ~= Enums.CharacterModelState.Idle and script.Parent.WalkSpeed < 50 then
		script.Parent.WalkSpeed += 1
		script.Parent.WalkSpeed = math.min(script.Parent.WalkSpeed, 60)
	elseif script.Parent.Character.CurrentState == Enums.CharacterModelState.Idle then
		script.Parent.WalkSpeed = 35
	end
end

-- Player Input
script.ClientPlayerUtil.SendInput.InvokedServer:Connect(function(plr, msg)
	local type = msg:GetString("input")
	if type == "dash" then
		if plr == script.Parent and not db then
		  db = true
			script.Parent.Velocity += script.Parent.Forward * 400
			wait(3)
			db = false
		end
		
	elseif type == "w1" then
		if plr == script.Parent then
			local curSlot = script.Data.Holding
		
			if curSlot.Value ~= 1 then
				if plr.HoldingTool then plr.HoldingTool:Destroy() end
				local c = ServerHidden.weapons[tostring(script.Data.Slot1.Value)]:Clone()
				
				c.Parent = plr
				plr:EquipTool(c)
				curSlot.Value = 1
			else
				plr.HoldingTool:Destroy()
				curSlot.Value = 0
			end
		end
	elseif type == "w2" then
	end
end)

-- Round Presense
script.Parent.Died:Connect(function()
	Environment.Entities.Players[tostring(script.Parent.UserID)]:Destroy()
	script.Parent:DropTool()
	script.Parent.Position = Environment.Lobby.Spawn.Position
end)

Players.PlayerRemoved:Connect(function(plr)
	if Environment.Entities.Players:FindChild(tostring(plr.UserID))  ~= nil then
		Environment.Entities.Players:FindChild(tostring(plr.UserID)):Destroy()
	end
end)

rs.GameRestarted.Invoked:Connect(function()
	if Environment.Entities.Players:FindChild(tostring(script.Parent.UserID)) == nil then
		print("Player "..script.Parent.Name.." joining...")
		script.Parent.Position = Environment.CurrentMap.Spawn.Position
		local playerToken = script.Token:Clone(Environment.Entities.Players)
		playerToken.Name = tostring(script.Parent.UserID)
	end
end)

-- Loop
while true do
	wait(.5)
	speedShit()
end
