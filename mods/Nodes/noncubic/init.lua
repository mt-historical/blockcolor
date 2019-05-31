-- NonCubic Blocks MOD v1.4
------------by yves_de_beck




-- HERE YOU CAN CHANGE THE DETAIL-LEVEL:
----------------------------------------
detail_level = 16


-- HERE YOU CAN DE/ACTIVATE BACKGROUND FOR MILLING MENU:
--------------------------------------------------------
allow_menu_background = false


-- VAR DECLARATION:
-------------------
noncubic = {}


-- REGISTER NONCUBIC FORMS, CREATE MODELS AND RECIPES:
------------------------------------------------------

-- SLOPE
--------
function noncubic.register_slope(subname, recipeitem, groups, images, description)

local slopebox = {}
local detail = detail_level
for i = 0, detail-1 do
	slopebox[i+1]={-0.5, (i/detail)-0.5, (i/detail)-0.5, 0.5, (i/detail)-0.5+(1/detail), 0.5}
end
minetest.register_node("noncubic:slope_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopebox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},		
		},
	})
	minetest.register_craft({
		output = 'noncubic:slope_' .. subname .. ' 6',
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},		
		},
	})

end


-- SLOPE Lying
----------------
function noncubic.register_slope_lying(subname, recipeitem, groups, images, description)

local slopeboxlying = {}
local detail = detail_level
for i = 0, detail-1 do
	slopeboxlying[i+1]={(i/detail)-0.5, -0.5, (i/detail)-0.5, (i/detail)-0.5+(1/detail), 0.5 , 0.5}
end
minetest.register_node("noncubic:slope_lying_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopeboxlying,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_lying_' .. subname .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:slope_' .. subname, ""},
			{"", "", ""},		
		},
	})

end


-- SLOPE UPSIDE DOWN
--------------------
function noncubic.register_slope_upsdown(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

local slopeupdwnbox = {}
local detail = detail_level
for i = 0, detail-1 do
	slopeupdwnbox[i+1]={-0.5, (i/detail)-0.5, (-1*(i/detail))+0.5-(1/detail), 0.5, (i/detail)-0.5+(1/detail), 0.5}
end
minetest.register_node("noncubic:slope_upsdown_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopeupdwnbox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_upsdown_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
			{"", recipeitem, recipeitem},	
			{"", "", recipeitem},	
		},
	})
	minetest.register_craft({
		output = 'noncubic:slope_upsdown_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
			{recipeitem, recipeitem, ""},	
			{recipeitem, "", ""},	
		},
	})

end


-- SLOPE EDGE
-------------
function noncubic.register_slope_edge(subname, recipeitem, groups, images, description)

local slopeboxedge = {}
local detail = detail_level
for i = 0, detail-1 do
	slopeboxedge[i+1]={(i/detail)-0.5, -0.5, (i/detail)-0.5, 0.5, (i/detail)-0.5+(1/detail), 0.5}
end
minetest.register_node("noncubic:slope_edge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopeboxedge,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_edge_' .. subname .. ' 3',
		recipe = {
			{"", "", ""},
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},		
		},
	})
	minetest.register_craft({
		output = 'noncubic:slope_edge_' .. subname .. ' 3',
		recipe = {
			{"", "", ""},
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},		
		},
	})

end


-- SLOPE INNER EDGE
-------------------
function noncubic.register_slope_inner_edge(subname, recipeitem, groups, images, description)

