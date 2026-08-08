local ownerPlayer = script.Parent.Parent.Parent

local dmg = 15 + 10 * (script.Level.Value - 1)
local ammo = script.Ammo
local maxAmmo = 16 * script.Level.Value

script.Parent.Activated:Connect(function()
  if ammo.Value > 0 then
		ammo.Value -= 1
	else
		wait(2)
		local msg = NetMessage.New()
		msg:AddInstance("sound", world.Sounds.SFX.gunReload)
		
		script.PlaySound:InvokeClient(msg, ownerPlayer)
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
	end
end)