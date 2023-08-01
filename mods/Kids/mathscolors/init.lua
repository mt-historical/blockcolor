local maths = {
	"0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
	"diviser", "egale", "inferieure", "moins", "multiplier", "plus", "superieure", "virgule"
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	for i in ipairs(maths) do
		local math = maths[i]

		minetest.register_node("mathscolors:" .. math .. "_" .. name, {
			description = desc .. " color",
			inventory_image = math .. ".png^[colorize:#" .. colour .. ":70",
			tiles = { math .. ".png^[colorize:#" .. colour .. ":70" },
			is_ground_content = true,
			groups = { snappy = 2, choppy = 2, wool = 2 },
			sounds = bc_core.sound(),
		})
	end
end
