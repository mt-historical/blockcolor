-- Blockcolor 1.46.4 : pipefull by Chiantos ( Fork Columnia // 2018)

-- Minetest 0.4 mod: columnia by Glunggi(former Stairs Copyright by(C) 2011-2012 Kahrl <kahrl@gmx.net> Copyright (C) 2011-2012 celeron55, Perttu Ahola)
-- See README.txt for licensing and other information.

fullpipe = {}

function fullpipe.register_pipe_border(subname, recipeitem, groups, images, description, inventorys, sounds)
	minetest.register_node("fullpipe:border_" .. subname, {
	   wield_image = "color_hand" .. subname .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
      inventory_image = inventorys,
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {
			   {-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			   {-0.5, 0.25, -0.5, 0.5, 0.5, 0.5}, 
			   {-0.375, 0, -0.375, 0.375, 0.5, 0.375},
		    },
		},
		 
	})

end

function fullpipe.register_pipe_block(subname, recipeitem, groups, images, description, inventorys, sounds)
	minetest.register_node("fullpipe:block_" .. subname, {
      wield_image = "color_hand" .. subname .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
      inventory_image = inventorys,
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = true,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			 fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
		},
			})

end

function fullpipe.register_pipe(subname, recipeitem, groups, images, desc_pipe_border, desc_pipe_block, inv_pipe_border, inv_pipe_block, sounds)

	fullpipe.register_pipe_border(subname, recipeitem, groups, images, desc_pipe_border, inv_pipe_border, sounds)
	fullpipe.register_pipe_block(subname, recipeitem, groups, images, desc_pipe_block, inv_pipe_block, sounds)
	
end

local source_list = {
	{"black", "Darkened", color1, 40, 36, 33}, 
	{"blue", "Blue", color2, 0, 0, 255},
	{"green", "Green", color3, 0, 255, 0}, 
	{"white", "White", color4, 245, 245, 245}, 
	{"orange", "Orange", color5, 255, 97, 3}, 
	{"red", "Red", color6, 255, 0, 0}, 
	{"yellow", "Yellow", color7, 255, 255, 0}, 
	{"pink", "Pink", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

fullpipe.register_pipe("" .. name .. "", "color:" .. name,
		{cracky=3},
  {"color_white.png^[colorize:#"..colour..":70"},
		desc .. "FullPipe Border",
		desc .. "FullPipe Block",
      "fullpipeborder.png^[colorize:#"..colour..":70",
      "fullpipe.png^[colorize:#"..colour..":70",
		default.node_sound_stone_defaults()
        )

end
