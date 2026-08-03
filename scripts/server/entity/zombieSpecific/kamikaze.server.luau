local closest = math.huge
local db = false

while true do
	wait(1)
	script.Parent:TryStepUp()
	
	for i, v in pairs(Players:GetChildren()) do
		local dist = (script.Parent.Position - v.Character.Position).Magnitude
		if dist <= closest and Environment.Entities.Players:FindChild(tostring(v.UserID)) then
			closest = dist
			script.Parent.MoveTarget = v.Character
		end
	end
	
	if closest < 8 then
		script.Parent.MoveTarget = nil
		script.Parent.Character.Accessory.Mesh.Particles.Playing = true
		
		wait(2)
		local explosion = Instance.New("Explosion")
		explosion.Parent = script.Parent
		explosion.Radius = 50
		explosion.Force = 200
		explosion.Damage = 100
		explosion.AffectWelds = true
		explosion.Position = script.Parent.Position
	
		for i, v in pairs(Environment:OverlapSphere(script.Parent.Position, 50)) do
			if v:IsA("NPC") then
				v.Velocity += Vector3.Up * 200
				v.Health -= 100
			end
		end
		
		wait(1)
		script.Parent:Destroy()
	end
	
	script.Parent.Hitbox.Touched:Connect(function()
		for i, v in pairs(script.Parent.Hitbox:GetTouching()) do
			if v:IsA("Part") and v.CanCollide and not v:HasTag("Floor") then
				script.Parent:Jump()
			end
		end
	end)
	
	if script.Parent.Health <= 0 then
		wait(1)
		script.Parent:Destroy()
	end
	
	script.HitChecker.Hit.InvokedServer:Connect(function(plr, msg)
		local damage = msg:GetNumber("dmg")
		script.Parent:TakeDamage(damage)
	end)
end