-- Spaceship

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.spaceship then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'spaceship:spaceshipwhite')
player:get_inventory():add_item('main', 'spaceship:spaceshipblack')
player:get_inventory():add_item('main', 'spaceship:spaceshipred')
player:get_inventory():add_item('main', 'spaceship:spaceshiporange')
player:get_inventory():add_item('main', 'spaceship:spaceshipyellow')
player:get_inventory():add_item('main', 'spaceship:spaceshippink')
player:get_inventory():add_item('main', 'spaceship:spaceshipgreen')
player:get_inventory():add_item('main', 'spaceship:spaceshipblue')

end 
end
)

-- Rails (Carts)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.rails then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'carts:railwhite')
player:get_inventory():add_item('main', 'carts:railblack')
player:get_inventory():add_item('main', 'carts:railred')
player:get_inventory():add_item('main', 'carts:railorange ')
player:get_inventory():add_item('main', 'carts:railyellow')
player:get_inventory():add_item('main', 'carts:railpink')
player:get_inventory():add_item('main', 'carts:railgreen')
player:get_inventory():add_item('main', 'carts:railblue')

end
end
)

-- Carts

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.carts then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'carts:cartwhite')
player:get_inventory():add_item('main', 'carts:cartblack')
player:get_inventory():add_item('main', 'carts:cartred')
player:get_inventory():add_item('main', 'carts:cartorange ')
player:get_inventory():add_item('main', 'carts:cartyellow')
player:get_inventory():add_item('main', 'carts:cartpink')
player:get_inventory():add_item('main', 'carts:cartgreen')
player:get_inventory():add_item('main', 'carts:cartblue')

end
end
)

-- HotairBalloon

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.hotairballoon then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hotairballoon:hotairwhite')
player:get_inventory():add_item('main', 'hotairballoon:hotairblack')
player:get_inventory():add_item('main', 'hotairballoon:hotairred')
player:get_inventory():add_item('main', 'hotairballoon:hotairorange ')
player:get_inventory():add_item('main', 'hotairballoon:hotairyellow')
player:get_inventory():add_item('main', 'hotairballoon:hotairpink')
player:get_inventory():add_item('main', 'hotairballoon:hotairgreen')
player:get_inventory():add_item('main', 'hotairballoon:hotairblue')

end
end
)

-- Hovercraft

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.hovercraft then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hovercraft:hover_white')
player:get_inventory():add_item('main', 'hovercraft:hover_black')
player:get_inventory():add_item('main', 'hovercraft:hover_red')
player:get_inventory():add_item('main', 'hovercraft:hover_orange')
player:get_inventory():add_item('main', 'hovercraft:hover_yellow')
player:get_inventory():add_item('main', 'hovercraft:hover_pink')
player:get_inventory():add_item('main', 'hovercraft:hover_green')
player:get_inventory():add_item('main', 'hovercraft:hover_blue')

end 
end
)

-- Airboat

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.airboat then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'airboat:airboatwhite')
player:get_inventory():add_item('main', 'airboat:airboatblack')
player:get_inventory():add_item('main', 'airboat:airboatred')
player:get_inventory():add_item('main', 'airboat:airboatorange')
player:get_inventory():add_item('main', 'airboat:airboatyellow')
player:get_inventory():add_item('main', 'airboat:airboatpink')
player:get_inventory():add_item('main', 'airboat:airboatgreen')
player:get_inventory():add_item('main', 'airboat:airboatblue')

end 
end
)

-- Cars 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cars then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'driftcar:driftcarwhite')
player:get_inventory():add_item('main', 'driftcar:driftcarblack')
player:get_inventory():add_item('main', 'driftcar:driftcarred')
player:get_inventory():add_item('main', 'driftcar:driftcarorange')
player:get_inventory():add_item('main', 'driftcar:driftcaryellow')
player:get_inventory():add_item('main', 'driftcar:driftcarpink')
player:get_inventory():add_item('main', 'driftcar:driftcargreen')
player:get_inventory():add_item('main', 'driftcar:driftcarblue')

end 
end
)

-- SurfBoard

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.surfboard then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'surfboard:boardwhite')
player:get_inventory():add_item('main', 'surfboard:boardblack')
player:get_inventory():add_item('main', 'surfboard:boardred')
player:get_inventory():add_item('main', 'surfboard:boardorange')
player:get_inventory():add_item('main', 'surfboard:boardyellow')
player:get_inventory():add_item('main', 'surfboard:boardpink')
player:get_inventory():add_item('main', 'surfboard:boardgreen')
player:get_inventory():add_item('main', 'surfboard:boardblue')

end 
end
)