minetest.register_node("noncubic:slope_inner_edge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {
			-- PART 1
			{-0.5, -0.5, -0.5, 0.5, -0.45, 0.5},
			{-0.45, -0.5, -0.5, 0.5, -0.4, 0.5},
			{-0.4, -0.5, -0.5, 0.5, -0.35, 0.5},
			{-0.35, -0.5, -0.5, 0.5, -0.3, 0.5},
			{-0.3, -0.5, -0.5, 0.5, -0.25, 0.5},
			{-0.25, -0.5, -0.5, 0.5, -0.2, 0.5},
			{-0.2, -0.5, -0.5, 0.5, -0.15, 0.5},
			{-0.15, -0.5, -0.5, 0.5, -0.1, 0.5},
			{-0.1, -0.5, -0.5, 0.5, -0.05, 0.5},
			{-0.05, -0.5, -0.5, 0.5, 0, 0.5},
			{0, -0.5, -0.5, 0.5, 0.05, 0.5},
			{0.05, -0.5, -0.5, 0.5, 0.1, 0.5},
			{0.1, -0.5, -0.5, 0.5, 0.15, 0.5},
			{0.15, -0.5, -0.5, 0.5, 0.2, 0.5},
			{0.2, -0.5, -0.5, 0.5, 0.25, 0.5},
			{0.25, -0.5, -0.5, 0.5, 0.3, 0.5},
			{0.3, -0.5, -0.5, 0.5, 0.35, 0.5},
			{0.35, -0.5, -0.5, 0.5, 0.4, 0.5},
			{0.4, -0.5, -0.5, 0.5, 0.45, 0.5},
			{0.45, -0.5, -0.5, 0.5, 0.5, 0.5},
			-- PART 2
			{-0.5, -0.5, -0.45, 0.5, -0.45, 0.5},
			{-0.5, -0.5, -0.4, 0.5, -0.4, 0.5},
			{-0.5, -0.5, -0.35, 0.5, -0.35, 0.5},
			{-0.5, -0.5, -0.3, 0.5, -0.3, 0.5},
			{-0.5, -0.5, -0.25, 0.5, -0.25, 0.5},
			{-0.5, -0.5, -0.2, 0.5, -0.2, 0.5},
			{-0.5, -0.5, -0.15, 0.5, -0.15, 0.5},
			{-0.5, -0.5, -0.1, 0.5, -0.1, 0.5},
			{-0.5, -0.5, -0.05, 0.5, -0.05, 0.5},
			{-0.5, -0.5, 0, 0.5, 0, 0.5},
			{-0.5, -0.5, 0.05, 0.5, 0.05, 0.5},
			{-0.5, -0.5, 0.1, 0.5, 0.1, 0.5},
			{-0.5, -0.5, 0.15, 0.5, 0.15, 0.5},
			{-0.5, -0.5, 0.2, 0.5, 0.2, 0.5},
			{-0.5, -0.5, .25, 0.5, 0.25, 0.5},
			{-0.5, -0.5, 0.3, 0.5, 0.3, 0.5},
			{-0.5, -0.5, 0.35, 0.5, 0.35, 0.5},
			{-0.5, -0.5, 0.4, 0.5, 0.4, 0.5},
			{-0.5, -0.5, 0.45, 0.5, 0.45, 0.5},
			{-0.5, -0.5, 0.5, 0.5, 0.5, 0.5},
			},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_inner_edge_' .. subname .. ' 3',
		recipe = {
			{"", "", recipeitem},
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},		
		},
	})
	minetest.register_craft({
		output = 'noncubic:slope_inner_edge_' .. subname .. ' 3',
		recipe = {
			{recipeitem, "", ""},
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},		
		},
	})

end


-- SLOPE EDGE UPSIDE DOWN
-------------------------
function noncubic.register_slope_upsdown_edge(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

local slopeupdwnboxedge = {}
local detail = detail_level
for i = 0, detail-1 do
	slopeupdwnboxedge[i+1]={(-1*(i/detail))+0.5-(1/detail), (i/detail)-0.5, (-1*(i/detail))+0.5-(1/detail), 0.5, (i/detail)-0.5+(1/detail), 0.5}
end
minetest.register_node("noncubic:slope_upsdown_edge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = slopeupdwnboxedge,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_upsdown_edge_' .. subname .. ' 3',
		recipe = {
			{"", recipeitem, recipeitem},
			{"", "", recipeitem},	
			{"", "", ""},	
		},
	})
	minetest.register_craft({
		output = 'noncubic:slope_upsdown_edge_' .. subname .. ' 3',
		recipe = {
			{recipeitem, recipeitem, ""},
			{recipeitem, "", ""},	
			{"", "", ""},	
		},
	})

end


