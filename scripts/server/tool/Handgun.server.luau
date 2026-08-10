local ownerPlayer = script.Parent.Parent

local dmg = 15 + 10 * (script.Parent.Level.Value - 1)
local ammo = script.Parent.Ammo
local maxAmmo = 16 * script.Parent.Level.Value

local killSoundDB = false

script.Parent.Activated:Connect(function()
  if ammo.Value > 0 then
		ammo.Value -= 1
	else
		local msg = NetMessage.New()
		msg:AddInstance("sound", world.Sounds.SFX.gunReload)
		
		script.PlaySound:InvokeClient(msg, ownerPlayer)
		wait(1.4)
		ammo.Value = maxAmmo
	end
end)

script.Parent.Handgun_C.SendZombie.InvokedServer:Connect(function(plr, msg)
	local zombie = msg:GetInstance("zombie")
	zombie.Health -= dmg
	
	if zombie.Health <= 0 then
		local msg2 = NetMessage.New()
		msg2:AddInstance("sound", world.Sounds.SFX.zombieKill)
		
		script.PlaySound:InvokeClient(msg2, plr)
		wait(.75)
	end
end)