local introBG = script.Parent.IntroFrame
local introText = script.Parent.IntroFrame.PolytoriaText

local mainMenu = script.Parent.MainMenu
local bg = script.Parent.MainMenu.Background
local logo = script.Parent.MainMenu.Logo
local container = script.Parent.MainMenu.ButtonContainer

script.Parent.Parent.GameUI.Visible = false
script.Parent.Parent.UtilUI.Visible = false
script.Parent.Visible = true
introBG.Visible = true
mainMenu.Visible = false

repeat wait() until bg.Loading == false
repeat wait() until logo.Loading == false
repeat wait() until container.Loading == false

Lighting.ColorAdjust.Brightness = 2.75  --1
Lighting.ColorAdjust.Contrast = 999.0 --1.2
Lighting.ColorAdjust.Saturation = 0.3 --1.5
Lighting.ColorAdjust.TintColor = Color.FromHex("ff007c") --ececff

Environment.CurrentCamera.Mode = Enums.CameraMode.Scripted
Environment.CurrentCamera.Position = Environment.CurrentMap.Camera.Value

introText.Visible = true
world.Sounds.Music.MainTheme:Play()
wait(2)

local T1 = Tween:NewTween()
T1:TweenColor(Color.FromHex("ff0000"), Color.FromHex("000000"), 3, function(color)
	introText.TextColor = color
end)
T1.Finished:Wait()

introBG.Color = Color.FromHex("00000000")

for i = 1, 2 do
	local T2 = Tween:NewTween()
	T2:TweenColor(Color.FromHex("00000000"), Color.FromHex("000000ff"), 2.5, function(color)
		introBG.Color = color
	end)
	T2.Finished:Wait()
	T2:Stop()

	local T2 = Tween:NewTween()
	T2:TweenColor(Color.FromHex("00000088"), Color.FromHex("000000ff"), 2.4, function(color)
		introBG.Color = color
	end)
	T2.Finished:Wait()
	T2:Stop()
end

introBG.Visible = false
mainMenu.Visible = true

Lighting.ColorAdjust.Brightness = 1
Lighting.ColorAdjust.Contrast = 1.2
Lighting.ColorAdjust.Saturation = 1.5
Lighting.ColorAdjust.TintColor = Color.FromHex("ececff")

local fadeIn = Tween:NewTween()
local slideFromLeft = Tween:NewTween()
local slideFromRight = Tween:NewTween()

slideFromRight:SetTrans(Enums.TweenTransition.Circ)
slideFromRight:SetDirection(Enums.TweenDirection.Out)

slideFromLeft:SetTrans(Enums.TweenTransition.Circ)
slideFromLeft:SetDirection(Enums.TweenDirection.Out)

fadeIn:TweenColor(Color.FromHex("ffffff00"), Color.FromHex("ffffff"), 1, function(color)
	bg.Color = color
end)
slideFromRight:TweenVector2(Vector2.New(1.2, 0.5), Vector2.New(0.75, 0.5), 2, function(v2)
	logo.PositionRelative = v2
end)
slideFromLeft:TweenVector2(Vector2.New(-0.2, 0.5), Vector2.New(0.5, 0.5), 2, function(v2)
	container.PositionRelative = v2
end)

Environment.CurrentCamera.Position = Environment.CurrentMap.Camera.Value