-- SLOPE INNER EDGE UPSIDE DOWN
-------------------------------
function noncubic.register_slope_upsdown_inner_edge(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

minetest.register_node("noncubic:slope_upsdown_inner_edge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.45, -0.5, -0.5, 0.5, -0.45, 0.5},
			{0.4, -0.45, -0.5, 0.5, -0.4, 0.5},
			{0.35, -0.4, -0.5, 0.5, -0.35, 0.5},
			{0.3, -0.35, -0.5, 0.5, -0.3, 0.5},
			{0.25, -0.3, -0.5, 0.5, -0.25, 0.5},
			{0.2, -0.25, -0.5, 0.5, -0.2, 0.5},
			{0.15, -0.2, -0.5, 0.5, -0.15, 0.5},
			{0.1, -0.15, -0.5, 0.5, -0.1, 0.5},
			{0.05, -0.1, -0.5, 0.5, -0.05, 0.5},
			{0, -0.05, -0.5, 0.5, 0, 0.5},
			{-0.05, 0, -0.5, 0.5, 0.05, 0.5},
			{-0.1, 0.05, -0.5, 0.5, 0.1, 0.5},
			{-0.15, 0.1, -0.5, 0.5, 0.15, 0.5},
			{-0.2, 0.15, -0.5, 0.5, 0.2, 0.5},
			{-0.25, 0.2, -0.5, 0.5, 0.25, 0.5},
			{-0.3, 0.25, -0.5, 0.5, 0.3, 0.5},
			{-0.35, 0.3, -0.5, 0.5, 0.35, 0.5},
			{-0.4, 0.35, -0.5, 0.5, 0.4, 0.5},
			{-0.45, 0.4, -0.5, 0.5, 0.45, 0.5},
			{-0.5, 0.45, -0.5, 0.5, 0.5, 0.5},

			{-0.5, -0.5, 0.45, 0.5, -0.45, 0.5},
			{-0.5, -0.45, 0.4, 0.5, -0.4, 0.5},
			{-0.5, -0.4, 0.35, 0.5, -0.35, 0.5},
			{-0.5, -0.35, 0.3, 0.5, -0.3, 0.5},
			{-0.5, -0.3, 0.25, 0.5, -0.25, 0.5},
			{-0.5, -0.25, 0.2, 0.5, -0.2, 0.5},
			{-0.5, -0.2, 0.15, 0.5, -0.15, 0.5},
			{-0.5, -0.15, 0.1, 0.5, -0.1, 0.5},
			{-0.5, -0.1, 0.05, 0.5, -0.05, 0.5},
			{-0.5, -0.05, 0, 0.5, 0, 0.5},
			{-0.5, 0, -0.05, 0.5, 0.05, 0.5},
			{-0.5, 0.05, -0.1, 0.5, 0.1, 0.5},
			{-0.5, 0.1, -0.15, 0.5, 0.15, 0.5},
			{-0.5, 0.15, -0.2, 0.5, 0.2, 0.5},
			{-0.5, 0.2, -0.25, 0.5, 0.25, 0.5},
			{-0.5, 0.25, -0.3, 0.5, 0.3, 0.5},
			{-0.5, 0.3, -0.35, 0.5, 0.35, 0.5},
			{-0.5, 0.35, -0.4, 0.5, 0.4, 0.5},
			{-0.5, 0.4, -0.45, 0.5, 0.45, 0.5},
			{-0.5, 0.45, -0.5, 0.5, 0.5, 0.5},

			},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:slope_upsdown_inner_edge_' .. subname .. ' 3',
		recipe = {
			{"", recipeitem, recipeitem},
			{"", "", recipeitem},
			{recipeitem, "", ""},		
		},
	})
	minetest.register_craft({
		output = 'noncubic:slope_upsdown_inner_edge_' .. subname .. ' 3',
		recipe = {
			{recipeitem, recipeitem, ""},
			{recipeitem, "", ""},
			{"", "", recipeitem},		
		},
	})

end


-- PYRAMID
----------
function noncubic.register_pyramid(subname, recipeitem, groups, images, description)

local pyrabox = {}
local detail = detail_level/2
for i = 0, detail-1 do
	pyrabox[i+1]={(i/detail/2)-0.5, (i/detail/2)-0.5, (i/detail/2)-0.5, 0.5-(i/detail/2), (i/detail/2)-0.5+(1/detail), 0.5-(i/detail/2)}
end
minetest.register_node("noncubic:pyramid_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = pyrabox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:pyramid_' .. subname .. ' 3',
		recipe = {
			{"", "", ""},
			{"", recipeitem, ""},
			{recipeitem, "", recipeitem},		
		},
	})

end


