local settingsUI = script.Parent.Body
local settingsList = {
	Environment.Entities.CountFeatures.QualityThreshold,
	Lighting.ColorAdjust
}
for i, v in pairs(settingsUI:GetChildren()) do
	v.Input.Changed:Connect(function(text)
		if v.Name == "1" then
			settingsList[1].Value = tonumber(v.Input.Text)
		elseif v.Name == "2" then
			settingsList[2].Brightness = tonumber(v.Input.Text)
		end
	end)
end