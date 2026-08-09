local sys = require(Hidden.Systems)
local event = sys.item.ItemEquipped

local input = Input:GetButton("Weapon"..tostring(script.SlotID.Value))

script.Parent.Clicked:Connect(function()
	local msg = NetMessage.New()
	msg:AddString("slotID", script.SlotID.Value)
	event:InvokeServer(msg)
end)

input.Pressed:Connect(function()
	local msg = NetMessage.New()
	msg:AddString("slotID", script.SlotID.Value)
	event:InvokeServer(msg)
end)