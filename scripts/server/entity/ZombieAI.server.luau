local closest = math.huge
local db = false

while true do
	wait(1)
	script.Parent:TryStepUp()
	
	for i, v in pairs(Environment.Entities.Players:GetChildren()) do
		local plr = Players:GetPlayerByID(tonumber(v.Name))
		local dist = (script.Parent.Position - plr.Character.Position).Magnitude
		
		if dist <= closest then
			closest = dist
			script.Parent.MoveTarget = plr.Character
		end
	end
	
	script.Parent.Hitbox.Touched:Connect(function()
		for i, v in pairs(script.Parent.Hitbox:GetTouching()) do
			if v:IsA("Part") and v.CanCollide and not v:HasTag("Floor") then
				script.Parent:Jump()
			end
			if v:IsA("Player") and not db then
				db = true
				v.Health -= script.Parent.CharacterInfo.Damage.Value
				wait(script.Parent.CharacterInfo.DamageCooldown.Value - 1)
				db = false
			end
		end
	end)
	
	if script.Parent.Health <= 0 then
		wait(1)
		script.Parent:Destroy()
	end
end