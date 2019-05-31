local desk_cbox = {	type = "fixed",	fixed = { -0.5, -0.5, -0.5, 1.5, 0.5, 0.5 }}

local armoire_cbox = {type = "fixed",fixed = { -0.5, -0.5, -0.5, 0.5, 1.5, 0.5 }}

local bench_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.25, 1.5, 0, 0.5 },
		{-0.5, -0.5, 0.45, 1.5, 0.5, 0.5 },
	}
}

-- HomeDecor Blockcolor

local source_list = {
	{"black", "white", color1, 40, 36, 33}, 
	{"blue", "white", color2, 0, 0, 255},
	{"green", "white", color3, 0, 255, 0}, 
	{"white", "black", color4, 245, 245, 245}, 
	{"orange", "black", color5, 255, 97, 3}, 
	{"red", "white", color6, 255, 0, 0}, 
	{"yellow", "black", color7, 255, 255, 0}, 
	{"pink", "white", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local color2 = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

minetest.register_node("hdb:frigo" .. color, {
	description = "frigo" .. color,
   drawtype = "mesh",
	mesh = "hdb_frigo.obj",
tiles = {"color_white.png^[colorize:#"..colour..":70","color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_white.png^[colorize:#"..colour..":70"},
	inventory_image = 'frigo.png^[colorize:#'..colour..':70',
		 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
	 paramtype = "light",
	paramtype2 = "facedir",
collision_box = armoire_cbox,
   selection_box = armoire_cbox,
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
 	on_place = minetest.rotate_node,
})

minetest.register_node("hdb:bench" .. color, {
	description = "bench" .. color,
   drawtype = "mesh",
	mesh = "hdb_bench.obj",
	 tiles = {"color_white.png^[colorize:#"..colour..":70","color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_white.png^[colorize:#"..colour..":70"},
	inventory_image = 'bench.png^[colorize:#'..colour..':70',
		 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
	 paramtype = "light",
	paramtype2 = "facedir",
collision_box = bench_cbox,
   selection_box = bench_cbox,
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
 	on_place = minetest.rotate_node,
})

minetest.register_node("hdb:armoire" .. color, {
	description = "armoire" .. color,
   drawtype = "mesh",
	mesh = "hdb_armoire.obj",
	 tiles = {"color_white.png^[colorize:#"..colour..":70","color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_white.png^[colorize:#"..colour..":70"},
	inventory_image = 'armoire.png^[colorize:#'..colour..':70',
		 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
	 paramtype = "light",
	paramtype2 = "facedir",
collision_box = armoire_cbox,
   selection_box = armoire_cbox,
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_wood_defaults(),
 	on_place = minetest.rotate_node,
})

-- 	on_rotate = screwdriver.rotate_simple

minetest.register_node("hdb:desk" .. color, {
	description = "Desk" .. color,
   drawtype = "mesh",
	mesh = "hdb_desk.obj",
	 tiles = {"color_white.png^[colorize:#"..colour..":70","color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_white.png^[colorize:#"..colour..":70"},
	inventory_image = 'desk.png^[colorize:#'..colour..':70',
		 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
	 paramtype = "light",
	paramtype2 = "facedir",
collision_box = desk_cbox,
   selection_box = desk_cbox,
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_stone_defaults(),
 	on_place = minetest.rotate_node,
})

minetest.register_node("hdb:computer" .. color , {
	description = "Computer" .. color,
inventory_image = 'computer.png^[colorize:#'..colour..':70',
		 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
	drawtype = "mesh",
	mesh = "hdb_pc.obj",
tiles = {"color_white.png^[colorize:#"..colour..":70","color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_white.png^[colorize:#"..colour..":70"},
	paramtype = "light",
	paramtype2 = "facedir",
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_stone_defaults(),
 	on_place = minetest.rotate_node,
})

end
