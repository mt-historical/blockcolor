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


minetest.register_abm({
	nodenames = {"beacon:" .. color},
	interval = 5,
	chance = 1,
	action = function(pos)
		pos.y = pos.y + 1
		minetest.add_node(pos, {name="beacon:"..color.."base"})
		for i=1,179 do
			minetest.add_node({x=pos.x, y=pos.y+i, z=pos.z}, {name="beacon:"..color.."beam"})
		end
	end,
})

end
