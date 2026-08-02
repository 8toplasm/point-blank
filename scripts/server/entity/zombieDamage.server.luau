db = false

while true do 
	wait(1)
	for i, v in pairs(script.Parent:GetTouching()) do
		if v:IsA("Player") and db == false then
			db = true
			v.Health -= script.Parent.Damage.Value
			wait(2)
			db = false
		end
	end
end
