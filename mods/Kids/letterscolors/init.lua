
local letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","y","x","z"}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

	for i in ipairs(letters) do
		local letter = letters[i]

		minetest.register_node("letterscolors:".. letter .. "_" .. name, {
			description = desc .. " color",
			inventory_image = letter .. ".png^[colorize:#"..colour..":70",
			tiles = {letter .. ".png^[colorize:#"..colour..":70"},
			is_ground_content = true,
			groups = {snappy = 2, choppy = 2, wool = 2},
			sounds = bc_core.sound(),
		})
	end
end
