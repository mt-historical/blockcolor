
for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node('flowers:' .. name , {
		drawtype = 'plantlike',
		tiles = { 'flower_white.png^[colorize:#'..colour..':70' },
		inventory_image = 'flowers2.png^[colorize:#'..colour..':70',
		sunlight_propagates = true,
		paramtype = 'light',
		description = desc .. " flower",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		groups = {snappy = 2, choppy = 2, wool = 2},
		waving = 1,
		walkable = false,
		buildable_to = true,
		sounds = bc_core.sound_leaves(),
	})
end
