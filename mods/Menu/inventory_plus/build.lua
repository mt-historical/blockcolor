-- Start Builds Nodes

-- Edge

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.edge then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:edge_white')
player:get_inventory():add_item('main', 'slope:edge_black')
player:get_inventory():add_item('main', 'slope:edge_red')
player:get_inventory():add_item('main', 'slope:edge_orange')
player:get_inventory():add_item('main', 'slope:edge_yellow')
player:get_inventory():add_item('main', 'slope:edge_pink')
player:get_inventory():add_item('main', 'slope:edge_green')
player:get_inventory():add_item('main', 'slope:edge_blue')

end 
end
)

-- Edge Corner

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.edgecorner then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:edgecorner_white')
player:get_inventory():add_item('main', 'slope:edgecorner_black')
player:get_inventory():add_item('main', 'slope:edgecorner_red')
player:get_inventory():add_item('main', 'slope:edgecorner_orange')
player:get_inventory():add_item('main', 'slope:edgecorner_yellow')
player:get_inventory():add_item('main', 'slope:edgecorner_pink')
player:get_inventory():add_item('main', 'slope:edgecorner_green')
player:get_inventory():add_item('main', 'slope:edgecorner_blue')

end 
end
)

-- FullPipe

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fullpipe then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'fullpipe:block_white')
player:get_inventory():add_item('main', 'fullpipe:block_black')
player:get_inventory():add_item('main', 'fullpipe:block_red')
player:get_inventory():add_item('main', 'fullpipe:block_orange')
player:get_inventory():add_item('main', 'fullpipe:block_yellow')
player:get_inventory():add_item('main', 'fullpipe:block_pink')
player:get_inventory():add_item('main', 'fullpipe:block_green')
player:get_inventory():add_item('main', 'fullpipe:block_blue')

end 
end
)

-- FullPipe Border

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fullpipeborder then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'fullpipe:border_white')
player:get_inventory():add_item('main', 'fullpipe:border_black')
player:get_inventory():add_item('main', 'fullpipe:border_red')
player:get_inventory():add_item('main', 'fullpipe:border_orange')
player:get_inventory():add_item('main', 'fullpipe:border_yellow')
player:get_inventory():add_item('main', 'fullpipe:border_pink')
player:get_inventory():add_item('main', 'fullpipe:border_green')
player:get_inventory():add_item('main', 'fullpipe:border_blue')

end 
end
)

-- Arcs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.arc then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'pkarcs:white_arc')
player:get_inventory():add_item('main', 'pkarcs:black_arc')
player:get_inventory():add_item('main', 'pkarcs:red_arc')
player:get_inventory():add_item('main', 'pkarcs:orange_arc')
player:get_inventory():add_item('main', 'pkarcs:yellow_arc')
player:get_inventory():add_item('main', 'pkarcs:pink_arc')
player:get_inventory():add_item('main', 'pkarcs:green_arc')
player:get_inventory():add_item('main', 'pkarcs:blue_arc')

end 
end
)

-- Arcs In

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.inarc then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'pkarcs:white_inarc')
player:get_inventory():add_item('main', 'pkarcs:black_inarc')
player:get_inventory():add_item('main', 'pkarcs:red_inarc')
player:get_inventory():add_item('main', 'pkarcs:orange_inarc')
player:get_inventory():add_item('main', 'pkarcs:yellow_inarc')
player:get_inventory():add_item('main', 'pkarcs:pink_inarc')
player:get_inventory():add_item('main', 'pkarcs:green_inarc')
player:get_inventory():add_item('main', 'pkarcs:blue_inarc')

end 
end
)

-- Arcs Out

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.outarc then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'pkarcs:white_outarc')
player:get_inventory():add_item('main', 'pkarcs:black_outarc')
player:get_inventory():add_item('main', 'pkarcs:red_outarc')
player:get_inventory():add_item('main', 'pkarcs:orange_outarc')
player:get_inventory():add_item('main', 'pkarcs:yellow_outarc')
player:get_inventory():add_item('main', 'pkarcs:pink_outarc')
player:get_inventory():add_item('main', 'pkarcs:green_outarc')
player:get_inventory():add_item('main', 'pkarcs:blue_outarc')

end 
end
)

-- Sphere

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.sphere then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:sphere_white')
player:get_inventory():add_item('main', 'slope:sphere_black')
player:get_inventory():add_item('main', 'slope:sphere_red')
player:get_inventory():add_item('main', 'slope:sphere_orange')
player:get_inventory():add_item('main', 'slope:sphere_yellow')
player:get_inventory():add_item('main', 'slope:sphere_pink')
player:get_inventory():add_item('main', 'slope:sphere_green')
player:get_inventory():add_item('main', 'slope:sphere_blue')