-- SPIKE
--------
function noncubic.register_spike(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

local spikebox = {}
local detail = detail_level
for i = 0, detail-1 do
	spikebox[i+1]={(i/detail/2)-0.5, (i/detail/2)-0.5, (i/detail/2)-0.5, 0.5-(i/detail/2), (i/detail)-0.5+(1/detail), 0.5-(i/detail/2)}
end
minetest.register_node("noncubic:spike_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = spikebox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:spike_' .. subname .. ' 5',
		recipe = {
			{"", recipeitem, ""},
			{recipeitem, "", recipeitem},
			{recipeitem, "", recipeitem},		
		},
	})

end


-- Block one curved edge 
------------------------
function noncubic.register_onecurvededge(subname, recipeitem, groups, images, description)

local quartercyclebox = {}
local detail = detail_level*2
local sehne
for i = (detail/2)-1, detail-1 do
	sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
	quartercyclebox[i]={-0.5, -0.5, -sehne, 0.5, (i/detail)+(1/detail)-0.5, 0.5}
end
minetest.register_node("noncubic:onecurvededge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = quartercyclebox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:onecurvededge_' .. subname .. ' 8',
		recipe = {
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},		
		},
	})

end


-- Block two curved edges 
-------------------------
function noncubic.register_twocurvededge(subname, recipeitem, groups, images, description)

local quartercyclebox2 = {}
local detail = detail_level*2
local sehne
for i = (detail/2)-1, detail-1 do
	sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
	quartercyclebox2[i]={-sehne, -0.5, -sehne, 0.5, (i/detail)+(1/detail)-0.5, 0.5}
end
minetest.register_node("noncubic:twocurvededge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = quartercyclebox2,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:twocurvededge_' .. subname .. ' 3',
		recipe = {
			{"", "", ""},
			{'noncubic:onecurvededge_' .. subname, "", ""},
			{'noncubic:onecurvededge_' .. subname, 'noncubic:onecurvededge_' .. subname, ""},		
		},
	})

end



-- Cylinder
-----------
function noncubic.register_cylinder(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

local cylbox = {}
local detail = detail_level
local sehne
for i = 1, detail-1 do
	sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
	cylbox[i]={(i/detail)-0.5, -0.5, -sehne, (i/detail)+(1/detail)-0.5, 0.5, sehne}
end
minetest.register_node("noncubic:cylinder_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = cylbox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:cylinder_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, ""},		
		},
	})
	minetest.register_craft({
		output = 'noncubic:cylinder_' .. subname .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:cylinder_horizontal_' .. subname, ""},
			{"", "", ""},		
		},
	})

end


-- Cylinder Horizontal
----------------------
function noncubic.register_cylinder_horizontal(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

local cylbox_horizontal = {}
local detail = detail_level
local sehne
for i = 1, detail-1 do
	sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
	cylbox_horizontal[i]={-0.5, (i/detail)-0.5, -sehne, 0.5, (i/detail)+(1/detail)-0.5, sehne}
end
minetest.register_node("noncubic:cylinder_horizontal_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = cylbox_horizontal,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:cylinder_horizontal_' .. subname .. ' 6',
		recipe = {
			{"", "", ""},
			{recipeitem, recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},		
		},
	})
	minetest.register_craft({
		output = 'noncubic:cylinder_horizontal_' .. subname .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:cylinder_' .. subname, ""},
			{"", "", ""},		
		},
	})

end


-- Sphere
---------
function noncubic.register_sphere(subname, recipeitem, groups, images, description)

if subname == "dirt" then
return
end

local spherebox = {}
local detail = detail_level
local sehne
for i = 1, detail-1 do
	sehne = math.sqrt(0.25 - (((i/detail)-0.5)^2))
	spherebox[i]={-sehne, (i/detail)-0.5, -sehne, sehne, (i/detail)+(1/detail)-0.5, sehne}
end
minetest.register_node("noncubic:cylinder_sphere_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = spherebox,
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:cylinder_sphere_' .. subname .. ' 4',
		recipe = {
			{"", recipeitem, ""},
			{recipeitem, "", recipeitem},
			{"", recipeitem, ""},		
		},
	})

end


-- Element straight
-------------------
function noncubic.register_element_straight(subname, recipeitem, groups, images, description)

minetest.register_node("noncubic:element_straight_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.5, 0.3, 0, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.5},
			},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:element_straight_' .. subname .. ' 12',
		recipe = {
			{"", recipeitem, ""},
			{"", recipeitem, ""},
			{"", recipeitem, ""},		
		},
	})

