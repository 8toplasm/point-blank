local sys = require(Hidden.Systems)
local bullet = sys.item.projectiles.bullet
local plr = Players.LocalPlayer

local hb = Instance.New("Part", Environment)
local dmg = Instance.New("NumberValue", hb)
local db = false

hb.CanCollide = false
hb.Color = Color.FromRGB(0, 255, 0, 0)
hb.Size = Vector3.New(2, 2, 2)
hb.Name = "PLRGUN"
hb.Anchored = true

dmg.Name = "Damage"
dmg.Value = (15 * script.Parent.Level.Value)
	
script.Parent.Activated:Connect(function()
	if not db then
		db = true
		local mousePos = Input.GetMouseWorldPosition()
		local rayOrigin = script.Parent.RaycastOrigin.Position
		local ray = Environment:Raycast(rayOrigin, (mousePos - rayOrigin).Normalized, 300, {plr, script.Parent, hb, Environment.RayIgnore})
		
		world.Sounds.SFX.gunShot.Pitch = (1 + (math.random(-2, 2) / 10))
		world.Sounds.SFX.gunShot:Play()
		if ray ~= nil then
			hb.Position = ray.Position
		else
			hb.Position = mousePos
		end
		
		--cosmetic stuff
		local clone = bullet:Clone(Environment.RayIgnore)
		clone:LookAt(hb.Position)
		clone.Position = script.Parent.RaycastOrigin.Position
		script.Parent.RaycastOrigin.PointLight.Enabled = true
		
		wait(.005)
		script.Parent.RaycastOrigin.PointLight.Enabled = false
		
		local t = Tween:NewTween()
		t:TweenPosition(clone, hb.Position, 0.1)
		t.Finished:Wait()
		clone:Destroy()
		wait(.005)
		db = false
	end
end)