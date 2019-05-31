-- Start Planet

-- Earth

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	 
if fields.earth then --main page		
		
earth_command = {}
earth_command.pos = {x=0, y=27, z=0}

        local player = minetest.get_player_by_name(name)
        if player == nil then
            -- just a check to prevent the server crashing
            return false
        end
        local pos = player:getpos()
        
            player:setpos(earth_command.pos)
            minetest.chat_send_player(name, "Teleported to Earth!")

end
end
)

-- Earth

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	 
if fields.mars then --main page		
		
earth_command = {}
earth_command.pos = {x=0, y=7027, z=0}

        local player = minetest.get_player_by_name(name)
        if player == nil then
            -- just a check to prevent the server crashing
            return false
        end
        local pos = player:getpos()
        
            player:setpos(earth_command.pos)
            minetest.chat_send_player(name, "Teleported to Mars!")

end
end
)

-- Moon

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	 
if fields.moon then --main page		
		
moon_command = {}
moon_command.pos = {x=0, y=5027, z=0}

        local player = minetest.get_player_by_name(name)
        if player == nil then
            -- just a check to prevent the server crashing
            return false
        end
        local pos = player:getpos()
        
            player:setpos(moon_command.pos)
            minetest.chat_send_player(name, "Teleported to Moon!")

end
end
)

-- End Planets
