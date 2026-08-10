local sys = require(Hidden.Systems)
local event = sys.item.ItemEquipped
local tools = ServerHidden.tools

event.InvokedServer:Connect(function(plr, msg)
	local slot = msg:GetString("slotID")
	local tool = tools[plr.Data["Slot"..slot].Value]
	
	if not plr.HoldingTool then
			local clone = tool:Clone(plr)
			clone.Level.Value = plr.Data.Weapons[tool.Name].Value
			plr:EquipTool(clone)
	else
		if plr.HoldingTool.Name == tool.Name then
			local destroy = plr.HoldingTool
			plr:DropTool()
		else
			local clone = tool:Clone(plr)
			plr:EquipTool(clone)
		end
	end
end)