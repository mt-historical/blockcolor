
for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node("flags:" ..name, {
		description = "Flag",
		drawtype = "torchlike",
		visual_scale = 3.0,
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "flag.png^[colorize:#"..colour..":70",
		tiles = {"flags.png^[colorize:#"..colour..":70"},
		use_texture_alpha = "clip",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		light_source = 5,
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
		},
		groups = {cracky=3,dig_immediate=3},
	})

end
