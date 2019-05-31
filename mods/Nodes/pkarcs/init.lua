
pkarcs = {}

function nb(n)
	return n/16-1/2
end

local source_list = {
	{"black", "Darkened", color1, 40, 36, 33}, 
	{"blue", "Blue", color2, 0, 0, 255},
	{"green", "Green", color3, 0, 255, 0}, 
	{"white", "White", color4, 245, 245, 245}, 
	{"orange", "Orange", color5, 255, 97, 3}, 
	{"red", "Red", color6, 255, 0, 0}, 
	{"yellow", "Yellow", color7, 255, 255, 0}, 
	{"pink", "Pink", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
local nodename = source_list[i][1]
local name = source_list[i][1]
	local desc = source_list[i][2]
	local desc2 = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

	minetest.register_node("pkarcs:".. color .."_arc", {
		description = desc2 .." Arc",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{ nb(0),  nb(0),  nb(0),     nb(1),  nb(16), nb(16) },
				{ nb(1),  nb(4),  nb(0),     nb(2),  nb(16), nb(16) },
				{ nb(2),  nb(7),  nb(0),     nb(3),  nb(16), nb(16) },
				{ nb(3),  nb(8),  nb(0),     nb(4),  nb(16), nb(16) },
				{ nb(4),  nb(10), nb(0),     nb(5),  nb(16), nb(16) },
				{ nb(5),  nb(11), nb(0),     nb(6),  nb(16), nb(16) },
				{ nb(6),  nb(12), nb(0),     nb(8),  nb(16), nb(16) },
				{ nb(8),  nb(13), nb(0),     nb(9),  nb(16), nb(16) },
				{ nb(9),  nb(14), nb(0),     nb(12), nb(16), nb(16) },
				{ nb(12), nb(15), nb(0),     nb(16), nb(16), nb(16) },
			}
		},
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
     wield_image = "color_hand" .. name .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
      inventory_image = "arc.png^[colorize:#"..colour..":70",

     on_place = function(itemstack, placer, pointed_thing)
			 if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p1 = pointed_thing.under
			local p0 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			local NROT = 4 -- Number of possible "rotations" (4 Up down left right)
			local rot = param2 % NROT
			local wall = math.floor(param2/NROT)
			if rot >=3 then
				rot = 0
			else 
				rot = rot +1
			end
			param2 = wall*NROT+rot

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,

	})

-- outer arc

	minetest.register_node("pkarcs:"..nodename.."_outarc", {
		description = desc.." Out Arc",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{ nb(0),  nb(0),  nb(16),     nb(1),  nb(16), nb(16-1)  },
				{ nb(0),  nb(4),  nb(16),     nb(2),  nb(16), nb(16-2)  },
				{ nb(0),  nb(7),  nb(16),     nb(3),  nb(16), nb(16-3)  },
				{ nb(0),  nb(8),  nb(16),     nb(4),  nb(16), nb(16-4)  },
				{ nb(0),  nb(10), nb(16),     nb(5),  nb(16), nb(16-5)  },
				{ nb(0),  nb(11), nb(16),     nb(6),  nb(16), nb(16-6)  },
				{ nb(0),  nb(12), nb(16),     nb(8),  nb(16), nb(16-8)  },
				{ nb(0),  nb(13), nb(16),     nb(9),  nb(16), nb(16-9)  },
				{ nb(0),  nb(14), nb(16),     nb(12), nb(16), nb(16-12) },
				{ nb(0),  nb(15), nb(16),     nb(16), nb(16), nb(16-16) },
			}
		},
		 tiles = {"color_white.png^[colorize:#"..colour..":70"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
wield_image = "color_hand" .. name .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
      inventory_image = "arcout.png^[colorize:#"..colour..":70",

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p1 = pointed_thing.under
			local p0 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			local NROT = 4 -- Number of possible "rotations" (4 Up down left right)
			local rot = param2 % NROT
			local wall = math.floor(param2/NROT)
			if rot >=3 then
				rot = 0
			else 
				rot = rot +1
			end
			param2 = wall*NROT+rot

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,

	})

-- inner arc

	minetest.register_node("pkarcs:"..nodename.."_inarc", {
		description = desc.." In Arc",
		paramtype = "light",
		paramtype2 = "facedir",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				{ nb(0),  nb(0),  nb(16),     nb(1),  nb(16), nb(0)    },
				{ nb(0),  nb(0),  nb(16),     nb(16), nb(16), nb(16-1) },

				{ nb(0),  nb(4),  nb(16),     nb(2),  nb(16), nb(0)    },
				{ nb(0),  nb(4),  nb(16),     nb(16), nb(16), nb(16-2) },

				{ nb(0),  nb(7),  nb(16),     nb(3),  nb(16), nb(0)    },
				{ nb(0),  nb(7),  nb(16),     nb(16), nb(16), nb(16-3) },

				{ nb(0),  nb(8),  nb(16),     nb(4),  nb(16), nb(0)    },
				{ nb(0),  nb(8),  nb(16),     nb(16), nb(16), nb(16-4) },

				{ nb(0),  nb(10), nb(16),     nb(5),  nb(16), nb(0)    },
				{ nb(0),  nb(10), nb(16),     nb(16), nb(16), nb(16-5) },

				{ nb(0),  nb(11), nb(16),     nb(6),  nb(16), nb(0)    },
				{ nb(0),  nb(11), nb(16),     nb(16), nb(16), nb(16-6) },

				{ nb(0),  nb(12), nb(16),     nb(8),  nb(16), nb(0)    },
				{ nb(0),  nb(12), nb(16),     nb(16), nb(16), nb(16-8) },

				{ nb(0),  nb(13), nb(16),     nb(9),  nb(16), nb(0)    },
				{ nb(0),  nb(13), nb(16),     nb(16), nb(16), nb(16-9) },

				{ nb(0),  nb(14), nb(16),     nb(12), nb(16), nb(0)     },
				{ nb(0),  nb(14), nb(16),     nb(16), nb(16), nb(16-12) },

				{ nb(0),  nb(15), nb(16),     nb(16), nb(16), nb(16-16) },
			}
		},
		tiles = {"color_white.png^[colorize:#"..colour..":70"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	 oddly_breakable_by_hand = 1,
	 dig_immediate = 3,
  wield_image = "color_hand" .. name .. ".png",
		 wield_scale = {x=1,y=1,z=0.5},
  inventory_image = "arcin.png^[colorize:#"..colour..":70",

		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			local p1 = pointed_thing.under
			local p0 = pointed_thing.above
			local param2 = 0

			local placer_pos = placer:getpos()
			if placer_pos then
				local dir = {
					x = p1.x - placer_pos.x,
					y = p1.y - placer_pos.y,
					z = p1.z - placer_pos.z
				}
				param2 = minetest.dir_to_facedir(dir)
			end

			if p0.y-1 == p1.y then
				param2 = param2 + 20
				if param2 == 21 then
					param2 = 23
				elseif param2 == 23 then
					param2 = 21
				end
			end

			local NROT = 4 -- Number of possible "rotations" (4 Up down left right)
			local rot = param2 % NROT
			local wall = math.floor(param2/NROT)
			if rot >=3 then
				rot = 0
			else 
				rot = rot +1
			end
			param2 = wall*NROT+rot

			return minetest.item_place(itemstack, placer, pointed_thing, param2)
		end,

	})

	
end
