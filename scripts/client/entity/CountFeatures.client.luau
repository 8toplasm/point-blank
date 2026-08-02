local zombies = script.Parent.Zombies
local players = script.Parent.Players

zombies.ChildAdded:Connect(function()
	if #zombies:GetChildren() >= script.QualityThreshold.Value then
		Lighting.FogEnabled = false
		Lighting.SunLight.Shadows = false
	end
end)

zombies.ChildRemoved:Connect(function()
	if #zombies:GetChildren() < script.QualityThreshold.Value then
		Lighting.FogEnabled = true
		Lighting.SunLight.Shadows = true
	end
end)