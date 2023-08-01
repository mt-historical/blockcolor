color1 = minetest.settings:get("color1") or "292421"
color2 = minetest.settings:get("color2") or "0000FF"
color3 = minetest.settings:get("color3") or "00FF00"
color4 = minetest.settings:get("color4") or "F5F5F5"
color5 = minetest.settings:get("color5") or "FF6103"
color6 = minetest.settings:get("color6") or "FF0000"
color7 = minetest.settings:get("color7") or "FFFF00"
color8 = minetest.settings:get("color8") or "FF69B4"

source_list = {
	{"black", "Black", color1, 40, 36, 33},
	{"blue", "Blue", color2, 0, 0, 255},
	{"green", "Green", color3, 0, 255, 0},
	{"white", "White", color4, 245, 245, 245},
	{"orange", "Orange", color5, 255, 97, 3},
	{"red", "Red", color6, 255, 0, 0},
	{"yellow", "Yellow", color7, 255, 255, 0},
	{"pink", "Pink", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node("color:" .. name, {
		description = desc .. " color",
		inventory_image = "blocks.png^[colorize:#"..colour..":70",
		tiles = {"color_white2.png^[colorize:#"..colour..":70"},
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = bc_core.sound(),
	})

	-- Simple color registrations consolidated from separate mods

	minetest.register_node(":carpet:" .. name, {
		description = desc .. " Carpet",
		drawtype = "raillike",
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		inventory_image = "carpets.png^[colorize:#"..colour..":70",
		wield_scale = {x=1,y=1,z=0.5},
		paramtype = "light",
		is_ground_content = true,
		walkable = false,
		buildable_to = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
		},
		groups = {dig_immediate=3},
	})

	minetest.register_node(":glass:" .. name , {
		description = desc .. " Glass",
		drawtype = "glasslike",
		tiles = {"whiteglass.png^[colorize:#"..colour..":70"},
		inventory_image = "windows.png^[colorize:#"..colour..":70",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		paramtype = "light",
		use_texture_alpha = "clip",
		sunlight_propagates = true,
		sounds = bc_core.sound_glass(),
		groups = {cracky=3,oddly_breakable_by_hand=3},
	})

	minetest.register_node(":light:" .. name, {
		description = desc .. " light",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#" .. colour .. ":70)",
		wield_scale = { x = 1, y = 1, z = 0.5 },
		inventory_image = "lights.png^[colorize:#" .. colour .. ":70",
		tiles = { "color_white.png^[colorize:#" .. colour .. ":70" },
		paramtype = "light",
		light_source = 14,
		is_ground_content = true,
		groups = { snappy = 2, choppy = 2, wool = 2 },
		sounds = bc_core.sound(),
	})

	minetest.register_node(":fence:" .. name, {
		description = desc .. " Fence ",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#" .. colour .. ":70)",
		inventory_image = "fence.png^[colorize:#" .. colour .. ":70",
		wield_scale = { x = 1, y = 1, z = 0.5 },
		tiles = { "color_white.png^[colorize:#" .. colour .. ":70" },
		drawtype = "fencelike",
		paramtype = "light",
		selection_box = {
			type = "fixed",
			fixed = { -1 / 7, -1 / 2, -1 / 7, 1 / 7, 1 / 2, 1 / 7 },
		},
		groups = { choppy = 3, flammable = 2 },
		sounds = {
			footstep = { name = "wood_woodstep" },
			dig = { name = "wood_woodtool" },
			place = { name = "default_stoneplace" },
		},
	})
end
