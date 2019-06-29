hud = {}
GameOS = 0

local path = minetest.get_modpath("hud")

if PLATFORM == "IOS" or PLATFORM == "Android" then
        GameOS = "Mobile"
else
        GameOS = "PC"
end

if GameOS == "Mobile" then

elseif GameOS == "PC" then

	dofile(path .. "/api.lua")
	dofile(path .. "/builtin.lua")
	dofile(path .. "/legacy.lua")
	dofile(path .. "/itemwheel.lua")

else
	
end