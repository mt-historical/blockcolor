local dyes = {
	{"black", "Darkened", color1}, 
	{"blue", "Blue", color2},
	{"green", "Green", color3}, 
	{"white", "White", color4}, 
	{"orange", "Orange", color5}, 
	{"red", "Red", color6}, 
	{"yellow", "Yellow", color7}, 
	{"pink", "pink", color8}
}
for i = 1, #dyes do
	local name, desc, colour = unpack(dyes[i])

	minetest.register_node("light:" .. name, {
		description = desc .. " light",
		wield_image = "color_hand" .. name .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
  inventory_image = "lights.png^[colorize:#"..colour..":70",
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		paramtype = "light",
	 light_source = 14,
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
			 	})
	
end
