color1 = minetest.setting_get("color1") or "292421"
color2 = minetest.setting_get("color2") or "0000FF"
color3 = minetest.setting_get("color3") or "00FF00"
color4 = minetest.setting_get("color4") or "F5F5F5"
color5 = minetest.setting_get("color5") or "FF6103"
color6 = minetest.setting_get("color6") or "FF0000"
color7 = minetest.setting_get("color7") or "FFFF00"
color8 = minetest.setting_get("color8") or "FF69B4"

local source_list = {
	{"black", color1}, 
	{"blue", color2},
	{"green", color3}, 
	{"white", color4}, 
	{"orange", color5}, 
	{"red", color6}, 
	{"yellow", color7}, 
	{"pink", color8}
}

local letters = {

	{"a"}, 
	{"b"},
	{"c"},
	{"d"},
	{"e"},
	{"f"},
	{"g"},
	{"h"},
	{"i"},
	{"j"},
	{"k"},
	{"l"},
	{"m"},
	{"n"},
	{"o"},
	{"p"},
	{"q"},
	{"r"},
	{"s"},
	{"t"},
	{"u"},
	{"v"},
	{"w"},
	{"y"},
	{"x"},
	{"z"},

}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local colour = source_list[i][2]

for i in ipairs(letters) do
	local letter = letters[i][1]

	minetest.register_node("letterscolors:".. letter .. "_" .. name, {

		description = name .. " color",
		inventory_image = letter .. ".png^[colorize:#"..colour..":70",
		tiles = {letter .. ".png^[colorize:#"..colour..":70"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
		oddly_breakable_by_hand = 1,
		
				 })
				 
	
	
end
end