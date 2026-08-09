local plr = Players.LocalPlayer

while true do
	wait(.1)
	if plr.HoldingTool then
	 if plr.HoldingTool.Ammo then
			local ammo = plr.HoldingTool.Ammo.Value
			local level = plr.HoldingTool.Level.Value
		
			script.Parent.Text = "AMMO: "..ammo.."/"..(16 * level)
		end
	end
end