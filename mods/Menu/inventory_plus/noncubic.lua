-- Start Non Cubic

-- noncubic:slope_

minetest.register_on_player_receive_fields(function(player, formname, fields)	
		local name = player:get_player_name()	
				if fields.ncslope then --main page		
					
				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'noncubic:slope_white')
player:get_inventory():add_item('main', 'noncubic:slope_black')
player:get_inventory():add_item('main', 'noncubic:slope_red')
player:get_inventory():add_item('main', 'noncubic:slope_orange')
player:get_inventory():add_item('main', 'noncubic:slope_yellow')
player:get_inventory():add_item('main', 'noncubic:slope_pink')
player:get_inventory():add_item('main', 'noncubic:slope_green')
player:get_inventory():add_item('main', 'noncubic:slope_blue')

end 
end
)

-- noncubic:slope_lying_
-- noncubic:slope_upsdown_
-- noncubic:slope_edge_
-- noncubic:slope_inner_edge_
-- noncubic:slope_upsdown_edge_
-- noncubic:slope_upsdown_inner_edge_
-- noncubic:pyramid_
-- noncubic:spike_
-- noncubic:onecurvededge_
-- noncubic:twocurvededge_
-- noncubic:cylinder_
-- noncubic:cylinder_horizontal_
-- noncubic:cylinder_sphere_
-- noncubic:element_straight_
-- noncubic:element_edge_
-- noncubic:element_t_
-- noncubic:element_cross_
-- noncubic:element_end_
-- noncubic:element_straight_double_
-- noncubic:element_edge_double_
-- noncubic:element_t_double_
-- noncubic:element_cross_double_
-- noncubic:element_end_double_
-- noncubic:stick_

-- End Non Cubic