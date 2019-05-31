color1 = minetest.setting_get("color1") or "292421"
color2 = minetest.setting_get("color2") or "0000FF"
color3 = minetest.setting_get("color3") or "00FF00"
color4 = minetest.setting_get("color4") or "F5F5F5"
color5 = minetest.setting_get("color5") or "FF6103"
color6 = minetest.setting_get("color6") or "FF0000"
color7 = minetest.setting_get("color7") or "FFFF00"
color8 = minetest.setting_get("color8") or "FF69B4"

local source_list = {
	{"black", "Color1", color1, 40, 36, 33}, 
	{"blue", "Color2", color2, 0, 0, 255},
	{"green", "Color3", color3, 0, 255, 0}, 
	{"white", "Color4", color4, 245, 245, 245}, 
	{"orange", "Color5", color5, 255, 97, 3}, 
	{"red", "Color6", color6, 255, 0, 0}, 
	{"yellow", "Color7", color7, 255, 255, 0}, 
	{"pink", "Color8", color8, 255, 105, 180}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]

dofile(minetest.get_modpath("hotairballoon") .. "/config.lua")

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i/math.abs(i)
	end
end

local carpet = {
	physical = true,
	collisionbox = {-.99,-0.1,-.99, .99,0.5,.99},
	collide_with_objects = true,
	visual = "mesh",
	mesh = "hotair.b3d",
	textures = {"hotair_w.png^[colorize:#"..colour..":70"},
	driver = nil,
	yaw=0,
	vx=0,
	vy=0,
	vz=0,
}

function carpet:on_rightclick(clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	local name = clicker:get_player_name()
	if self.driver and clicker == self.driver then
		clicker:set_detach()
		self.driver = nil
		default.player_attached[name] = false
		default.player_set_animation(clicker, "stand" , 10)
		if hotairballoon.one_use == true then
			self.object:remove()
		end
	elseif not self.driver then
		self.driver = clicker
		clicker:set_attach(self.object, "", {x=-4,y=10.1,z=0}, {x=0,y=90,z=0})
		default.player_attached[name] = true
		minetest.after(0.2, function()
			default.player_set_animation(clicker, "sit" , 10)
		end)
		self.object:setyaw(clicker:get_look_yaw()-math.pi/2)
	end
end

function carpet:on_activate(staticdata, dtime_s)
	self.object:set_armor_groups({immortal = 1})
	if staticdata then
		self.v = tonumber(staticdata)
	end
end

function carpet:on_punch(puncher, time_from_last_punch, tool_capabilities, direction)
	if not self.driver then self.object:remove() end
	if puncher and puncher:is_player() and not self.driver and not minetest.setting_getbool("creative_mode")  then
		puncher:get_inventory():add_item("main", "hotairballoon:hotair" .. color)
	end
end

function carpet:on_step(dtime)
	if self.driver then
		self.yaw = self.driver:get_look_yaw()
		local yaw = self.object:getyaw()
		self.vx = self.object:getvelocity().x
		self.vy = self.object:getvelocity().y
		self.vz = self.object:getvelocity().z
		local ctrl = self.driver:get_player_control()
		--Forward/backward
		if ctrl.up then
			self.vx = self.vx + math.cos(yaw)*0.4
			self.vz = self.vz + math.sin(yaw)*0.4
		end
		if ctrl.down then
			self.vx = self.vx-math.cos(yaw)*0.4
			self.vz = self.vz-math.sin(yaw)*0.4
		end
		--Left/right
		if ctrl.left then
			self.object:setyaw(self.object:getyaw()+math.pi/60+dtime*math.pi/60)
		end
		if ctrl.right then
			self.object:setyaw(self.object:getyaw()-math.pi/60-dtime*math.pi/60)
		end
		--up/down
		if ctrl.jump then
			if self.vy < 1.5 then
				self.vy = self.vy+0.3
			end
		end
		if ctrl.sneak then
			if self.vy>-1.5 then
				self.vy = self.vy-0.6
			end
		end
		--
	end
	if self.vx==0 and self.vz==0 and self.vy==0 then
		return
	end
	--Decelerating
	local sx=get_sign(self.vx)
	self.vx = self.vx - 0.02*sx
	local sz=get_sign(self.vz)
	self.vz = self.vz - 0.02*sz
	local sy=get_sign(self.vy)
	self.vy = self.vy-0.01*sy

	--Stop
	if sx ~= get_sign(self.vx) then
		self.vx = 0
	end
	if sz ~= get_sign(self.vz) then
		self.vz = 0
	end
	if sy ~= get_sign(self.vy) then
		self.vy = 0
	end

	--Speed limit
	if math.abs(self.vx) > 87 then
		self.vx = 87*get_sign(self.vx)
	end
	if math.abs(self.vz) > 87 then
		self.vz = 87*get_sign(self.vz)
	end
	if math.abs(self.vy) > 87 then
		self.vz = 87*get_sign(self.vy)
	end

	self.object:setvelocity({x=self.vx, y=self.vy,z=self.vz})
end
minetest.register_entity("hotairballoon:hotair" .. color , carpet)

minetest.register_craftitem("hotairballoon:hotair" .. color, {
	description = color .."Hot Air Balloon",
	inventory_image = "hotair_inv.png^[colorize:#"..colour..":70",
	wield_image = "none.png",
	liquids_pointable = false,

	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		if minetest.get_node(pointed_thing.above).name ~= "air" then
			return
		end
		pointed_thing.under.y = pointed_thing.under.y + 1
		minetest.add_entity(pointed_thing.under, "hotairballoon:hotair" .. color)
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})

end
