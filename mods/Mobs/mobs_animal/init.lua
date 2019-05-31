
local path = minetest.get_modpath("mobs_animal")

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")
mobs.intllib = S

-- Animals

dofile(path .. "/adultpanda.lua") 
dofile(path .. "/babypanda.lua") 

dofile(path .. "/adultpig.lua")
dofile(path .. "/babypig.lua") 

dofile(path .. "/adultalien.lua") 
dofile(path .. "/babyalien.lua") 

print (("Panda, Pig and Alien are Here."))
