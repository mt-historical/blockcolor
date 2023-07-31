-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

-- Herse

minetest.register_node("castle_gates:herse" .. color, {
	drawtype = "nodebox",
	description = S("Portcullis Bars"),
	groups = {castle_gate = 1, choppy = 1, flow_through = 1},
    wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
	wield_scale = {x=1,y=1,z=0.5},
    inventory_image = "cgherse.png^[colorize:#"..colour..":70",
	tiles = {"color_white.png^[colorize:#"..colour..":70"},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.5, 0.125, 0.5, -0.25}, -- middle bar
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.25}, -- side bar
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.25}, -- side bar
			{-0.375, 0.1875, -0.4375, 0.375, 0.3125, -0.3125}, -- crosspiece
			{-0.375, -0.3125, -0.4375, 0.375, -0.1875, -0.3125}, -- crosspiece
		}
	},
	on_rightclick = castle_gates.trigger_gate,
})

-- Door

minetest.register_node("castle_gates:door" ..color ,{
	drawtype = "nodebox",
	description = S("Gate Door Edge"),
	groups = {choppy = 1, castle_gate = 1},
    wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
	wield_scale = {x=1,y=1,z=0.5},
    inventory_image = "cgdoor.png^[colorize:#"..colour..":70",
    tiles = {"color_white.png^[colorize:#"..colour..":70"},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
		node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.25},
		}
	},
	_gate_edges = {right=true},
	on_rightclick = castle_gates.trigger_gate,
})


-- Border Door

minetest.register_node("castle_gates:border" ..color , {
	drawtype = "nodebox",
	description = S("Gate Door With Hinge"),
    wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
	wield_scale = {x=1,y=1,z=0.5},
    inventory_image = "cgborder.png^[colorize:#"..colour..":70",
	tiles = {"color_white.png^[colorize:#"..colour..":70"},
	sounds = default.node_sound_wood_defaults(),
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 1, castle_gate = 1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.25},
			{-10/16, -4/16, -10/16, -6/16, 4/16, -6/16},
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, -0.25},
	},

	_gate_hinge = {axis="top", offset={"front","left"}},
	on_rightclick = castle_gates.trigger_gate,
})

end
