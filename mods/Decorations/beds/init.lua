local player_in_bed = 0

local beds_list = {
	{"black", "Darkened", color1, 40, 36, 33}, 
	{"blue", "Blue", color2, 0, 0, 255},
	{"green", "Green", color3, 0, 255, 0}, 
	{"white", "White", color4, 245, 245, 245}, 
	{"orange", "Orange", color5, 255, 97, 3}, 
	{"red", "Red", color6, 255, 0, 0}, 
	{"yellow", "Yellow", color7, 255, 255, 0}, 
	{"pink", "Pink", color8, 255, 105, 180}
}

for i in ipairs(beds_list) do
	local colour = beds_list[i][1]
	local beddesc= beds_list[i][2]
local colour2 = beds_list[i][3]

	minetest.register_node("beds:bed_bottom_"..colour, {
		description = beddesc,
		drawtype = "nodebox",
		tiles = {"color_white.png^[colorize:#"..colour2..":70", "color_orange.png",  "color_orange.png",  "color_orange.png",  "color_orange.png",  "color_orange.png"},
wield_image = "color_hand" .. colour .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
inventory_image = "beds.png^[colorize:#".. colour2 .. ":70",
		paramtype = "light",
		paramtype2 = "facedir",
		stack_max = 1,
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = {
			type = "fixed",
			fixed = {
						-- bed
               	{-0.5, -0.25, -0.5, 0.5, 0, 0.5},
					 	{-0.4375, 0, 0.1, -0.4375, 0, 0.1},
						-- legs
				{-0.5, -0.5, -0.5, -0.4, -0.25, -0.4},
				{0.4, -0.25, -0.4, 0.5, -0.5, -0.5},
					}
		},
		selection_box = {
			type = "fixed",
			fixed = {
						{-0.5, -0.5, -0.5, 0.5, 0.3125, 1.5},
					}
		},

		after_place_node = function(pos, placer, itemstack)
			local node = minetest.env:get_node(pos)
			local p = {x=pos.x, y=pos.y, z=pos.z}
			local param2 = node.param2
			node.name = "beds:bed_top_"..colour
			if param2 == 0 then
				pos.z = pos.z+1
			elseif param2 == 1 then
				pos.x = pos.x+1
			elseif param2 == 2 then
				pos.z = pos.z-1
			elseif param2 == 3 then
				pos.x = pos.x-1
			end
			if minetest.registered_nodes[minetest.env:get_node(pos).name].buildable_to  then
				minetest.env:set_node(pos, node)
			else
				minetest.env:remove_node(p)
				return true
			end
		end,
			
		on_destruct = function(pos)
			local node = minetest.env:get_node(pos)
			local param2 = node.param2
			if param2 == 0 then
				pos.z = pos.z+1
			elseif param2 == 1 then
				pos.x = pos.x+1
			elseif param2 == 2 then
				pos.z = pos.z-1
			elseif param2 == 3 then
				pos.x = pos.x-1
			end
			if( minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z}).name == "beds:bed_top_"..colour ) then
				if( minetest.env:get_node({x=pos.x, y=pos.y, z=pos.z}).param2 == param2 ) then
					minetest.env:remove_node(pos)
				end	
			end
		end,
		
		
	})
	
	minetest.register_node("beds:bed_top_"..colour, {
		drawtype = "nodebox",
		tiles = {"beds_bed_top_top.png^[colorize:#"..colour2..":70", "color_orange.png",  "color_orange.png",  "color_orange.png",  "color_orange.png",  "color_orange.png"},
		paramtype = "light",
		paramtype2 = "facedir",
wield_image = "color_hand" .. colour .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
		groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		sounds = default.node_sound_wood_defaults(),
		node_box = {
		type = "fixed",
			fixed = {
						-- bed
						{-0.5, -0.25, -0.5, 0.5, 0, 0.5},
						{-0.4375, 0, 0.05, 0.4375, 0.10, 0.45},
						
						-- legs
				{-0.4, -0.5, 0.4, -0.5, -0.25, 0.5},
				{0.5, -0.25, 0.5, 0.4, -0.5, 0.4},
					}
		},
		selection_box = {
			type = "fixed",
			fixed = {
						{0, 0, 0, 0, 0, 0},
					}
		},
	})
	
	minetest.register_alias("beds:bed_"..colour, "beds:bed_bottom_"..colour)
	
end

beds_player_spawns = {}
local file = io.open(minetest.get_worldpath().."/beds_player_spawns", "r")
if file then
	beds_player_spawns = minetest.deserialize(file:read("*all"))
	file:close()
end

local timer = 0
local wait = false
minetest.register_globalstep(function(dtime)
	if timer<2 then
		timer = timer+dtime
		return
	end
	timer = 0
	
	local players = #minetest.get_connected_players()
	if players == player_in_bed and players ~= 0 then
		if minetest.env:get_timeofday() < 0.2 or minetest.env:get_timeofday() > 0.805 then
			if not wait then
				minetest.chat_send_all("Good night!!!")
				minetest.after(2, function()
					minetest.env:set_timeofday(0.23)
					wait = false
				end)
				wait = true
				for _,player in ipairs(minetest.get_connected_players()) do
					beds_player_spawns[player:get_player_name()] = player:getpos()
				end
				local file = io.open(minetest.get_worldpath().."/beds_player_spawns", "w")
				if file then
					file:write(minetest.serialize(beds_player_spawns))
					file:close()
				end
			end
		end
	end
end)

minetest.register_on_respawnplayer(function(player)
	local name = player:get_player_name()
	if beds_player_spawns[name] then
		player:setpos(beds_player_spawns[name])
		return true
	end
end)

if minetest.setting_get("log_mods") then
	minetest.log("action", "beds loaded")
end
