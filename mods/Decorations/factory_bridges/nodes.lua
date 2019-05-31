
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

minetest.register_node(FB.NAME..":stair" .. color, {
	description = FB.LOCAL("c00"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
 inventory_image = "fbstair.png^[colorize:#"..colour..":70",
	tiles = {"color_white.png^[colorize:#"..colour..":70"},
	node_box = {type = "fixed", fixed = FB.MODELS.C00},
})

minetest.register_node(FB.NAME..":trap1" .. color, {
	description = FB.LOCAL("d00"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
 inventory_image = "fbtrap.png^[colorize:#"..colour..":70",
	tiles = {"color_white.png^[colorize:#"..colour..":70"},
	node_box = {type = "fixed", fixed = FB.MODELS.D00},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name=FB.NAME..":trap2" ..color, param2=node.param2})
	end,
})

minetest.register_node(FB.NAME..":trap2" .. color, {
	description = FB.LOCAL("d01"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2, not_in_creative_inventory = 1},
	 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
 inventory_image = "fbtrap.png^[colorize:#"..colour..":70",
	tiles = {"color_white.png^[colorize:#"..colour..":70"},
	node_box = {type = "fixed", fixed = FB.MODELS.D01},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.set_node(pos, {name=FB.NAME..":trap1" ..color, param2=node.param2})
	end,
	drop = FB.NAME..":d00",
})

minetest.register_node(FB.NAME..":ladder" .. color, {
	description = FB.LOCAL("s00"),
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	climbable = true,
	groups = {cracky = 2},
 wield_image = "color_hand" .. color .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
 inventory_image = "fbladder.png^[colorize:#"..colour..":70",
	tiles = {"color_white.png^[colorize:#"..colour..":70"},
	node_box = {type = "fixed", fixed = FB.MODELS.S00},
})

-- minetest.register_alias(FB.NAME..":a00", FB.NAME..":a01")
-- minetest.register_alias(FB.NAME..":s06", FB.NAME..":c03")

end
