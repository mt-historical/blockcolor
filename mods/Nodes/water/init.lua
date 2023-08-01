
for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node("water:" .. name .. "_water_source", {
		description = desc .. " Water Source",
		drawtype = "liquid",
		tiles = {
			{
				name = "color_white.png^[colorize:#" .. colour .. ":70",
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
		},
		special_tiles = {
			{
				name = "color_white.png^[colorize:#" .. colour .. ":70",
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
				backface_culling = false,
			},
		},
		use_texture_alpha = "blend",
		paramtype = "light",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#" .. colour .. ":70)",
		wield_scale = { x = 1, y = 1, z = 0.5 },
		inventory_image = "waters.png^[colorize:#" .. colour .. ":70",
		drop = "",
		drowning = 1,
		liquidtype = "source",
		liquid_alternative_flowing = "water:" .. name .. "_water_flowing",
		liquid_alternative_source = "water:" .. name .. "_water_source",
		liquid_viscosity = 1,
		post_effect_color = { a = 50, r = red, g = green, b = blue },
		groups = { water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1 },
		sounds = bc_core.sound_water(),
	})

	minetest.register_node("water:" .. name .. "_water_flowing", {
		description = desc .. " Flowing Water",
		drawtype = "flowingliquid",
		tiles = { "color_white.png^[colorize:#" .. colour },
		special_tiles = {
			{
				name = "color_white.png^[colorize:#" .. colour .. ":70",
				backface_culling = false,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
			{
				name = "color_white.png^[colorize:#" .. colour .. ":70",
				backface_culling = true,
				animation = {
					type = "vertical_frames",
					aspect_w = 16,
					aspect_h = 16,
					length = 2.0,
				},
			},
		},
		use_texture_alpha = "blend",
		inventory_image = "waters.png^[colorize:#" .. colour .. ":70",
		paramtype = "light",
		paramtype2 = "flowingliquid",
		walkable = false,
		pointable = false,
		diggable = false,
		buildable_to = true,
		is_ground_content = false,
		drop = "",
		drowning = 1,
		liquidtype = "flowing",
		liquid_alternative_flowing = "water:" .. name .. "_water_flowing",
		liquid_alternative_source = "water:" .. name .. "_water_source",
		liquid_viscosity = 1,
		post_effect_color = { a = 50, r = red, g = green, b = blue },
		groups = {
			water = 3,
			liquid = 3,
			puts_out_fire = 1,
			not_in_creative_inventory = 1,
			cools_lava = 1
		},
		sounds = bc_core.sound_water(),
	})
end
