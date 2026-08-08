local plr = Players.LocalPlayer
local ammo = plr.Backpack.handgun.Handgun_S.Ammo
local level = plr.Backpack.handgun.Handgun_S.Level

while true do 
	wait(.1)
	script.Parent.Text = "AMMO: "..ammo.Value.."/"..(16 * level.Value)
end