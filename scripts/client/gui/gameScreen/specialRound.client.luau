local sys = require(Hidden.Systems)
local rs = sys.round

rs.RoundClassName.Changed:Connect(function()
  wait(.25) --To prevent it from loading previous rounds in case of any delay
	if rs.RoundClassName.Value  ~= "" and rs.RoundClassName.Value ~= "Regular" then
		print("Playing Custom Round Thingie..")
		--Set-up text & color
		script.Parent.Content.Title.Text = string.upper(rs.RoundClassName.Value)
		script.Parent.Content.Title.TextColor = rs.RoundColor.Value
		world.Sounds.SFX.specialRound:Play()
		
		--Appear
		script.Parent.Visible = true
		script.Parent.Content.Visible = false
		local slide1 = Tween:NewTween()
		slide1:TweenVector2(Vector2.New(1.6, 0.5), Vector2.New(0.5, 0.5), .5, function(v2)
			script.Parent.PositionRelative = v2
		end)
		wait(.25)
		local slide2 = Tween:NewTween()
		script.Parent.Content.Visible = true
		slide2:TweenVector2(Vector2.New(1.5, 0.5), Vector2.New(0.5, 0.5), .75, function(v2)
			script.Parent.Content.PositionRelative = v2
		end)
		
		--Stay
		slide2.Finished:Wait()
		wait(2)
		
		--Leave
		local slide1 = Tween:NewTween()
		slide1:TweenVector2(Vector2.New(0.5, 0.5), Vector2.New(-0.5, 0.5), .75, function(v2)
			script.Parent.Content.PositionRelative = v2
		end)
		wait(.25)
		local slide2 = Tween:NewTween()
		slide2:TweenVector2(Vector2.New(0.5, 0.5), Vector2.New(-0.6, 0.5), .5, function(v2)
			script.Parent.PositionRelative = v2
		end)
		slide2.Finished:Wait()
		script.Parent.Content.Visible = false
		script.Parent.Visible = false
	end
end)