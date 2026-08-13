repeat wait() until Players:FindChildByClass("Player")
local closest = Players:FindChildByClass("Player")
local db = false

script.Parent.Hitbox.Touched:Connect(function()
	for i, v in pairs(script.Parent.Hitbox:GetTouching()) do
		if v.CanCollide and not v:HasTag("Floor") then
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

script.Parent.Died:Connect(function()
	wait(.5)
	script.Parent:Destroy()
end)

while true do
		wait(3)
		for i, v in pairs(Environment.Entities.Players:GetChildren()) do
			local plr = Players:GetPlayerByID(tonumber(v.Name))
			if closest ~= nil then
				local dist = (script.Parent.Position - plr.Character.Position).Magnitude
				local oldDist = (script.Parent.Position - closest.Character.Position).Magnitude
				
				if dist <= oldDist then
					closest = plr
				end
			else
				closest = plr
			end
			
			script.Parent.MoveTarget = closest.Character
		end
end