local settingsUI = script.Parent.Body
local settingsList = {
	Environment.Entities.CountFeatures.QualityThreshold,
	Lighting.ColorAdjust,
	world.Sounds.Music.MusicManager.MasterVolume
}

settingsUI["1"].Input.Changed:Connect(function(text)
		settingsList[1].Value = tonumber(text)
end)

settingsUI["2"].Input.Changed:Connect(function(text)
		settingsList[2].Brightness = tonumber(text)
end)

settingsUI["3"].Input.Changed:Connect(function(text)
		settingsList[3].Value = tonumber(text)
end)