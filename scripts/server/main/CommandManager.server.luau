local commandPrefix = "!"
local banlist = {
	
}
local modlist = {
	"ectoplasm",
	"dosha"
}

Players.PlayerAdded:Connect(function(plr)
	for i, v in pairs(banlist) do
		if plr.Name == v then
			plr:Kick("You have been banned from this game. Womp womp")
		end
	end
	
	plr.Chatted:Connect(function(msg)
		local allow = false
		for i, v in pairs(modlist) do 
			if plr.Name == v then 
				allow = true
			end
		end

		if allow then
			local args = string.split(msg, " ")
			args[1] = string.lower(args[1])
			
			if args[1] == commandPrefix.."skipround" then
				for i, v in pairs(Environment.Entities.Zombies:GetChildren()) do v:Destroy() end
			end
			if args[1] == commandPrefix.."setround" then
				Hidden.sys_Round.RoundNumber.Value = tonumber(args[2])
			end
			if args[1] == commandPrefix.."explode" then
				local explode = Players:GetPlayer(args[2])
				local explosion = Instance.New("Explosion")
				explosion.Parent = Environment
				explosion.Radius = 7
				explosion.Force = 800
				explosion.Damage = 50
				explosion.Position = explode.Character.Position
			end
		end
	end)
end)