creative = {}

local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function creative.is_enabled_for(name)
    return true
end

local digtime = 200
local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	range = 10,
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 3,
		groupcaps = {
			crumbly = caps,
			cracky  = caps,
			snappy  = caps,
			choppy  = caps,
			oddly_breakable_by_hand = caps,
		},
		damage_groups = {fleshy = 10},
	}
})

-- Unlimited node placement
minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	return creative.is_enabled_for(placer:get_player_name())
end)

function minetest.item_drop(itemstack, dropper, pos)
	return itemstack
end

-- Don't pick up if the item is already in the inventory
local old_handle_node_drops = minetest.handle_node_drops
function minetest.handle_node_drops(pos, drops, digger)
	if not digger or not digger:is_player() then
		return
	end
	local inv = digger:get_inventory()
	if inv then
		for _, item in ipairs(drops) do
			if not inv:contains_item("main", item, true) then
				inv:add_item("main", item)
			end
		end
	end
end
