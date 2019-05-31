local source_list = {
	{"black", "Darkened", "292421", 40, 36, 33}, 
	{"blue", "Blue", "0000FF", 0, 0, 255},
	{"green", "Green", "00FF00", 0, 255, 0}, 
	{"white", "White", "F5F5F5", 245, 245, 245}, 
	{"orange", "Orange", "FF6103", 255, 97, 3}, 
	{"red", "Red", "FF0000", 255, 0, 0}, 
	{"yellow", "Yellow", "FFFF00", 255, 255, 0}, 
	{"pink", "pink", "FF69B4", 255, 105, 180}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local description = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

-- Functions

local function get_sign(i)
	if i == 0 then
		return 0
	else
		return i / math.abs(i)
	end
end


local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw) * v
	local z =  math.cos(yaw) * v
	return {x = x, y = y, z = z}
end


local function get_v(v)
	return math.sqrt(v.x ^ 2 + v.z ^ 2)
end


-- Airboat entity

local airboat = {
		initial_properties = {
		physical = true,
		collide_with_objects = false, -- Workaround fix for a MT engine bug
		collisionbox = {-0.85, -1.5, -0.85, 0.85, 1.5, 0.85},
		visual = "wielditem",
		visual_size = {x = 2.0, y = 2.0}, -- Scale up of nodebox is these * 1.5
		textures = {"airboat:airboat_nodebox" ..color},
	},

	-- Custom fields
	driver = nil,
	removed = false,
	v = 0,
	vy = 0,
	rot = 0,
	auto = false,
}


function airboat.on_rightclick(self, clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	local name = clicker:get_player_name()
	if self.driver and name == self.driver then
		-- Detach
		self.driver = nil
		self.auto = false
		clicker:set_detach()
		default.player_attached[name] = false
		default.player_set_animation(clicker, "stand" , 30)
		local pos = clicker:getpos()
		minetest.after(0.1, function()
			clicker:setpos(pos)
		end)
	elseif not self.driver then
		-- Attach
		local attach = clicker:get_attach()
		if attach and attach:get_luaentity() then
			local luaentity = attach:get_luaentity()
			if luaentity.driver then
				luaentity.driver = nil
			end
			clicker:set_detach()
		end
		self.driver = name
		clicker:set_attach(self.object, "",
			{x = 0, y = -2, z = 0}, {x = 0, y = 0, z = 0})
		default.player_attached[name] = true
		minetest.after(0.2, function()
			default.player_set_animation(clicker, "sit" , 30)
		end)
		clicker:set_look_horizontal(self.object:getyaw())
	end
end


function airboat.on_activate(self, staticdata, dtime_s)
	self.object:set_armor_groups({immortal = 1})
end


function airboat.on_punch(self, puncher)
	if not puncher or not puncher:is_player() or self.removed then
		return
	end

	local name = puncher:get_player_name()
	if self.driver and name == self.driver then
		-- Detach
		self.driver = nil
		puncher:set_detach()
		default.player_attached[name] = false
	end
	if not self.driver then
		-- Move to inventory
		self.removed = true
		local inv = puncher:get_inventory()
		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(name))
				or not inv:contains_item("main", "airboat:airboat" ..color) then
			local leftover = inv:add_item("main", "airboat:airboat" ..color)
			if not leftover:is_empty() then
				minetest.add_item(self.object:getpos(), leftover)
			end
		end
		minetest.after(0.1, function()
			self.object:remove()
		end)
	end
end


