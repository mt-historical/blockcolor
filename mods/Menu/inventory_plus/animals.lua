-- Adult & Baby

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.panda then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'mobs_animal:adultpanda')
player:get_inventory():add_item('main', 'mobs_animal:babypanda')

player:get_inventory():add_item('main', 'mobs_animal:adultpig')
player:get_inventory():add_item('main', 'mobs_animal:babypig')

player:get_inventory():add_item('main', 'mobs_animal:adultalien')
player:get_inventory():add_item('main', 'mobs_animal:babyalien')

player:get_inventory():add_item('main', 'mobs:lasso')
player:get_inventory():add_item('main', 'mobs:nametag')

end 
end
)
