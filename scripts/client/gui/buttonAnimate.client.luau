local defaultSize = script.Parent.SizeRelative

script.Parent.MouseEnter:Connect(function()
	script.Parent.SizeRelative = defaultSize + Vector2.New(0.05, 0.05)
end)

script.Parent.MouseExit:Connect(function()
	script.Parent.SizeRelative = defaultSize
end)