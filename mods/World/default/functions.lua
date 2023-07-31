-- mods/default/functions.lua

--
-- Sounds
--

function default.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

function default.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

function default.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

function default.node_sound_glass_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

function default.node_sound_stone_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

function default.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

function default.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_footstep_blockcolor", gain = 1.0}
 table.dig = table.dig or
			{name = "default_dig_blockcolor", gain = 0.25}
	table.dug = table.dug or
			{name = "default_dug_blockcolor", gain = 0.25}
	table.place = table.place or
			{name = "default_place_blockcolor", gain = 1.0}
	return table
end

--

--
-- dig upwards
--

function default.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end


--
-- Fence registration helper
--

function default.register_fence(name, def)
	minetest.register_craft({
		output = name .. " 4",
		recipe = {
			{ def.material, 'group:stick', def.material },
			{ def.material, 'group:stick', def.material },
		}
	})

	local fence_texture = "default_fence_overlay.png^" .. def.texture ..
			"^default_fence_overlay.png^[makealpha:255,126,126"
	-- Allow almost everything to be overridden
	local default_fields = {
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/8, -1/2, -1/8, 1/8, 1/2, 1/8}},
			-- connect_top =
			-- connect_bottom =
			connect_front = {{-1/16,3/16,-1/2,1/16,5/16,-1/8},
				{-1/16,-5/16,-1/2,1/16,-3/16,-1/8}},
			connect_left = {{-1/2,3/16,-1/16,-1/8,5/16,1/16},
				{-1/2,-5/16,-1/16,-1/8,-3/16,1/16}},
			connect_back = {{-1/16,3/16,1/8,1/16,5/16,1/2},
				{-1/16,-5/16,1/8,1/16,-3/16,1/2}},
			connect_right = {{1/8,3/16,-1/16,1/2,5/16,1/16},
				{1/8,-5/16,-1/16,1/2,-3/16,1/16}},
		},
		connects_to = {"group:fence", "group:wood", "group:tree"},
		inventory_image = fence_texture,
		wield_image = fence_texture,
		tiles = {def.texture},
		sunlight_propagates = true,
		is_ground_content = false,
		groups = {},
	}
	for k, v in pairs(default_fields) do
		if not def[k] then
			def[k] = v
		end
	end

	-- Always add to the fence group, even if no group provided
	def.groups.fence = 1

	def.texture = nil
	def.material = nil

	minetest.register_node(name, def)
end



--
-- NOTICE: This method is not an official part of the API yet!
-- This method may change in future.
--

function default.can_interact_with_node(player, pos)
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- is player wielding the right key?
	local item = player:get_wielded_item()
	if item:get_name() == "default:key" then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_metadata()
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end
