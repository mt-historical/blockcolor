castle_shields = {}

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
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]

-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

castle_shields.register_shield = function(name, desc, background_color, foreground_color, mask)

	local tile_side = "color_white.png^[colorize:#"..colour..":70"
	local tile_front = "color_white.png^[colorize:#"..colour..":70^(color_black.png^[mask:castle_shield_mask_"..mask..".png)"


	minetest.register_node(minetest.get_current_modname()..":"..name, {
		description = desc,
		tiles = {tile_side, tile_side, tile_side, tile_side, "color_black.png", tile_front},
	 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
  inventory_image = "shield"..mask..".png^[colorize:#"..colour..":70",
		drawtype="nodebox",
		paramtype2 = "facedir",
		paramtype = "light",
		groups={cracky=3},
		sounds = default.node_sound_metal_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
				{-0.500000,-0.125000,0.375000,0.500000,0.500000,0.500000},
				{-0.437500,-0.312500,0.375000,0.425000,0.500000,0.500000},
				{-0.312500,-0.437500,0.375000,0.312500,0.500000,0.500000},
				{-0.187500,-0.500000,0.375000,0.187500,0.500000,0.500000},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.500000,-0.500000,0.375000,0.500000,0.500000,0.500000},
			},
		},
	})
	
-- method parameters are name, desc, background_color, foreground_color, pattern

end

castle_shields.register_shield("shield_slash" .. color, S("Mounted Shield"), color, "white", "slash")
castle_shields.register_shield("shield_chevron" .. color, S("Mounted Shield"), color, "white", "chevron")
castle_shields.register_shield("shield_cross" .. color, S("Mounted Shield"), color, "white", "cross")


end