end 
end
)

-- Cone

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cone then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:cone_white')
player:get_inventory():add_item('main', 'slope:cone_black')
player:get_inventory():add_item('main', 'slope:cone_red')
player:get_inventory():add_item('main', 'slope:cone_orange')
player:get_inventory():add_item('main', 'slope:cone_yellow')
player:get_inventory():add_item('main', 'slope:cone_pink')
player:get_inventory():add_item('main', 'slope:cone_green')
player:get_inventory():add_item('main', 'slope:cone_blue')

end 
end
)

-- OutCorner

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.outcorner then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:ocorner_white')
player:get_inventory():add_item('main', 'slope:ocorner_black')
player:get_inventory():add_item('main', 'slope:ocorner_red')
player:get_inventory():add_item('main', 'slope:ocorner_orange')
player:get_inventory():add_item('main', 'slope:ocorner_yellow')
player:get_inventory():add_item('main', 'slope:ocorner_pink')
player:get_inventory():add_item('main', 'slope:ocorner_green')
player:get_inventory():add_item('main', 'slope:ocorner_blue')

end 
end
)

-- Incorner 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.incorner then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:icorner_white')
player:get_inventory():add_item('main', 'slope:icorner_black')
player:get_inventory():add_item('main', 'slope:icorner_red')
player:get_inventory():add_item('main', 'slope:icorner_orange')
player:get_inventory():add_item('main', 'slope:icorner_yellow')
player:get_inventory():add_item('main', 'slope:icorner_pink')
player:get_inventory():add_item('main', 'slope:icorner_green')
player:get_inventory():add_item('main', 'slope:icorner_blue')

end 
end
)

-- Triangle

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.triangle then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:slope_white')
player:get_inventory():add_item('main', 'slope:slope_black')
player:get_inventory():add_item('main', 'slope:slope_red')
player:get_inventory():add_item('main', 'slope:slope_orange')
player:get_inventory():add_item('main', 'slope:slope_yellow')
player:get_inventory():add_item('main', 'slope:slope_pink')
player:get_inventory():add_item('main', 'slope:slope_green')
player:get_inventory():add_item('main', 'slope:slope_blue')

end 
end
)

-- Long

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.long then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:slopelong_white')
player:get_inventory():add_item('main', 'slope:slopelong_black')
player:get_inventory():add_item('main', 'slope:slopelong_red')
player:get_inventory():add_item('main', 'slope:slopelong_orange')
player:get_inventory():add_item('main', 'slope:slopelong_yellow')
player:get_inventory():add_item('main', 'slope:slopelong_pink')
player:get_inventory():add_item('main', 'slope:slopelong_green')
player:get_inventory():add_item('main', 'slope:slopelong_blue')

end 
end
)

-- Cylinder

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cylinder then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'slope:cylinder_white')
player:get_inventory():add_item('main', 'slope:cylinder_black')
player:get_inventory():add_item('main', 'slope:cylinder_red')
player:get_inventory():add_item('main', 'slope:cylinder_orange')
player:get_inventory():add_item('main', 'slope:cylinder_yellow')
player:get_inventory():add_item('main', 'slope:cylinder_pink')
player:get_inventory():add_item('main', 'slope:cylinder_green')
player:get_inventory():add_item('main', 'slope:cylinder_blue')

end 
end
)

-- Fence

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fence then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'fence:white')
player:get_inventory():add_item('main', 'fence:black')
player:get_inventory():add_item('main', 'fence:red')
player:get_inventory():add_item('main', 'fence:orange')
player:get_inventory():add_item('main', 'fence:yellow')
player:get_inventory():add_item('main', 'fence:pink')
player:get_inventory():add_item('main', 'fence:green')
player:get_inventory():add_item('main', 'fence:blue')

end 	
end
)

-- Trapdoor

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.trapdoor then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'doors:trapdoor_white')
player:get_inventory():add_item('main', 'doors:trapdoor_black')
player:get_inventory():add_item('main', 'doors:trapdoor_red')
player:get_inventory():add_item('main', 'doors:trapdoor_orange')
player:get_inventory():add_item('main', 'doors:trapdoor_yellow')
player:get_inventory():add_item('main', 'doors:trapdoor_pink')
player:get_inventory():add_item('main', 'doors:trapdoor_green')
player:get_inventory():add_item('main', 'doors:trapdoor_blue')

end 	
end
)

