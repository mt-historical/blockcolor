-- Trampoline mod by Zorman2000
-- Code based on carpets mod included in BlockColor and a modification
-- of the original trampoline node found on xdecor mod by kilbith

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

	minetest.register_node("trampoline:"..color, {
		description = desc.."Trampoline",
   inventory_image = 'trampo.png^[colorize:#'..colour..':70',
   wield_image = "color_hand" .. color .. ".png",
		wield_scale = {x=1,y=1,z=0.5},
		tiles = {"trampoline.png^[colorize:#"..colour..":70", "trampoline.png^[colorize:#"..colour..":70", "trampoline_sides.png^[colorize:#"..colour..":70"},
		groups = {cracky=3, oddly_breakable_by_hand=1, fall_damage_add_percent=-100, bouncy=99},
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		}
	})
	
end
