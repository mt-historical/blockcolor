hud = {}

local path = minetest.get_modpath("hud")

if PLATFORM == "Android" then

else

dofile(path .. "/api.lua")
dofile(path .. "/builtin.lua")
dofile(path .. "/legacy.lua")
dofile(path .. "/itemwheel.lua")
	
end