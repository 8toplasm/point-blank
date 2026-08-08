local sys = require(Hidden.Systems)
local event = sys.item.ItemEquipped

event.InvokedServer:Connect(function(plr, msg)
	local name = msg:GetString("toolName")
	local tool = plr.Backpack[name]
	
	if plr.HoldingTool ~= tool  then
		plr:EquipTool(tool)
	elseif plr.HoldingTool == tool then
		plr:DropTool()
	end
end)