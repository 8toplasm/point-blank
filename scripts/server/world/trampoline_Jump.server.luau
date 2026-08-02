db = false

script.Parent.Touched:Connect(function(hit)
	if hit:IsA("Player") or hit:IsA("NPC") and not db then
		db = true
		hit.Velocity += Vector3.Up * 140
		--script:FindChildByClass("Sound")
			wait(1)
		db = false
	end
end)
