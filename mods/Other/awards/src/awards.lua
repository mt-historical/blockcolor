-- Copyright (c) 2013-18 rubenwardy and Wuzzy. MIT.

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	awards.register_award("award_" .. color,{
		title = "First " .. color,
		description = "Place 1 " .. color,

		trigger = {
			type = "place",
			node = "color:" .. color,
			target = 1
		}
	})

	awards.register_award("award_999" .. color,{
		title = "999 " .. color .. "s Blocks",
		description = "Place 999 " .. color,

		trigger = {
			type = "place",
			node = "color:" .. color,
			target = 999
		}
	})

	awards.register_award("award_dead" .. color,{
		title = "Oh nooooo .... My " .. color,
		description = "Dig a " .. color,

		trigger = {
			type = "dig",
			node = "color:" .. color,
			target = 1
		}
	})
end
