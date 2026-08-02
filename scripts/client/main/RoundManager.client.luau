sys = require(Hidden.Systems)
rs = sys.round

while true do
	wait(0.01)
	script.Parent.WaveTime.Text = tostring(rs.RoundTime.Value)
	
	if rs.RoundClassName.Value == "" then
		script.Parent.Text = "INTERMISSION"
	else
			script.Parent.Text = "WAVE "..tostring(rs.RoundNumber.Value)
	end
end
