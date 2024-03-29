-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.


-- Global namespace for functions

stairs = {}


-- Register aliases for new pine node names

minetest.register_alias("stairs:stair_pinewood", "stairs:stair_pine_wood")
minetest.register_alias("stairs:slab_pinewood", "stairs:slab_pine_wood")


-- Get setting for replace ABM

local replace = minetest.settings:get_bool("enable_stairs_replace_abm")

local function rotate_and_place(itemstack, placer, pointed_thing)
	local p0 = pointed_thing.under
	local p1 = pointed_thing.above
	local param2 = 0

	local placer_pos = placer:get_pos()
	if placer_pos then
		param2 = minetest.dir_to_facedir(vector.subtract(p1, placer_pos))
	end

	local finepos = minetest.pointed_thing_to_face_pos(placer, pointed_thing)
	local fpos = finepos.y % 1

	if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
		or (fpos < -0.5 and fpos > -0.999999999) then
		param2 = param2 + 20
		if param2 == 21 then
			param2 = 23
		elseif param2 == 23 then
			param2 = 21
		end
	end
	return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

-- Register stairs.
-- Node will be called stairs:stair_<subname>

function stairs.register_stair(subname, recipeitem, groups, images, description, sounds, html, wieldcolors)
	groups.stair = 1
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		wield_image = wieldcolors,
		wield_scale = { x = 1, y = 1, z = 0.5 },
		drawtype = "mesh",
		inventory_image = "stairs.png^[colorize:#" .. html .. ":70",
		mesh = "stairs_stair.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0,   0.5 },
				{ -0.5, 0,    0,    0.5, 0.5, 0.5 },
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{ -0.5, -0.5, -0.5, 0.5, 0,   0.5 },
				{ -0.5, 0,    0,    0.5, 0.5, 0.5 },
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing)
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:stair_" .. subname .. "upside_down", {
			replace_name = "stairs:stair_" .. subname,
			groups = { slabs_replace = 1 },
		})
	end
end

-- Slab facedir to placement 6d matching table
local slab_trans_dir = { [0] = 8, 0, 2, 1, 3, 4 }

-- Register slabs.
-- Node will be called stairs:slab_<subname>

function stairs.register_slab(subname, recipeitem, groups, images, description, sounds, html, wieldcolors)
	groups.slab = 1
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		wield_image = wieldcolors,
		wield_scale = { x = 1, y = 1, z = 0.5 },
		inventory_image = "slabs.png^[colorize:#" .. html .. ":70",
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = { -0.5, -0.5, -0.5, 0.5, 0, 0.5 },
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()
			local creative_enabled = (creative and creative.is_enabled_for
				and creative.is_enabled_for(placer:get_player_name()))

			if under and under.name:find("stairs:slab_") then
				-- place slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir
					and wield_item == under.name then
					if not recipeitem then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
						minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, { name = recipeitem, param2 = p2 })
					if not creative_enabled then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
					-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not creative_enabled then
					itemstack:take_item()
				end
				return itemstack
			else
				return rotate_and_place(itemstack, placer, pointed_thing)
			end
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:slab_" .. subname .. "upside_down", {
			replace_name = "stairs:slab_" .. subname,
			groups = { slabs_replace = 1 },
		})
	end
end

-- Optionally replace old "upside_down" nodes with new param2 versions.
-- Disabled by default.

if replace then
	minetest.register_abm({
		label = "Slab replace",
		nodenames = { "group:slabs_replace" },
		interval = 16,
		chance = 1,
		action = function(pos, node)
			node.name = minetest.registered_nodes[node.name].replace_name
			node.param2 = node.param2 + 20
			if node.param2 == 21 then
				node.param2 = 23
			elseif node.param2 == 23 then
				node.param2 = 21
			end
			minetest.set_node(pos, node)
		end,
	})
end


-- Stair/slab registration function.
-- Nodes will be called stairs:{stair,slab}_<subname>

function stairs.register_stair_and_slab(subname, recipeitem,
										groups, images, desc_stair, desc_slab, sounds, html, wieldcolors)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds, html, wieldcolors)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds, html, wieldcolors)
end

-- Register default stairs and slabs

stairs.register_stair_and_slab(
	"blue",
	"color:blue",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color2 .. ":70" },
	"Blue Stair",
	"Blue Slab",
	bc_core.sound_wood(),
	color2,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color2 .. ":70)"
)

stairs.register_stair_and_slab(
	"red",
	"color:red",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color6 .. ":70" },
	"Red Stair",
	"Red Slab",
	bc_core.sound_wood(),
	color6,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color6 .. ":70)"
)

stairs.register_stair_and_slab(
	"white",
	"color:white",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color4 .. ":70" },
	"White Stair",
	"White Slab",
	bc_core.sound_wood(),
	color4,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color4 .. ":70)"
)

stairs.register_stair_and_slab(
	"black",
	"color:black",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color1 .. ":70" },
	"Black Stair",
	"Black Slab",
	bc_core.sound_wood(),
	color1,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color1 .. ":70)"
)

stairs.register_stair_and_slab(
	"green",
	"color:green",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color3 .. ":70" },
	"Green Stair",
	"Green Slab",
	bc_core.sound_wood(),
	color3,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color3 .. ":70)"
)

stairs.register_stair_and_slab(
	"yellow",
	"color:yellow",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color7 .. ":70" },
	"Yellow Stair",
	"Yellow Slab",
	bc_core.sound_wood(),
	color7,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color7 .. ":70)"
)

stairs.register_stair_and_slab(
	"orange",
	"color:orange",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color5 .. ":70" },
	"Orange Stair",
	"Orange Slab",
	bc_core.sound_wood(),
	color5,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color5 .. ":70)"
)

stairs.register_stair_and_slab(
	"pink",
	"color:pink",
	{ choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	{ "color_white2.png^[colorize:#" .. color8 .. ":70" },
	"Pink Stair",
	"Pink Slab",
	bc_core.sound_wood(),
	color8,
	"color_handwhite.png^(color_handwhite2.png^[colorize:#" .. color8 .. ":70)"
)
