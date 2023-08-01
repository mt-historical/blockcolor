
for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node("trees:big_cactus_" .. name, {
		description = desc .. " color",
		paramtype = "light",
		drawtype = "mesh",
		mesh = "cactus.obj",
		visual_scale = 4,
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "color_white.png^[colorize:#"..colour..":70",

		tiles = {
			"color_white.png^[colorize:#"..colour..":70",
		},

		selection_box = {
			type = "fixed",
			fixed = { 0.40, -0.5, 0, -4.75, 13, -5.25},
		},

		collision_box = {
			type = "fixed",
			fixed = { 0.40, -0.5, 0, -4.75, 13, -5.25},
		},

		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = bc_core.sound(),
	})

	minetest.register_node("trees:big_" .. name, {
		description = desc .. " color",

		paramtype = "light",
		drawtype = "mesh",
		mesh = "tree.obj",
		visual_scale = 4,
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "bigtrees.png^[colorize:#"..colour..":70",

		tiles = {
			"color_white.png^[colorize:#"..colour..":70",
			"color_white.png",
			"color_white.png",
			"color_white.png",
			"color_white.png^[colorize:#"..colour..":70",
		},

		selection_box = {
			type = "fixed",
			fixed = { 0.40, -0.5, 0, -4.75, 13, -5.25},
		},

		collision_box = {
			type = "fixed",
			fixed = { 0.40, -0.5, 0, -4.75, 13, -5.25},
		},

		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = bc_core.sound(),
	})

	minetest.register_node("trees:normal_" .. name, {
		description = desc .. " color",

		paramtype = "light",
		drawtype = "mesh",
		mesh = "tree.obj",
		visual_scale = 2,
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "normaltrees.png^[colorize:#"..colour..":70",

		tiles = {
			"color_white.png^[colorize:#"..colour..":70",
			"color_white.png",
			"color_white.png",
			"color_white.png",
			"color_white.png^[colorize:#"..colour..":70",
		},

		selection_box = {
			type = "fixed",
			fixed = { 0.2, -0.5, 0, -2.4, 6.5, -2.5},
		},

		collision_box = {
			type = "fixed",
			fixed = { 0.2, -0.5, 0, -2.4, 6.5, -2.5},
		},

		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = bc_core.sound(),
	})

	minetest.register_node("trees:small_" .. name, {
		description = desc .. " color",

		paramtype = "light",
		drawtype = "mesh",
		mesh = "tree.obj",
		visual_scale = 1,
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "smalltrees.png^[colorize:#"..colour..":70",

		tiles = {
			"color_white.png^[colorize:#"..colour..":70",
			"color_white.png",
			"color_white.png",
			"color_white.png",
			"color_white.png^[colorize:#"..colour..":70",
		},

		selection_box = {
			type = "fixed",
			fixed = { 0.1, -0.5, 0, -1.2, 3.25, -1.25},
		},

		collision_box = {
			type = "fixed",
			fixed = { 0.1, -0.5, 0, -1.2, 3.25, -1.25},
		},

		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = bc_core.sound(),
	})
end