function airboat.on_step(self, dtime)
	self.v = get_v(self.object:getvelocity()) * get_sign(self.v)
	self.vy = self.object:getvelocity().y

	-- Controls
	if self.driver then
		local driver_objref = minetest.get_player_by_name(self.driver)
		if driver_objref then
			local ctrl = driver_objref:get_player_control()
			if ctrl.up and ctrl.down then
				if not self.auto then
					self.auto = true
					minetest.chat_send_player(self.driver,
						"[airboat] Cruise on")
				end
			elseif ctrl.down then
				self.v = self.v - 0.1
				if self.auto then
					self.auto = false
					minetest.chat_send_player(self.driver,
						"[airboat] Cruise off")
				end
			elseif ctrl.up or self.auto then
				self.v = self.v + 0.1
			end
			if ctrl.left then
				self.rot = self.rot + 0.001
			elseif ctrl.right then
				self.rot = self.rot - 0.001
			end
			if ctrl.jump then
				self.vy = self.vy + 0.075
			elseif ctrl.sneak then
				self.vy = self.vy - 0.075
			end
		else
			-- Player left server while driving
			-- In MT 5.0.0 use 'airboat:on_detach_child()' to do this
			self.driver = nil
			self.auto = false
			minetest.log("warning", "[airboat] Driver left server while" ..
				" driving. This may cause some 'Pushing ObjectRef to" ..
				" removed/deactivated object' warnings.")
		end
	end

	-- Early return for stationary vehicle
	if self.v == 0 and self.rot == 0 and self.vy == 0 then
		self.object:setpos(self.object:getpos())
		return
	end

	-- Reduction and limiting of linear speed
	local s = get_sign(self.v)
	self.v = self.v - 0.02 * s
	if s ~= get_sign(self.v) then
		self.v = 0
	end
	if math.abs(self.v) > 6 then
		self.v = 6 * get_sign(self.v)
	end

	-- Reduction and limiting of rotation
	local sr = get_sign(self.rot)
	self.rot = self.rot - 0.0003 * sr
	if sr ~= get_sign(self.rot) then
		self.rot = 0
	end
	if math.abs(self.rot) > 0.015 then
		self.rot = 0.015 * get_sign(self.rot)
	end

	-- Reduction and limiting of vertical speed
	local sy = get_sign(self.vy)
	self.vy = self.vy - 0.03 * sy
	if sy ~= get_sign(self.vy) then
		self.vy = 0
	end
	if math.abs(self.vy) > 4 then
		self.vy = 4 * get_sign(self.vy)
	end

	local new_acce = {x = 0, y = 0, z = 0}
	-- Bouyancy in liquids
	local p = self.object:getpos()
	p.y = p.y - 1.5
	local def = minetest.registered_nodes[minetest.get_node(p).name]
	if def and (def.liquidtype == "source" or def.liquidtype == "flowing") then
		new_acce = {x = 0, y = 10, z = 0}
	end

	self.object:setpos(self.object:getpos())
	self.object:setvelocity(get_velocity(self.v, self.object:getyaw(), self.vy))
	self.object:setacceleration(new_acce)
	self.object:setyaw(self.object:getyaw() + (1 + dtime) * self.rot)
end


minetest.register_entity("airboat:airboat" ..color , airboat)


-- Craftitem

minetest.register_craftitem("airboat:airboat" .. color, {
	description = "Airboat" .. color,
	inventory_image = "airboat_airboat_inv.png^[colorize:#"..colour..":70",
wield_image = "none.png",
	wield_scale = {x = 4, y = 4, z = 4},
	liquids_pointable = true,

	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local udef = minetest.registered_nodes[node.name]

		-- Run any on_rightclick function of pointed node instead
		if udef and udef.on_rightclick and
				not (placer and placer:is_player() and
				placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		if pointed_thing.type ~= "node" then
			return itemstack
		end

		pointed_thing.under.y = pointed_thing.under.y + 2
		local airboat = minetest.add_entity(pointed_thing.under,
			"airboat:airboat" ..color)
		if airboat then
			if placer then
				airboat:setyaw(placer:get_look_horizontal())
			end
			local player_name = placer and placer:get_player_name() or ""
			if not (creative and creative.is_enabled_for and
					creative.is_enabled_for(player_name)) then
				itemstack:take_item()
			end
		end
		return itemstack
	end,
})


-- Nodebox for entity wielditem visual

minetest.register_node("airboat:airboat_nodebox" .. color, {
	description = "Airboat Nodebox" .. color,
	tiles = { -- Top, base, right, left, front, back
		"airboat_airboat_top.png^[colorize:#"..colour..":70",
		"airboat_airboat_base.png^[colorize:#"..colour..":70",
		"airboat_airboat_right.png^[colorize:#"..colour..":70",
		"airboat_airboat_left.png^[colorize:#"..colour..":70",
		"airboat_airboat_front.png^[colorize:#"..colour..":70",
		"airboat_airboat_back.png^[colorize:#"..colour..":70",
	},
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = { -- Widmin, heimin, lenmin, widmax, heimax, lenmax
			{-0.271, -0.167, -0.5,     0.271,  0.375,  0.5},  -- Envelope
			{-0.167, -0.5,   -0.25,    0.167, -0.167,  0.25}, -- Gondola
			{-0.021,  0.375, -0.5,     0.021,  0.5,   -0.25}, -- Top fin
			{-0.021, -0.292, -0.5,     0.021, -0.167, -0.25}, -- Base fin
			{-0.396,  0.083, -0.5,    -0.271,  0.125, -0.25}, -- Left fin
			{ 0.271,  0.083, -0.5,     0.396,  0.125, -0.25}, -- Right fin
		},
	},
	groups = {not_in_creative_inventory = 1},
})

end
