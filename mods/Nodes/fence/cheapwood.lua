--
-- Fence
--

local source_list = {
	{"black", "Darkened", "292421", 40, 36, 33}, 
	{"blue", "Blue", "0000FF", 0, 0, 255},
	{"green", "Green", "00FF00", 0, 255, 0}, 
	{"white", "White", "F5F5F5", 245, 245, 245}, 
	{"orange", "Orange", "FF6103", 255, 97, 3}, 
	{"red", "Red", "FF0000", 255, 0, 0}, 
	{"yellow", "Yellow", "FFFF00", 255, 255, 0}, 
	{"pink", "pink", "FF69B4", 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

	minetest.register_node("fence:" .. name, {
		description = desc .. " Fence ",
		wield_image = "color_hand" .. name .. ".png",
      inventory_image = "fence.png^[colorize:#"..colour..":70",
		wield_scale = {x=2,y=1.5,z=0.2},
		tiles = {"color_" .. name .. ".png"},
		 drawtype = "fencelike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy=3,flammable=2},
    sounds = {
		footstep = {name="wood_woodstep"},
		dig = {name="wood_woodtool"},
		place = {name="default_stoneplace"},
    },
})

end
