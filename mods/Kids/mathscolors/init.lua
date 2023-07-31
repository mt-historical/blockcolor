color1 = minetest.settings:get("color1") or "292421"
color2 = minetest.settings:get("color2") or "0000FF"
color3 = minetest.settings:get("color3") or "00FF00"
color4 = minetest.settings:get("color4") or "F5F5F5"
color5 = minetest.settings:get("color5") or "FF6103"
color6 = minetest.settings:get("color6") or "FF0000"
color7 = minetest.settings:get("color7") or "FFFF00"
color8 = minetest.settings:get("color8") or "FF69B4"

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

local maths = {

	{"0"},
	{"1"},
	{"2"},
	{"3"},
	{"4"},
	{"5"},
	{"6"},
	{"7"},
	{"8"},
	{"9"},
	{"diviser"},
	{"egale"},
	{"inferieure"},
	{"moins"},
	{"multiplier"},
	{"plus"},
	{"superieure"},
	{"virgule"},

}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local colour = source_list[i][2]

for i in ipairs(maths) do
	local math = maths[i][1]

	minetest.register_node("mathscolors:".. math .. "_" .. name, {

		description = name .. " color",
		inventory_image = math .. ".png^[colorize:#"..colour..":70",
		tiles = {math.. ".png^[colorize:#"..colour..":70"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
		oddly_breakable_by_hand = 1,

				 })



end
end