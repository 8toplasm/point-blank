local UI = script.Parent.Parent.Parent.Parent.Parent

script.Parent.Clicked:Connect(function()
	UI.TitleUI.Visible = false
	UI.TitleUI.TitleAnimate.IsEnabled = false
	UI.GameUI.Visible = true
	UI.UtilUI.Visible = true
	
	Environment.CurrentCamera.Mode = Enums.CameraMode.Follow
end)