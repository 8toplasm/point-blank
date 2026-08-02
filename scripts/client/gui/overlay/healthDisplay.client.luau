local plr = Players.LocalPlayer

while true do
	wait(.1)
	script.Parent.Color = Color.FromRGB(255 * ((plr.MaxHealth - plr.Health) / 100), 0, 0)
	script.Parent.CriticalHealth.Color = Color.FromRGB(255, 0, 0, ((plr.MaxHealth - plr.Health) / 100) - 0.6)
end