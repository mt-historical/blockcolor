-- Light in Block

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.beaconoff then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'beacon:offwhite')
player:get_inventory():add_item('main', 'beacon:offblack')
player:get_inventory():add_item('main', 'beacon:offred')
player:get_inventory():add_item('main', 'beacon:offorange')
player:get_inventory():add_item('main', 'beacon:offyellow')
player:get_inventory():add_item('main', 'beacon:offpink')
player:get_inventory():add_item('main', 'beacon:offgreen')
player:get_inventory():add_item('main', 'beacon:offblue')

end 
end
)

-- Beacon in Block

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.beacon then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'beacon:white')
player:get_inventory():add_item('main', 'beacon:black')
player:get_inventory():add_item('main', 'beacon:red')
player:get_inventory():add_item('main', 'beacon:orange')
player:get_inventory():add_item('main', 'beacon:yellow')
player:get_inventory():add_item('main', 'beacon:pink')
player:get_inventory():add_item('main', 'beacon:green')
player:get_inventory():add_item('main', 'beacon:blue')

end 
end
)

-- Trampolines

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.trampoline then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'trampoline:white')
player:get_inventory():add_item('main', 'trampoline:black')
player:get_inventory():add_item('main', 'trampoline:red')
player:get_inventory():add_item('main', 'trampoline:orange')
player:get_inventory():add_item('main', 'trampoline:yellow')
player:get_inventory():add_item('main', 'trampoline:pink')
player:get_inventory():add_item('main', 'trampoline:green')
player:get_inventory():add_item('main', 'trampoline:blue')

end 
end
)

-- Flags

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.flags then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'flags:white')
player:get_inventory():add_item('main', 'flags:black')
player:get_inventory():add_item('main', 'flags:red')
player:get_inventory():add_item('main', 'flags:orange')
player:get_inventory():add_item('main', 'flags:yellow')
player:get_inventory():add_item('main', 'flags:pink')
player:get_inventory():add_item('main', 'flags:green')
player:get_inventory():add_item('main', 'flags:blue')

end 
end
)

-- Shield Slash

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.shieldslash then --main page	
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'castle_shields:shield_slashwhite')
player:get_inventory():add_item('main', 'castle_shields:shield_slashblack')
player:get_inventory():add_item('main', 'castle_shields:shield_slashred')
player:get_inventory():add_item('main', 'castle_shields:shield_slashorange')
player:get_inventory():add_item('main', 'castle_shields:shield_slashyellow')
player:get_inventory():add_item('main', 'castle_shields:shield_slashpink')
player:get_inventory():add_item('main', 'castle_shields:shield_slashgreen')
player:get_inventory():add_item('main', 'castle_shields:shield_slashblue')

end 
end
)

-- Shield Chevron

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.shieldchevron then --main page	
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'castle_shields:shield_chevronwhite')
player:get_inventory():add_item('main', 'castle_shields:shield_chevronblack')
player:get_inventory():add_item('main', 'castle_shields:shield_chevronred')
player:get_inventory():add_item('main', 'castle_shields:shield_chevronorange')
player:get_inventory():add_item('main', 'castle_shields:shield_chevronyellow')
player:get_inventory():add_item('main', 'castle_shields:shield_chevronpink')
player:get_inventory():add_item('main', 'castle_shields:shield_chevrongreen')
player:get_inventory():add_item('main', 'castle_shields:shield_chevronblue')

end 
end
)

-- Shield Cross

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.shieldcross then --main page	
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'castle_shields:shield_crosswhite')
player:get_inventory():add_item('main', 'castle_shields:shield_crossblack')
player:get_inventory():add_item('main', 'castle_shields:shield_crossred')
player:get_inventory():add_item('main', 'castle_shields:shield_crossorange')
player:get_inventory():add_item('main', 'castle_shields:shield_crossyellow')
player:get_inventory():add_item('main', 'castle_shields:shield_crosspink')
player:get_inventory():add_item('main', 'castle_shields:shield_crossgreen')
player:get_inventory():add_item('main', 'castle_shields:shield_crossblue')

end 
end
)


-- Torch 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.torch then --main page	
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'abritorch:torch_white')
player:get_inventory():add_item('main', 'abritorch:torch_black')
player:get_inventory():add_item('main', 'abritorch:torch_red')
player:get_inventory():add_item('main', 'abritorch:torch_orange')
player:get_inventory():add_item('main', 'abritorch:torch_yellow')
player:get_inventory():add_item('main', 'abritorch:torch_pink')
player:get_inventory():add_item('main', 'abritorch:torch_green')
player:get_inventory():add_item('main', 'abritorch:torch_blue')

