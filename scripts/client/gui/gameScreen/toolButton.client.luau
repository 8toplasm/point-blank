local sys = require(Hidden.Systems)
local event = sys.item.ItemEquipped

script.Parent.Clicked:Connect(function()
	local msg = NetMessage.New()
	msg:AddString("toolName", script.ToolID.Value)
	
	event:InvokeServer(msg)
end)