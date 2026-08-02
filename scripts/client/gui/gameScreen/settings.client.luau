local settings = script.Parent.Parent.Parent.Parent.UtilUI.Settings
script.Parent.Clicked:Connect(function()
	settings.Visible = not settings.Visible 
end)