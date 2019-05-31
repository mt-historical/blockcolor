--Beacons v1.1 for minetest // block_in_block | October 2018 TumeniNodes

--load other scripts
dofile(minetest.get_modpath("beacon").."/beaminit.lua")
dofile(minetest.get_modpath("beacon").."/beamgen.lua")

color1 = minetest.setting_get("color1") or "292421"
color2 = minetest.setting_get("color2") or "0000FF"
color3 = minetest.setting_get("color3") or "00FF00"
color4 = minetest.setting_get("color4") or "F5F5F5"
color5 = minetest.setting_get("color5") or "FF6103"
color6 = minetest.setting_get("color6") or "FF0000"
color7 = minetest.setting_get("color7") or "FFFF00"
color8 = minetest.setting_get("color8") or "FF69B4"

local source_list = {
   	{"black", "Color1", color1}, 
	  {"blue", "Color2", color2},
	  {"green", "Color3", color3}, 
  	 {"white", "Color4", color4}, 
   	{"orange", "Color5", color5}, 
   	{"red", "Color6", color6}, 
   	{"yellow", "Color7", color7}, 
   	{"pink", "Color8", color8}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

--code for "unactivated beacon"
minetest.register_node("beacon:empty", {
	description = "Unactivated Beacon",
 wield_image = "color_handwhite.png",
	wield_scale = {x=1,y=1,z=0.5},
 inventory_image = 'beaconoff.png^[colorize:#'..colour..':70',
	tiles = {"color_white.png", "default_glass.png"},
	light_source = 3,
	groups = {cracky=3,oddly_breakable_by_hand=3},
})

minetest.register_node("beacon:off" .. color , {
	description = "Beacon" .. color,
	drawtype = "mesh",
 light_source = 13,
	mesh = "block_in_block.obj",
 wield_image = "color_hand" .. color .. ".png",
	wield_scale = {x=1,y=1,z=0.5},
 inventory_image = 'beaconoff.png^[colorize:#'..colour..':70',
	tiles = {"color_white.png^[colorize:#"..colour..":70","default_glass.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
on_destruct = function(pos)
		for i=1,180 do
			minetest.remove_node({x=pos.x, y=pos.y+i, z=pos.z})
		end
	end
})

minetest.register_node("beacon:" .. color , {
	description = "Beacon" .. color,
	drawtype = "mesh",
 light_source = 13,
	mesh = "block_in_block.obj",
 wield_image = "color_hand" .. color .. ".png",
	wield_scale = {x=1,y=1,z=0.5},
 inventory_image = 'beaconon.png^[colorize:#'..colour..':70',
	tiles = {"color_white.png^[colorize:#"..colour..":70", "default_glass.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},
on_destruct = function(pos)
		for i=1,180 do
			minetest.remove_node({x=pos.x, y=pos.y+i, z=pos.z})
		end
	end
})

end

print("[OK] Beacons")
