local sys = require(Hidden.Systems)
local rs = sys.round
local zombies = Environment.Entities:WaitChild("Zombies")

rs.GameRestarted.Invoked:Connect(function()
	for i, v in pairs(zombies:GetChildren()) do
		local ai = script.ZombieAi:Clone(v)
		ai.IsEnabled = true
		ai.HitChecker.IsEnabled = true
	end
end)