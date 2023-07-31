
for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	minetest.register_abm({
		nodenames = {"beacon:" .. color},
		interval = 16,
		chance = 1,
		action = function(pos)
			pos.y = pos.y + 1
			minetest.add_node(pos, {name="beacon:"..color.."base"})
			for i=1,179 do
				minetest.add_node({x=pos.x, y=pos.y+i, z=pos.z}, {name="beacon:"..color.."beam"})
			end
		end,
	})
end
