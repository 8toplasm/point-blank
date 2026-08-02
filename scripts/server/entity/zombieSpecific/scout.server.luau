db = false

script.Parent.Touched:Connect(function(hit)
	if hit:IsA("NPC") and not db and not hit:IsA("Player") then
		db = true
		hit.Velocity += Vector3.Up * 140
		--script:FindChildByClass("Sound")
			wait(1)
		db = false
	end
end)
