
-- Normal Trees

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.normaltrees then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'trees:normal_white')
player:get_inventory():add_item('main', 'trees:normal_black')
player:get_inventory():add_item('main', 'trees:normal_red')
player:get_inventory():add_item('main', 'trees:normal_orange')
player:get_inventory():add_item('main', 'trees:normal_yellow')
player:get_inventory():add_item('main', 'trees:normal_pink')
player:get_inventory():add_item('main', 'trees:normal_green')
player:get_inventory():add_item('main', 'trees:normal_blue')

end 
end
)


-- Small Trees

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.smalltrees then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'trees:small_white')
player:get_inventory():add_item('main', 'trees:small_black')
player:get_inventory():add_item('main', 'trees:small_red')
player:get_inventory():add_item('main', 'trees:small_orange')
player:get_inventory():add_item('main', 'trees:small_yellow')
player:get_inventory():add_item('main', 'trees:small_pink')
player:get_inventory():add_item('main', 'trees:small_green')
player:get_inventory():add_item('main', 'trees:small_blue')

end 
end
)

-- Big Trees

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.bigtrees then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'trees:big_white')
player:get_inventory():add_item('main', 'trees:big_black')
player:get_inventory():add_item('main', 'trees:big_red')
player:get_inventory():add_item('main', 'trees:big_orange')
player:get_inventory():add_item('main', 'trees:big_yellow')
player:get_inventory():add_item('main', 'trees:big_pink')
player:get_inventory():add_item('main', 'trees:big_green')
player:get_inventory():add_item('main', 'trees:big_blue')

end 
end
)

