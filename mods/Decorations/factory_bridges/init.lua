FB = {}
FB.NAME = "factory_bridges"

dofile(minetest.get_modpath(FB.NAME).."/models.lua")


for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node(FB.NAME..":stair" .. color, {
		description = desc.." Stair",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 2},
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "fbstair.png^[colorize:#"..colour..":70",
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		node_box = {type = "fixed", fixed = FB.MODELS.C00},
	})

	minetest.register_node(FB.NAME..":trap1" .. color, {
		description = desc.." Trapdoor",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky = 2},
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "fbtrap.png^[colorize:#"..colour..":70",
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		node_box = {type = "fixed", fixed = FB.MODELS.D00},
		on_rightclick = function(pos, node, player, itemstack, pointed_thing)
			minetest.set_node(pos, {name=FB.NAME..":trap2" ..color, param2=node.param2})
		end,
	})

	minetest.register_node(FB.NAME..":trap2" .. color, {
		description = desc.." Trapdoor 2",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {cracky=2, not_in_creative_inventory = 1},
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
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
		description = desc.." Ladder",
		drawtype = "nodebox",
		paramtype = "light",
		paramtype2 = "facedir",
		climbable = true,
		groups = {cracky = 2},
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		inventory_image = "fbladder.png^[colorize:#"..colour..":70",
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		node_box = {type = "fixed", fixed = FB.MODELS.S00},
	})

end

