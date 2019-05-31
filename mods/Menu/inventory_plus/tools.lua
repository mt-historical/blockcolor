-- Start Tools

-- Delete Stuff

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.none then --main page		
					
				 player:get_inventory():set_list("main", {})

end 
end
)

-- Rotate

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.rotate then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'screwdriver:screwdriver')

end 
end
)

-- End Tools