--
-- Aliases for map generators
--

minetest.register_alias("mapgen_stone","comboblock:slab_black_onc_slab_black")

minetest.register_alias("mapgen_dirt","comboblock:slab_orange_onc_slab_orange")

minetest.register_alias("mapgen_dirt_with_grass","comboblock:slab_green_onc_slab_orange")

minetest.register_alias("mapgen_sand","comboblock:slab_yellow_onc_slab_yellow")

minetest.register_alias("mapgen_water_source","water:blue_water_source")

minetest.register_alias("mapgen_river_water_source","water:blue_water_source")

minetest.register_alias("mapgen_lava_source","water:red_water_source")

minetest.register_alias("mapgen_gravel","comboblock:slab_black_onc_slab_black")

minetest.register_alias("mapgen_desert_stone","comboblock:slab_black_onc_slab_black")

minetest.register_alias("mapgen_desert_sand","comboblock:slab_yellow_onc_slab_yellow")

minetest.register_alias("mapgen_dirt_with_snow","comboblock:slab_white_onc_slab_orange")

minetest.register_alias("mapgen_snowblock","comboblock:slab_white_onc_slab_white")

minetest.register_alias("mapgen_snow","comboblock:slab_white_onc_slab_white")

minetest.register_alias("mapgen_ice","comboblock:slab_blue_onc_slab_blue")

minetest.register_alias("mapgen_sandstone","comboblock:slab_orange_onc_slab_orange")

-- Flora

minetest.register_alias("mapgen_tree", "color:orange")
minetest.register_alias("mapgen_leaves", "color:green")
minetest.register_alias("mapgen_apple", "color:red")
minetest.register_alias("mapgen_jungletree", "color:orange")
minetest.register_alias("mapgen_jungleleaves", "color:green")
minetest.register_alias("mapgen_junglegrass", "color:green")
minetest.register_alias("mapgen_pine_tree", "color:orange")
minetest.register_alias("mapgen_pine_needles", "color:green")

-- Dungeons

minetest.register_alias("mapgen_cobble", "color:black")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_white")
minetest.register_alias("mapgen_mossycobble", "color:white")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_white")
minetest.register_alias("mapgen_sandstonebrick", "color:orange")
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:stair_white")

--
-- Register biomes
--

-- All mapgens except mgv6

function default.register_biomes(upper_limit)

	-- White Biome (Cold)

	minetest.register_biome({
		name = "white",
		node_top = "comboblock:slab_white_onc_slab_orange",
		depth_top = 1,
		node_filler = "comboblock:slab_orange_onc_slab_orange",
		depth_filler = 1,
		node_stone = "comboblock:slab_black_onc_slab_black",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "comboblock:slab_yellow_onc_slab_yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "white_ocean",
		--node_dust = "",
		node_top = "comboblock:slab_yellow_onc_slab_yellow",
		depth_top = 1,
		node_filler = "comboblock:slab_yellow_onc_slab_yellow",
		depth_filler = 3,
		node_stone = "comboblock:slab_black_onc_slab_black",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "comboblock:slab_yellow_onc_slab_yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	-- Green Biome (Neutral)

	minetest.register_biome({
		name = "green",
		--node_dust = "",
		node_top = "comboblock:slab_green_onc_slab_orange",
		depth_top = 1,
		node_filler = "comboblock:slab_orange_onc_slab_orange",
		depth_filler = 1,
		node_stone = "comboblock:slab_black_onc_slab_black",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "comboblock:slab_yellow_onc_slab_yellow",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "green_ocean",
		--node_dust = "",
		node_top = "comboblock:slab_yellow_onc_slab_yellow",
		depth_top = 1,
		node_filler = "comboblock:slab_yellow_onc_slab_yellow",
		depth_filler = 3,
		node_stone = "comboblock:slab_black_onc_slab_black",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "comboblock:slab_yellow_onc_slab_yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Yellow Biome (Hot)

	minetest.register_biome({
		name = "yellow",
		--node_dust = "",
		node_top = "comboblock:slab_yellow_onc_slab_yellow",
		depth_top = 1,
		node_filler = "comboblock:slab_yellow_onc_slab_yellow",
		depth_filler = 1,
		node_stone = "comboblock:slab_orange_onc_slab_orange",
		--node_water_top = "" ,
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "comboblock:slab_yellow_onc_slab_yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "yellow_ocean",
		--node_dust = "",
		node_top = "comboblock:slab_yellow_onc_slab_yellow",
		depth_top = 1,
		node_filler = "comboblock:slab_yellow_onc_slab_yellow",
		depth_filler = 3,
		node_stone = "comboblock:slab_orange_onc_slab_orange",
	 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "comboblock:slab_yellow_onc_slab_yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 92,
		humidity_point = 16,
	})

end

--
-- Register decorations
--

function default.register_decorations()

	-- Green Biome (Neutral)

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_green_onc_slab_orange"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	 	biomes = {" green "},
		y_min = 1,
		y_max = 31000,
		decoration = "trees:big_green",

	})
	
	 minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_green_onc_slab_orange"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" green "},
		y_min = 1,
		y_max = 31000,
		decoration = "trees:normal_red",

	})

	 minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_green_onc_slab_orange"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" green "},
		y_min = 1,
		y_max = 31000,
		decoration = "trees:small_yellow",

	})

-- White Biome (Cold)

minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_white_onc_slab_orange"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
	 	biomes = {" white "},
		y_min = 1,
		y_max = 31000,
		decoration = "trees:big_blue",

	})
	
	 minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_white_onc_slab_orange"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" white "},
		y_min = 1,
		y_max = 31000,
		decoration = "trees:normal_pink",

	})

-- Yellow Biome (Hot)

minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_yellow_onc_slab_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" yellow "},
		y_min = 1,
		y_max = 31000,
		decoration = "trees:normal_black",
	})

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"comboblock:slab_yellow_onc_slab_yellow"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" yellow "},
		y_min = 1,
		y_max = 31000,
	 decoration = "trees:small_white",

	})
	
end


--
-- Detect mapgen, flags and parameters to select functions
--

-- Get setting or default
local mgv7_spflags = minetest.get_mapgen_setting("mgv7_spflags") or
	"mountains, ridges, nofloatlands"
local captures_float = string.match(mgv7_spflags, "floatlands")
local captures_nofloat = string.match(mgv7_spflags, "nofloatlands")

local mgv7_floatland_level = minetest.get_mapgen_setting("mgv7_floatland_level") or 1280
local mgv7_shadow_limit = minetest.get_mapgen_setting("mgv7_shadow_limit") or 1024

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

local mg_name = minetest.get_mapgen_setting("mg_name")

if mg_name == "v7" and captures_float == "floatlands" and
		captures_nofloat ~= "nofloatlands" then
	-- Mgv7 with floatlands
	default.register_biomes(mgv7_shadow_limit - 1)
	default.register_floatland_biomes(mgv7_floatland_level, mgv7_shadow_limit)
	default.register_decorations()
else
	default.register_biomes(31000)
	default.register_decorations()
end
