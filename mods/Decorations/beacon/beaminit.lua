color1 = minetest.setting_get("color1") or "292421"
color2 = minetest.setting_get("color2") or "0000FF"
color3 = minetest.setting_get("color3") or "00FF00"
color4 = minetest.setting_get("color4") or "F5F5F5"
color5 = minetest.setting_get("color5") or "FF6103"
color6 = minetest.setting_get("color6") or "FF0000"
color7 = minetest.setting_get("color7") or "FFFF00"
color8 = minetest.setting_get("color8") or "FF69B4"

local source_list = {
   	{"black", "Color1", color1}, 
	  {"blue", "Color2", color2},
	  {"green", "Color3", color3}, 
  	 {"white", "Color4", color4}, 
   	{"orange", "Color5", color5}, 
   	{"red", "Color6", color6}, 
   	{"yellow", "Color7", color7}, 
   	{"pink", "Color8", color8}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]

--Blue Beam
minetest.register_node("beacon:"..color.."base", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"beam.png^[colorize:#"..colour..":70" },
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 13,
	groups = {not_in_creative_inventory=1}
})

minetest.register_node("beacon:"..color.."beam", {
	visual_scale = 1.0,
	drawtype = "plantlike",
	tiles = {"beam.png^[colorize:#"..colour..":70"},
	paramtype = "light",
	walkable = false,
	diggable = false,
	light_source = 50,
	groups = {not_in_creative_inventory=1}
})

minetest.register_abm({
	nodenames = {"beacon:"..color.."base"}, --makes small particles emanate from the beginning of a beam
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"particle.png^[colorize:#"..colour..":70" --texture
		)
	end,
})

end
