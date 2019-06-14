
hud = {}

local path = minetest.get_modpath("hud")

dofile(path .. "/api.lua")
dofile(path .. "/builtin.lua")
dofile(path .. "/legacy.lua")

if PLATFORM == "Android" then

else

	dofile(path .. "/itemwheel.lua")
	
end