local sys = require(Hidden.Systems)
local bullet = sys.item.projectiles.bullet
local plr = Players.LocalPlayer
local reload = Input:GetButton("Reload")

local db = false
script.Parent.Activated:Connect(function()
	if not db and script.Parent.Ammo.Value > 0 then
		db = true
		local mousePos = Input.GetMouseWorldPosition()
		local rayOrigin = script.Parent.RaycastOrigin.Position
		local ray = Environment:Raycast(rayOrigin, (mousePos - rayOrigin).Normalized, 900, {plr, script.Parent, Environment.RayIgnore})
		
		world.Sounds.SFX.gunShot.Pitch = (1 + (math.random(-2, 2) / 10))
		world.Sounds.SFX.gunShot:Play()
		if ray then
		 if ray.Instance then
				if ray.Instance:IsA("NPC") then
					local msg = NetMessage.New()
					msg:AddInstance("zombie", ray.Instance)
					script.SendZombie:InvokeServer(msg)
				end
			end
			--cosmetic stuff
			local clone = bullet:Clone(Environment.RayIgnore)
			clone:LookAt(ray.Position)
			clone.Position = script.Parent.RaycastOrigin.Position
			script.Parent.RaycastOrigin.PointLight.Enabled = true
			
			wait(.005)
			script.Parent.RaycastOrigin.PointLight.Enabled = false
			
			local t = Tween:NewTween()
			t:TweenPosition(clone, ray.Position, 0.1)
			t.Finished:Wait()
			clone:Destroy()
		end
		wait(.005)
		db = false
	end
end)

reload.Pressed:Connect(function()
	local msg = NetMessage.New()
	script.SendReload:InvokeServer(msg)
	
	if not world.Sounds.SFX.gunReload.Playing then world.Sounds.SFX.gunReload:Play() end
end)

script.Parent.Handgun_S.PlaySound.InvokedClient:Connect(function(msg)
	local sound = msg:GetInstance("sound")
	if not sound.Playing then sound:Play() end
	
	if sound.Name == "zombieKill" then
		sound:Play()
		sound.Pitch += .1
	else
		if not sound.Playing then sound:Play() end
	end
end)