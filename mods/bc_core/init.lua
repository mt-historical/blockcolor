
bc_core = {}

-- GUI related stuff
bc_core.gui_bg = "bgcolor[#080808BB;true]"
bc_core.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
bc_core.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = { x = 1, y = 1, z = 0.5 },
})

-- Load files
local default_path = minetest.get_modpath("bc_core")

dofile(default_path .. "/sounds.lua")
dofile(default_path .. "/mapgen.lua")
dofile(default_path .. "/aliases.lua")
dofile(default_path .. "/creative.lua")
dofile(default_path .. "/player.lua")

minetest.register_on_mods_loaded(function()
	for name, def in pairs(minetest.registered_nodes) do
		if def.oddly_breakable_by_hand or def.dig_immediate then
			minetest.log("warning", "Node " .. name .. " has a group name in its definition")
		end
	end
end)