end


-- Element Edge
---------------
function noncubic.register_element_edge(subname, recipeitem, groups, images, description)

minetest.register_node("noncubic:element_edge_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:element_edge_' .. subname .. ' 10',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
			{"", "", recipeitem},
			{"", "", recipeitem},		
			},
	})

end


-- Element T
------------
function noncubic.register_element_t(subname, recipeitem, groups, images, description)

minetest.register_node("noncubic:element_t_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0, 0.3},
			},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0, 0.3},
			},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:element_t_' .. subname .. ' 8',
		recipe = {
			{"", "", ""},
			{recipeitem, recipeitem, recipeitem},
			{"", recipeitem, ""},		
			},
	})

end


-- Element Cross
----------------
function noncubic.register_element_cross(subname, recipeitem, groups, images, description)

minetest.register_node("noncubic:element_cross_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3, -0.5, -0.3, 0.5, 0, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3, -0.5, -0.3, 0.5, 0, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0, 0.3},
			},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:element_cross_' .. subname .. ' 10',
		recipe = {
			{"", recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
			{"", recipeitem, ""},		
			},
	})

end


-- Element End
--------------
function noncubic.register_element_end(subname, recipeitem, groups, images, description)

minetest.register_node("noncubic:element_end_" .. subname, {
	description = description,
	drawtype = "nodebox",
	tiles = images,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0, 0.5},
	},
	groups = groups,
	})
	minetest.register_craft({
		output = 'noncubic:element_end_' .. subname .. ' 8',
		recipe = {
			{"", "", ""},
			{"", recipeitem, ""},
			{"", recipeitem, ""},		
			},
	})

end


-- Element straight DOUBLE
--------------------------
function noncubic.register_element_straight_double(subname3, recipeitem3, groups3, images3, description3)

minetest.register_node("noncubic:element_straight_double_" .. subname3, {
	description = description3,
	drawtype = "nodebox",
	tiles = images3,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
			},
	},
	groups = groups3,
	})
	minetest.register_craft({
		output = 'noncubic:element_straight_double_' .. subname3 .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:element_straight_' .. recipeitem3, ""},
			{"", 'noncubic:element_straight_' .. recipeitem3, ""},		
		},
	})

end


-- Element Edge DOUBLE
----------------------
function noncubic.register_element_edge_double(subname3, recipeitem3, groups3, images3, description3)

minetest.register_node("noncubic:element_edge_double_" .. subname3, {
	description = description3,
	drawtype = "nodebox",
	tiles = images3,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			},
	},
	groups = groups3,
	})
	minetest.register_craft({
		output = 'noncubic:element_edge_double_' .. subname3 .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:element_edge_' .. recipeitem3, ""},
			{"", 'noncubic:element_edge_' .. recipeitem3, ""},		
		},
	})

end


-- Element T DOUBLE
-------------------
function noncubic.register_element_t_double(subname3, recipeitem3, groups3, images3, description3)

minetest.register_node("noncubic:element_t_double_" .. subname3, {
	description = description3,
	drawtype = "nodebox",
	tiles = images3,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3},
			},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.3},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3},
			},
	},
	groups = groups3,
	})
	minetest.register_craft({
		output = 'noncubic:element_t_double_' .. subname3 .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:element_t_' .. recipeitem3, ""},
			{"", 'noncubic:element_t_' .. recipeitem3, ""},		
		},
	})

end


-- Element Cross Double
-----------------------
function noncubic.register_element_cross_double(subname3, recipeitem3, groups3, images3, description3)

minetest.register_node("noncubic:element_cross_double_" .. subname3, {
	description = description3,
	drawtype = "nodebox",
	tiles = images3,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3, -0.5, -0.3, 0.5, 0.5, 0.3},
			{-0.3, -0.5, -0.5, 0.3, 0.5, 0.5},
			{-0.5, -0.5, -0.3, -0.3, 0.5, 0.3},
			},
	},
	groups = groups3,
	})
	minetest.register_craft({
		output = 'noncubic:element_cross_double_' .. subname3 .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:element_cross_' .. recipeitem3, ""},
			{"", 'noncubic:element_cross_' .. recipeitem3, ""},		
			},
	})

end


