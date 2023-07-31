FB = {}
FB.NAME = "factory_bridges"

FB.LOCAL = function(s) return s end

dofile(minetest.get_modpath(FB.NAME).."/models.lua")
dofile(minetest.get_modpath(FB.NAME).."/nodes.lua")