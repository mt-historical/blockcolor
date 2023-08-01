
for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	dofile(minetest.get_modpath("hovercraft").."/hover.lua")

	hover:register_hovercraft("hovercraft:hover_" .. color,{
		description = color .." Hovercraft",
		textures = {"hovercraft.png^[colorize:#"..colour..":70"},
		wield_image = "blank.png",
		inventory_image = "hovercraft_inv.png^[colorize:#"..colour..":70",
		max_speed = 10,
		acceleration = 0.25,
		deceleration = 0.05,
		jump_velocity = 4.0,
		fall_velocity = 1.0,
		bounce = 0.5,
	})
end
