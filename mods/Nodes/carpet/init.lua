-- Carpet Mod!
-- By Jordan Snelling 2012
-- License LGPL
-- This mod adds carpets into Minetest.

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

	minetest.register_node("carpet:" .. name, {

description = desc .. " Carpet color",
	  drawtype = "raillike",
	  tiles = {"color_white.png^[colorize:#"..colour..":70"},
   wield_image = "color_hand" .. name .. ".png",
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
	
end
