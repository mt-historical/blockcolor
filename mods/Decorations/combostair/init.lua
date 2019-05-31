combostair = {index = {
	["color:blue"] = "stairs:stair_blue",	
 ["color:black"] = "stairs:stair_black",	
 ["color:green"] = "stairs:stair_green",	
 ["color:red"] = "stairs:stair_red",	
 ["color:yellow"] = "stairs:stair_yellow",	
 ["color:orange"] = "stairs:stair_orange",
 ["color:pink"] = "stairs:stair_pink",
 ["color:white"] = "stairs:stair_white",	

 }}
local creative = minetest.setting_getbool("creative_mode")
for k,v1 in pairs(combostair.index) do
	local v1_def = minetest.registered_nodes[v1]
	local v1_groups = table.copy(v1_def.groups)
	v1_groups.not_in_creative_inventory = 1
	local v1_tiles = table.copy(v1_def.tiles)
	if not v1_tiles[2] then
		v1_tiles[2] = v1_tiles[1]
	end
	if not v1_tiles[3] then
		v1_tiles[3] = v1_tiles[2]
	end
	if not v1_tiles[4] then
		v1_tiles[4] = v1_tiles[3]
	end
	if not v1_tiles[5] then
		v1_tiles[5] = v1_tiles[4]
	end
	if not v1_tiles[6] then
		v1_tiles[6] = v1_tiles[5]
	end
	for _,v2 in pairs(combostair.index) do
		if v1 ~= v2 then
			local v2_def = minetest.registered_nodes[v2]
			local v2_tiles = table.copy(v2_def.tiles)
			if not v2_tiles[2] then
				v2_tiles[2] = v2_tiles[1]
			end
			if not v2_tiles[3] then
				v2_tiles[3] = v2_tiles[2]
			end
			if not v2_tiles[4] then
				v2_tiles[4] = v2_tiles[3]
			end
			if not v2_tiles[5] then
				v2_tiles[5] = v2_tiles[4]
			end
			if not v2_tiles[6] then
				v2_tiles[6] = v2_tiles[5]
			end
			minetest.register_node("combostair:"..v1:split(":")[2].."_onc_"..v2:split(":")[2], {
				description = v1_def.description.." on "..v2_def.description,
				tiles = {v1_tiles[1], v2_tiles[2]},
				paramtype = "light",
				paramtype2 = "facedir",
				drawtype = "mesh",
     mesh = "stair.obj",

     selection_box = {
			  type = "fixed",
			  fixed = {
			   	{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			   	{-0.5, 0, 0, 0.5, 0.5, 0.5},
		           	},
		           },

		   collision_box = {
			  type = "fixed",
			  fixed = {
				  {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				  {-0.5, 0, 0, 0.5, 0.5, 0.5},
			          },
		          },

				sounds = v1_def.sounds,
				groups = v1_groups,
				drop = v1,
				after_destruct = function(pos, oldnode)
					minetest.set_node(pos, {name = v2, param2 = oldnode.param2})
				end
			})
		end
	end
	minetest.override_item(v1, {
		on_place = function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.under
			if pointed_thing.type ~= "node" or minetest.is_protected(pos, placer:get_player_name()) then
				return
			end
			local node = minetest.get_node(pos)
			if node.name == v1 then
				minetest.swap_node(pos, {name = k, param2 = 0})
				if not creative then
					itemstack:take_item()
					return itemstack
				end
			else
				for _,v in pairs(combostair.index) do
					if node.name == v then
						minetest.swap_node(pos, {name = "combostair:"..v1:split(":")[2].."_onc_"..v:split(":")[2], param2 = node.param2})
						if not creative then
							itemstack:take_item()
							return itemstack
						end
						return
					end
				end
				return minetest.item_place(itemstack, placer, pointed_thing, param2)
			end
		end,
	})
end