-- Carpets

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.carpets then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'carpet:white')
player:get_inventory():add_item('main', 'carpet:black')
player:get_inventory():add_item('main', 'carpet:red')
player:get_inventory():add_item('main', 'carpet:orange')
player:get_inventory():add_item('main', 'carpet:yellow')
player:get_inventory():add_item('main', 'carpet:pink')
player:get_inventory():add_item('main', 'carpet:green')
player:get_inventory():add_item('main', 'carpet:blue')

end 	
end
)

-- Doors

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.doors then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'doors:door_white')
player:get_inventory():add_item('main', 'doors:door_black')
player:get_inventory():add_item('main', 'doors:door_red')
player:get_inventory():add_item('main', 'doors:door_orange')
player:get_inventory():add_item('main', 'doors:door_yellow')
player:get_inventory():add_item('main', 'doors:door_pink')
player:get_inventory():add_item('main', 'doors:door_green')
player:get_inventory():add_item('main', 'doors:door_blue')

end 	
end
)

-- Waters

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.waters then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'water:white_water_source')
player:get_inventory():add_item('main', 'water:black_water_source')
player:get_inventory():add_item('main', 'water:red_water_source')
player:get_inventory():add_item('main', 'water:orange_water_source')
player:get_inventory():add_item('main', 'water:yellow_water_source')
player:get_inventory():add_item('main', 'water:pink_water_source')
player:get_inventory():add_item('main', 'water:green_water_source')
player:get_inventory():add_item('main', 'water:blue_water_source') 						

end 	
end
)

-- Lights

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.lights then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'light:white')
player:get_inventory():add_item('main', 'light:black')
player:get_inventory():add_item('main', 'light:red')
player:get_inventory():add_item('main', 'light:orange')
player:get_inventory():add_item('main', 'light:yellow')
player:get_inventory():add_item('main', 'light:pink')
player:get_inventory():add_item('main', 'light:green')
player:get_inventory():add_item('main', 'light:blue') 						

end 	
end
)

-- Blocks

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.blocks then --main page		
					
player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'color:white')
player:get_inventory():add_item('main', 'color:black')
player:get_inventory():add_item('main', 'color:red')
player:get_inventory():add_item('main', 'color:orange')
player:get_inventory():add_item('main', 'color:yellow')
player:get_inventory():add_item('main', 'color:pink')
player:get_inventory():add_item('main', 'color:green')
player:get_inventory():add_item('main', 'color:blue') 							

end 	
end
)

-- Windows

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.windows then --main page		
					
player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'glass:white')
player:get_inventory():add_item('main', 'glass:black')
player:get_inventory():add_item('main', 'glass:red')
player:get_inventory():add_item('main', 'glass:orange')
player:get_inventory():add_item('main', 'glass:yellow')
player:get_inventory():add_item('main', 'glass:pink')
player:get_inventory():add_item('main', 'glass:green')
player:get_inventory():add_item('main', 'glass:blue') 				

end 	
end
)

-- Stairs 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.stairs then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'stairs:stair_white')
player:get_inventory():add_item('main', 'stairs:stair_black')
player:get_inventory():add_item('main', 'stairs:stair_red')
player:get_inventory():add_item('main', 'stairs:stair_orange')
player:get_inventory():add_item('main', 'stairs:stair_yellow')
player:get_inventory():add_item('main', 'stairs:stair_pink')
player:get_inventory():add_item('main', 'stairs:stair_green')
player:get_inventory():add_item('main', 'stairs:stair_blue') 						

end 	
end
)

-- Top Slabs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.tslabs then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'stackslabs:top_slabwhite')
player:get_inventory():add_item('main', 'stackslabs:top_slabblack')
player:get_inventory():add_item('main', 'stackslabs:top_slabred')
player:get_inventory():add_item('main', 'stackslabs:top_slaborange')
player:get_inventory():add_item('main', 'stackslabs:top_slabyellow')
player:get_inventory():add_item('main', 'stackslabs:top_slabpink')
player:get_inventory():add_item('main', 'stackslabs:top_slabgreen')
player:get_inventory():add_item('main', 'stackslabs:top_slabblue') 		

end 	
end
)

-- Bottom Slabs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.slabs then --main page		
					
				 player:get_inventory():set_list("main", {})
					 
player:get_inventory():add_item('main', 'stairs:slab_white')
player:get_inventory():add_item('main', 'stairs:slab_black')
player:get_inventory():add_item('main', 'stairs:slab_red')
player:get_inventory():add_item('main', 'stairs:slab_orange')
player:get_inventory():add_item('main', 'stairs:slab_yellow')
player:get_inventory():add_item('main', 'stairs:slab_pink')
player:get_inventory():add_item('main', 'stairs:slab_green')
player:get_inventory():add_item('main', 'stairs:slab_blue') 		

end 	
end
)

-- End Build Nodes
