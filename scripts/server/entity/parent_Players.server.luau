local sys = require(Hidden.Systems)
local rs = sys.round

script.Parent.Died:Connect(function()
	Environment.Entities.Players[tostring(script.Parent.UserID)]:Destroy()
	script.Parent:DropTool()
	script.Parent.Position = Environment.Lobby.Spawn.Position
	for i, v in pairs(Environment.Entities.Players:GetChildren()) do
		print(v.Name)
	end
end)

Players.PlayerRemoved:Connect(function(plr)
	if Environment.Entities.Players:FindChild(tostring(plr.UserID))  ~= nil then
		Environment.Entities.Players:FindChild(tostring(plr.UserID)):Destroy()
	end
end)

rs.GameRestarted.Invoked:Connect(function()
	if Environment.Entities.Players:FindChild(tostring(script.Parent.UserID)) == nil then
		print("Player joining...")
		script.Parent.Position = Environment.CurrentMap.Spawn.Position
		local playerToken = script.Token:Clone(Environment.Entities.Players)
		playerToken.Name = tostring(script.Parent.UserID)
	end
end)
