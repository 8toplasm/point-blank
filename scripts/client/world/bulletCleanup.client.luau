script.Parent.ChildAdded:Connect(function(v)
		if v ~= script then
			wait(3)
			if v then
				v:Destroy()
			end
		end
end)