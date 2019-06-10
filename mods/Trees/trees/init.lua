color1 = minetest.setting_get("color1") or "292421"
color2 = minetest.setting_get("color2") or "0000FF"
color3 = minetest.setting_get("color3") or "00FF00"
color4 = minetest.setting_get("color4") or "F5F5F5"
color5 = minetest.setting_get("color5") or "FF6103"
color6 = minetest.setting_get("color6") or "FF0000"
color7 = minetest.setting_get("color7") or "FFFF00"
color8 = minetest.setting_get("color8") or "FF69B4"

local source_list = {
	{"black", "Color1", color1, 40, 36, 33}, 
	{"blue", "Color2", color2, 0, 0, 255},
	{"green", "Color3", color3, 0, 255, 0}, 
	{"white", "Color4", color4, 245, 245, 245}, 
	{"orange", "Color5", color5, 255, 97, 3}, 
	{"red", "Color6", color6, 255, 0, 0}, 
	{"yellow", "Color7", color7, 255, 255, 0}, 
	{"pink", "Color8", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]

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
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
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
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
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
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
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
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
			 	})


end
