
for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

minetest.register_alias("carts:rail", "carts:railwhite")

carts:register_rail("carts:rail" ..  color, {
	description = color .. "rail",
	inventory_image = "carts_rail_straight_pwr.png^[colorize:#"..colour..":70",
	wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
	wield_scale = {x=1,y=1,z=0.5},
	tiles = {
		"carts_rail_straight_pwr.png^[colorize:#"..colour..":70", "carts_rail_curved_pwr.png^[colorize:#"..colour..":70",
		"carts_rail_t_junction_pwr.png^[colorize:#"..colour..":70",
		"carts_rail_crossing_pwr.png^[colorize:#"..colour..":70"
	},
	groups = carts:get_rail_groups(),
	}, {acceleration = 5})

end