end 
end
)

-- CGherse (Castle Gates Herse)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cgherse then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'castle_gates:hersewhite')
player:get_inventory():add_item('main', 'castle_gates:herseblack')
player:get_inventory():add_item('main', 'castle_gates:hersered')
player:get_inventory():add_item('main', 'castle_gates:herseorange')
player:get_inventory():add_item('main', 'castle_gates:herseyellow')
player:get_inventory():add_item('main', 'castle_gates:hersepink')
player:get_inventory():add_item('main', 'castle_gates:hersegreen')
player:get_inventory():add_item('main', 'castle_gates:herseblue')

end 
end
)

-- CGborder (Castle Gates Border)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cgborder then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'castle_gates:borderwhite')
player:get_inventory():add_item('main', 'castle_gates:borderblack')
player:get_inventory():add_item('main', 'castle_gates:borderred')
player:get_inventory():add_item('main', 'castle_gates:borderorange')
player:get_inventory():add_item('main', 'castle_gates:borderyellow')
player:get_inventory():add_item('main', 'castle_gates:borderpink')
player:get_inventory():add_item('main', 'castle_gates:bordergreen')
player:get_inventory():add_item('main', 'castle_gates:borderblue')

end 
end
)

-- CGdoor (Castle Gates Door)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.cgdoor then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'castle_gates:doorwhite')
player:get_inventory():add_item('main', 'castle_gates:doorblack')
player:get_inventory():add_item('main', 'castle_gates:doorred')
player:get_inventory():add_item('main', 'castle_gates:doororange')
player:get_inventory():add_item('main', 'castle_gates:dooryellow')
player:get_inventory():add_item('main', 'castle_gates:doorpink')
player:get_inventory():add_item('main', 'castle_gates:doorgreen')
player:get_inventory():add_item('main', 'castle_gates:doorblue')

end 
end
)

-- FBladder (Factory Bridges Ladder)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fbladder then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'factory_bridges:ladderwhite')
player:get_inventory():add_item('main', 'factory_bridges:ladderblack')
player:get_inventory():add_item('main', 'factory_bridges:ladderred')
player:get_inventory():add_item('main', 'factory_bridges:ladderorange')
player:get_inventory():add_item('main', 'factory_bridges:ladderyellow')
player:get_inventory():add_item('main', 'factory_bridges:ladderpink')
player:get_inventory():add_item('main', 'factory_bridges:laddergreen')
player:get_inventory():add_item('main', 'factory_bridges:ladderblue')

end 
end
)

-- FBstair (Factory Bridges Stair)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fbstair then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'factory_bridges:stairwhite')
player:get_inventory():add_item('main', 'factory_bridges:stairblack')
player:get_inventory():add_item('main', 'factory_bridges:stairred')
player:get_inventory():add_item('main', 'factory_bridges:stairorange')
player:get_inventory():add_item('main', 'factory_bridges:stairyellow')
player:get_inventory():add_item('main', 'factory_bridges:stairpink')
player:get_inventory():add_item('main', 'factory_bridges:stairgreen')
player:get_inventory():add_item('main', 'factory_bridges:stairblue')

end 
end
)

-- FBtrap (Factory Bridges Trap)

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.fbtrap then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'factory_bridges:trap1white')
player:get_inventory():add_item('main', 'factory_bridges:trap1black')
player:get_inventory():add_item('main', 'factory_bridges:trap1red')
player:get_inventory():add_item('main', 'factory_bridges:trap1orange')
player:get_inventory():add_item('main', 'factory_bridges:trap1yellow')
player:get_inventory():add_item('main', 'factory_bridges:trap1pink')
player:get_inventory():add_item('main', 'factory_bridges:trap1green')
player:get_inventory():add_item('main', 'factory_bridges:trap1blue')

end 
end
)

-- Frigos

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.frigo then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:frigowhite')
player:get_inventory():add_item('main', 'hdb:frigoblack')
player:get_inventory():add_item('main', 'hdb:frigored')
player:get_inventory():add_item('main', 'hdb:frigoorange')
player:get_inventory():add_item('main', 'hdb:frigoyellow')
player:get_inventory():add_item('main', 'hdb:frigopink')
player:get_inventory():add_item('main', 'hdb:frigogreen')
player:get_inventory():add_item('main', 'hdb:frigoblue')

