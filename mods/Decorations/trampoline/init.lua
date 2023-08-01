-- Trampoline mod by Zorman2000
-- Code based on carpets mod included in BlockColor and a modification
-- of the original trampoline node found on xdecor mod by kilbith

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_node("trampoline:"..color, {
		description = desc.."Trampoline",
		inventory_image = 'trampo.png^[colorize:#'..colour..':70',
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		tiles = {"trampoline.png^[colorize:#"..colour..":70", "trampoline.png^[colorize:#"..colour..":70", "trampoline_sides.png^[colorize:#"..colour..":70"},
		groups = {cracky=3, oddly_breakable_by_hand=1, fall_damage_add_percent=-100, bouncy=99},
		paramtype = "light",
		use_texture_alpha = "clip",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		}
	})
end