-- Element End Double
---------------------
function noncubic.register_element_end_double(subname3, recipeitem3, groups3, images3, description3)

minetest.register_node("noncubic:element_end_double_" .. subname3, {
	description = description3,
	drawtype = "nodebox",
	tiles = images3,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.5},
	},
	node_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.5},
	},
	groups = groups3,
	})
	minetest.register_craft({
		output = 'noncubic:element_end_double_' .. subname3 .. ' 1',
		recipe = {
			{"", "", ""},
			{"", 'noncubic:element_end_' .. recipeitem3, ""},
			{"", 'noncubic:element_end_' .. recipeitem3, ""},		
			},
	})

end


-- STICK
--------
function noncubic.register_stick(subname2, recipeitem2, groups2, images2, description2)

minetest.register_node("noncubic:stick_" .. subname2, {
	description = description2,
	drawtype = "nodebox",
	tiles = images2,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15},
	},
	node_box = {
		type = "fixed",
		fixed = {-0.15, -0.5, -0.15, 0.15, 0.5, 0.15},
	},
	groups = groups2,
	})
	minetest.register_craft({
		output = 'noncubic:stick_' .. subname2 .. ' 8',
		recipe = {
			{'default:stick', "", ""},
			{"", "", ""},
			{recipeitem2, "", ""},		
		},
	})

end


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
	local color1 = source_list[i][1]
	local color2 = source_list[i][2]
	local color3 = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]

-- REGISTER NEW NONCUBIC's PART 2: noncubic.register_element_end(subname, recipeitem, groups, images, desc_element_xyz)
-----------------------------------------------------------------------------------------------------------------------
function noncubic.register_slope_edge_etc(subname, recipeitem, groups, images, desc_slope, desc_slope_lying, desc_slope_upsdown, desc_slope_edge, desc_slope_inner_edge, desc_slope_upsdwn_edge, desc_slope_upsdwn_inner_edge, desc_pyramid, desc_spike, desc_onecurvededge, desc_twocurvededge, desc_cylinder, desc_cylinder_horizontal, desc_sphere, desc_element_straight, desc_element_edge, desc_element_t, desc_element_cross, desc_element_end)
         noncubic.register_slope(subname, recipeitem, groups, images, desc_slope)
         noncubic.register_slope_lying(subname, recipeitem, groups, images, desc_slope_lying)
	 noncubic.register_slope_upsdown(subname, recipeitem, groups, images, desc_slope_upsdown)
         noncubic.register_slope_edge(subname, recipeitem, groups, images, desc_slope_edge)
         noncubic.register_slope_inner_edge(subname, recipeitem, groups, images, desc_slope_inner_edge)
	 noncubic.register_slope_upsdown_edge(subname, recipeitem, groups, images, desc_slope_upsdwn_edge)
	 noncubic.register_slope_upsdown_inner_edge(subname, recipeitem, groups, images, desc_slope_upsdwn_inner_edge)
         noncubic.register_pyramid(subname, recipeitem, groups, images, desc_pyramid)
         noncubic.register_spike(subname, recipeitem, groups, images, desc_spike)
         noncubic.register_onecurvededge(subname, recipeitem, groups, images, desc_onecurvededge)
         noncubic.register_twocurvededge(subname, recipeitem, groups, images, desc_twocurvededge)
         noncubic.register_cylinder(subname, recipeitem, groups, images, desc_cylinder)
         noncubic.register_cylinder_horizontal(subname, recipeitem, groups, images, desc_cylinder_horizontal)
	 noncubic.register_sphere(subname, recipeitem, groups, images, desc_sphere)
	 noncubic.register_element_straight(subname, recipeitem, groups, images, desc_element_straight)
	 noncubic.register_element_edge(subname, recipeitem, groups, images, desc_element_edge)
	 noncubic.register_element_t(subname, recipeitem, groups, images, desc_element_t)
	 noncubic.register_element_cross(subname, recipeitem, groups, images, desc_element_cross)
	 noncubic.register_element_end(subname, recipeitem, groups, images, desc_element_end)
end


-- REGISTER MATERIALS AND PROPERTIES FOR NONCUBIC ELEMENTS:
-----------------------------------------------------------

