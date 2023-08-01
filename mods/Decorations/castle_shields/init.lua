castle_shields = {}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	castle_shields.register_shield = function(name, desc, background_color, foreground_color, mask)
		local tile_side = "color_white.png^[colorize:#"..colour..":70"
		local tile_front = "color_white.png^[colorize:#"..colour..":70^(color_black.png^[mask:castle_shield_mask_"..mask..".png)"

		minetest.register_node(minetest.get_current_modname()..":"..name, {
			description = desc,
			tiles = {tile_side, tile_side, tile_side, tile_side, "color_black.png", tile_front},
			wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
			wield_scale = {x=1,y=1,z=0.5},
			inventory_image = "inv"..mask..".png^[colorize:#"..colour..":70",
			drawtype="nodebox",
			paramtype2 = "facedir",
			paramtype = "light",
			groups={cracky=3},
			sounds = bc_core.sound_metal(),
			node_box = {
				type = "fixed",
				fixed = {
					{-0.500000,-0.125000,0.375000,0.500000,0.500000,0.500000},
					{-0.437500,-0.312500,0.375000,0.425000,0.500000,0.500000},
					{-0.312500,-0.437500,0.375000,0.312500,0.500000,0.500000},
					{-0.187500,-0.500000,0.375000,0.187500,0.500000,0.500000},
				},
			},
			selection_box = {
				type = "fixed",
				fixed = {
					{-0.500000,-0.500000,0.375000,0.500000,0.500000,0.500000},
				},
			},
		})

		-- method parameters are name, desc, background_color, foreground_color, pattern
	end

	castle_shields.register_shield("shield_slash" .. color, "Mounted Shield", color, "white", "slash")
	castle_shields.register_shield("shield_chevron" .. color, "Mounted Shield", color, "white", "chevron")
	castle_shields.register_shield("shield_cross" .. color, "Mounted Shield", color, "white", "cross")
end
