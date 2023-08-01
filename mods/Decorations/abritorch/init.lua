
for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	local enable_ceiling = true

	minetest.register_craftitem("abritorch:torch_" .. name, {
		description = desc.." Torch",
		inventory_image = "torch.png^[colorize:#"..colour..":70",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		liquids_pointable = false,
		on_place = function(itemstack, placer, pointed_thing)
			local above = pointed_thing.above
			local under = pointed_thing.under
			local wdir = minetest.dir_to_wallmounted({x = under.x - above.x, y = under.y - above.y, z = under.z - above.z})
			if wdir < 1 and not enable_ceiling then
				return itemstack
			end
			local fakestack = itemstack
			local retval = false
			if wdir <= 1 then
				retval = fakestack:set_name("abritorch:floor_"..name)
			else
				retval = fakestack:set_name("abritorch:wall_"..name)
			end
			if not retval then
				return itemstack
			end
			itemstack, retval = minetest.item_place(fakestack, placer, pointed_thing, param2)
			itemstack:set_name("abritorch:torch_"..name)

			return itemstack
		end
	})

	minetest.register_node("abritorch:floor_"..name, {
		description = desc.." Torch",
		inventory_image = "torch.png^[colorize:#"..colour..":70",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		drawtype = "mesh",
		mesh = "torch_floor.obj",
		tiles = {
			{
				name = "abritorch_torch_on_floor_animated_white.png^[colorize:#"..colour..":70",
				animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
			}
		},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		use_texture_alpha = "clip",
		light_source = 13,
		groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
		selection_box = {
			type = "wallmounted",
			wall_top = {-1/16, -2/16, -1/16, 1/16, 0.5, 1/16},
			wall_bottom = {-1/16, -0.5, -1/16, 1/16, 2/16, 1/16},
		},
	})

	minetest.register_node("abritorch:wall_"..name, {
		inventory_image = "torch.png^[colorize:#"..colour..":70",
		wield_image = "color_handwhite.png^(color_handwhite2.png^[colorize:#"..colour..":70)",
		wield_scale = {x=1,y=1,z=0.5},
		drawtype = "mesh",
		mesh = "torch_wall.obj",
		tiles = {
			{
			    name = "abritorch_torch_on_floor_animated_white.png^[colorize:#"..colour..":70",
			    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
			}
		},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		use_texture_alpha = "clip",
		light_source = 13,
		groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
		selection_box = {
			type = "wallmounted",
			wall_top = {-0.1, -0.1, -0.1, 0.1, 0.5, 0.1},
			wall_bottom = {-0.1, -0.5, -0.1, 0.1, 0.1, 0.1},
			wall_side = {-0.5, -0.3, -0.1, -0.2, 0.3, 0.1},
		},
	})

	minetest.register_abm({
		nodenames = {"abritorch:torch_"..name},
		interval = 1,
		chance = 1,
		action = function(pos)
			local n = minetest.get_node(pos)
			local def = minetest.registered_nodes[n.name]
			if n and def then
				local wdir = n.param2
				local node_name = "abritorch:wall_"..name
				if wdir < 1 and not enable_ceiling then
					minetest.remove_node(pos)
					return
				elseif wdir <= 1 then
					node_name = "abritorch:floor_"..name
				end
				minetest.set_node(pos, {name = node_name, param2 = wdir})
			end
		end
	})
end
