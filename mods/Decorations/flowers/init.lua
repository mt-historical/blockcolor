--[[
-- Flowers mod by ironzorg
--]]

local source_list = {
	{"black", "Darkened", color1, 40, 36, 33}, 
	{"blue", "Blue", color2, 0, 0, 255},
	{"green", "Green", color3, 0, 255, 0}, 
	{"white", "White", color4, 245, 245, 245}, 
	{"orange", "Orange", color5, 255, 97, 3}, 
	{"red", "Red", color6, 255, 0, 0}, 
	{"yellow", "Yellow", color7, 255, 255, 0}, 
	{"pink", "pink", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	
		
	minetest.register_node('flowers:' .. name , {
		drawtype = 'plantlike',
		tiles = { 'flower_white.png^[colorize:#'..colour..':70' },
		inventory_image = 'flowers.png^[colorize:#'..colour..':70',
		sunlight_propagates = true,
		paramtype = 'light',
     description = desc .. "  Flower color",
		 wield_image = "color_hand" .. name .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
		 groups = {snappy = 2, choppy = 2, wool = 2},
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
     waving = 1,
		walkable = false,
		buildable_to = true,
		sounds = default.node_sound_leaves_defaults(),

	})

end
