local sys = require(Hidden.Systems)
local rs = sys.round

script.Parent.Parent.Touched:Connect(function(hit)
		if hit:IsA("Part") and string.match(hit.Name, "PLRGUN") then
			local msg = NetMessage.New()
			msg:AddNumber("dmg", hit.Damage.Value)
			script.Hit:InvokeServer(msg)
		end
end)

script.Parent.Parent.Died:Connect(function()
		world.Sounds.SFX.zombieKill:Play()
		if world.Sounds.SFX.zombieKill.Pitch < 1.5 then
			world.Sounds.SFX.zombieKill.Pitch += 0.1
		end
end)