end 
end
)

-- Cabinets

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.armoire then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:armoirewhite')
player:get_inventory():add_item('main', 'hdb:armoireblack')
player:get_inventory():add_item('main', 'hdb:armoirered')
player:get_inventory():add_item('main', 'hdb:armoireorange')
player:get_inventory():add_item('main', 'hdb:armoireyellow')
player:get_inventory():add_item('main', 'hdb:armoirepink')
player:get_inventory():add_item('main', 'hdb:armoiregreen')
player:get_inventory():add_item('main', 'hdb:armoireblue')

end 
end
)

-- Benchs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.bench then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:benchwhite')
player:get_inventory():add_item('main', 'hdb:benchblack')
player:get_inventory():add_item('main', 'hdb:benchred')
player:get_inventory():add_item('main', 'hdb:benchorange')
player:get_inventory():add_item('main', 'hdb:benchyellow')
player:get_inventory():add_item('main', 'hdb:benchpink')
player:get_inventory():add_item('main', 'hdb:benchgreen')
player:get_inventory():add_item('main', 'hdb:benchblue')

end 
end
)


-- Computers 

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.computers then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:computerwhite')
player:get_inventory():add_item('main', 'hdb:computerblack')
player:get_inventory():add_item('main', 'hdb:computerred')
player:get_inventory():add_item('main', 'hdb:computerorange')
player:get_inventory():add_item('main', 'hdb:computeryellow')
player:get_inventory():add_item('main', 'hdb:computerpink')
player:get_inventory():add_item('main', 'hdb:computergreen')
player:get_inventory():add_item('main', 'hdb:computerblue')

end 
end
)


-- Desks

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.desks then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'hdb:deskwhite')
player:get_inventory():add_item('main', 'hdb:deskblack')
player:get_inventory():add_item('main', 'hdb:deskred')
player:get_inventory():add_item('main', 'hdb:deskorange')
player:get_inventory():add_item('main', 'hdb:deskyellow')
player:get_inventory():add_item('main', 'hdb:deskpink')
player:get_inventory():add_item('main', 'hdb:deskgreen')
player:get_inventory():add_item('main', 'hdb:deskblue')

end 
end
)

-- Beds

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.beds then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'beds:bed_bottom_white')
player:get_inventory():add_item('main', 'beds:bed_bottom_black')
player:get_inventory():add_item('main', 'beds:bed_bottom_red')
player:get_inventory():add_item('main', 'beds:bed_bottom_orange')
player:get_inventory():add_item('main', 'beds:bed_bottom_yellow')
player:get_inventory():add_item('main', 'beds:bed_bottom_pink')
player:get_inventory():add_item('main', 'beds:bed_bottom_green')
player:get_inventory():add_item('main', 'beds:bed_bottom_blue')

end 
end
)

-- Signs

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.signs then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'signs:sign_wall_white')
player:get_inventory():add_item('main', 'signs:sign_wall_black')
player:get_inventory():add_item('main', 'signs:sign_wall_red')
player:get_inventory():add_item('main', 'signs:sign_wall_orange')
player:get_inventory():add_item('main', 'signs:sign_wall_yellow')
player:get_inventory():add_item('main', 'signs:sign_wall_pink')
player:get_inventory():add_item('main', 'signs:sign_wall_green')
player:get_inventory():add_item('main', 'signs:sign_wall_blue')

end 
end
)

-- Table

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.table then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ma_pops_furniture:table_white')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_black')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_red')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_orange')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_yellow')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_pink')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_green')
player:get_inventory():add_item('main', 'ma_pops_furniture:table_blue')

end 
end
)

-- Chair2

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.sofas then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_white')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_black')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_red')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_orange')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_yellow')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_pink')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_green')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair2_blue')

end 
end
)

-- Chair

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.chair then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ma_pops_furniture:chair_white')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_black')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_red')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_orange')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_yellow')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_pink')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_green')
player:get_inventory():add_item('main', 'ma_pops_furniture:chair_blue')

end 
end
)

-- Flowers

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.flowers then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'flowers:white')
player:get_inventory():add_item('main', 'flowers:black')
player:get_inventory():add_item('main', 'flowers:red')
player:get_inventory():add_item('main', 'flowers:orange')
player:get_inventory():add_item('main', 'flowers:yellow')
player:get_inventory():add_item('main', 'flowers:pink')
player:get_inventory():add_item('main', 'flowers:green')
player:get_inventory():add_item('main', 'flowers:blue')

end 	
end
)
