--[[
Coloured Glass by JBR
Code License: CC0
Texture License: CC BY-SA 3.0
--]]

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

minetest.register_node("glass:" .. name , {
	description = name .. "Glass",
	drawtype = "glasslike",
	tiles = {"whiteglass.png^[colorize:#"..colour..":70"},
   inventory_image = "windows.png^[colorize:#"..colour..":70",
   wield_image = "color_hand" .. name .. ".png",
   wield_scale = {x=1,y=1,z=0.5},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})

end