-- Red
-------
noncubic.register_slope_edge_etc("" .. color1 .. "", "color:" .. color1,
                {snappy=2,choppy=2,oddly_breakable_by_hand=2},
                {"color_" .. color1 .. ".png"},
                "Red Slope",
   color1 .. "Slope Lying",
	color1 .. "Slope Upside Down",
   color1 .. "Slope Edge",
   color1 .. "Slope Inner Edge",
	color1 .. "Slope Upside Down Edge",
		color1 .. "Slope Upside Down Inner Edge",
		color1 .. "Pyramid",
		color1 .. "Spike",
		color1 .. "One Curved Edge Block",
		color1 .. "Two Curved Edge Block",
		color1 .. "Cylinder",
		color1 .. "Cylinder Horizontal",
		color1 .. "Sphere",
		color1 .. "Element Straight",
		color1 .. "Element Edge",
		color1 .. "Element T",
		color1 .. "Element Cross",
		color1 .. "Element End")

-- REGISTER STICKS: noncubic.register_xyz(subname2, recipeitem2, groups2, images2, desc_element_xyz)
------------------------------------------------------------------------------------------------------------
function noncubic.register_stick_etc(subname2, recipeitem2, groups2, images2, desc_stick)
         noncubic.register_stick(subname2, recipeitem2, groups2, images2, desc_stick)
end

-- REGISTER MATERIALS AND PROPERTIES FOR STICKS:
------------------------------------------------

-- WOOD
-------
noncubic.register_stick_etc("wood", "default:wood",
                {snappy=2,choppy=2,oddly_breakable_by_hand=2},
                {"default_wood.png"},
                "Wooden Stick")
-- STONE
--------
noncubic.register_stick_etc("stone", "default:stone",
                {cracky=3},
                {"default_stone.png"},
                "Stone Stick")
-- COBBLE
---------
noncubic.register_stick_etc("cobble", "default:cobble",
                {cracky=3},
                {"default_cobble.png"},
                "Cobble Stick")
-- BRICK
--------
noncubic.register_stick_etc("brick", "default:brick",
                {cracky=3},
                {"default_brick.png"},
                "Brick Stick")
-- SANDSTONE
------------
noncubic.register_stick_etc("sandstone", "default:sandstone",
                {crumbly=2,cracky=2},
                {"default_sandstone.png"},
                "Sandstone Stick")
-- LEAVES
---------
noncubic.register_stick_etc("leaves", "default:leaves",
                {snappy=2,choppy=2,oddly_breakable_by_hand=3},
                {"bucharest_tree.png"},
                "Leaves Stick")
-- TREE
-------
noncubic.register_stick_etc("tree", "default:tree",
                {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
                {"default_tree.png"},
		"Tree Stick")
-- STEEL
--------
noncubic.register_stick_etc("steel", "default:steelblock",
                {snappy=1,bendy=2,cracky=1,melty=2,level=2},
                {"default_steel_block.png"},
                "Steel Stick")

-- REGISTER DOUBLE ELEMNTS: noncubic.register_xyz(subname3, recipeitem3, groups3, images3, desc_element_xyz)
----------------------------------------------------------------------------------------------------
function noncubic.register_elements(subname3, recipeitem3, groups3, images3, desc_element_straight_double, desc_element_edge_double, desc_element_t_double, desc_element_cross_double, desc_element_end_double)
         noncubic.register_element_straight_double(subname3, recipeitem3, groups3, images3, desc_element_straight_double)
         noncubic.register_element_edge_double(subname3, recipeitem3, groups3, images3, desc_element_edge_double)
         noncubic.register_element_t_double(subname3, recipeitem3, groups3, images3, desc_element_t_double)
         noncubic.register_element_cross_double(subname3, recipeitem3, groups3, images3, desc_element_cross_double)
         noncubic.register_element_end_double(subname3, recipeitem3, groups3, images3, desc_element_end_double)
end

-- REGISTER MATERIALS AND PROPERTIES FOR HALF AND NORMAL HEIGHT ELEMENTS:
-------------------------------------------------------------------------

-- WOOD
-------
noncubic.register_elements(color1, "color:" ..color1,
                {snappy=2,choppy=2,oddly_breakable_by_hand=2},
                {"color_" .. color1 ..".png"},
             color1 ..   " Element Straight Double",
               color1 .. "Element Edge Double",
	color1 ..	"Element T Double",
	color1 .. "Element Cross Double",
	color1 .. "Element End Double")

end
