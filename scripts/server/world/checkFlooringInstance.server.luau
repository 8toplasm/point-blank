for i, v in pairs(script.Parent:GetChildren()) do --Yes, this sucks, but its only ran at the start of every server and im waaay too lazy to optimize it so
	if string.match(v.Name, "Three") then
		for a, b in pairs(v:GetChildren()) do
			b:AddTag("Floor")
			b.CanCollide = false
		end
	end
	if string.match(v.Name, "Street") then
		for a, b in pairs(v:GetChildren()) do
			b:AddTag("Floor")
			b.CanCollide = false
		end
	end
	if string.match(v.Name, "Road") then
		for a, b in pairs(v:GetChildren()) do
			b:AddTag("Floor")
		end
	end
	if string.match(v.Name, "Ground") then
			v:AddTag("Floor")
	end
	if string.match(v.Name, "Intersect") then
		for a, b in pairs(v:GetChildren()) do
			b:AddTag("Floor")
			b.CanCollide = false
		end
	end
	if string.match(v.Name, "Skate") then
		for a, b in pairs(v:GetChildren()) do
			b:AddTag("Floor")
		end
	end
end