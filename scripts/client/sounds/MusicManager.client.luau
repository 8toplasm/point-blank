local music = script.Parent
local trackLoops = {
	music.TempTrack1,
	music.Track1
}

for i, v in pairs(music:GetChildrenOfClass("Sound")) do
	if script.MasterVolume.Value > 0 then v.Volume = script.MasterVolume.Value + v.Gain.Value else v.Volume = 0 end
	
	v.Finished:Connect(function()
		local track = trackLoops[math.random(1, #trackLoops)]
		wait(1)
		track:Play()
	end)
end

script.MasterVolume.Changed:Connect(function()
	for i, v in pairs(music:GetChildrenOfClass("Sound")) do
		if script.MasterVolume.Value > 0 then v.Volume = script.MasterVolume.Value + v.Gain.Value else v.Volume = 0 end
	end
end)