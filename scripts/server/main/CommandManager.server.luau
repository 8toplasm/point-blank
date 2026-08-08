local banlist = {}

Players.PlayerAdded:Connect(function(plr)
	for i, v in pairs(banlist) do
		if plr.Name == v then
			plr:Kick("You have been banned from this game. Womp womp")
		end
	end
end)