-- Parameters

local AVIEW = false -- Autorotate view to velocity direction
local GRIP = 6 -- Maximum linear and lateral acceleration, in nodes/s^2
local SZTORQ = 16 -- Car speed where motor torque drops to zero, in nodes/s
local DRAG = 0.03 -- Air drag
local ROLRES = 0.3 -- Rolling resistence
local GRAV = 9.81 -- Acceleration of gravity, in nodes/s^2
-- Turn parameters, in radians/s or radians/s^2
local TINIT = 0.36 -- Initial turn speed on first control input
local TACC = 0.12 -- Turn acceleration on control input
local TMAX = 2.4 -- Maximum turn speed
local TDEC = 0.24 -- Turn deceleration on no control input

-- End of parameters

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
	local name = source_list[i][1]
	local description = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

-- Constants

local sztorqmf = SZTORQ - 4


-- Functions

local function get_sign(n)
	if n == 0 then
		return 0
	else
		return n / math.abs(n)
	end
end


local function get_vecmag(vec)
	return math.sqrt(vec.x ^ 2 + vec.z ^ 2)
end

local function get_theta(vec) -- returns 0 to PI * 2
	if vec.z == 0 then
		return 0
	end
	if vec.z < 0 then
		return math.atan(-vec.x / vec.z) + math.pi
	end
	if vec.x > 0 then
		return math.atan(-vec.x / vec.z) + math.pi * 2
	end
	return math.atan(-vec.x / vec.z)
end

local function get_veccomp(vecmag, theta, y)
	local x = -math.sin(theta) * vecmag
	local z =  math.cos(theta) * vecmag
	return {x = x, y = y, z = z}
end


local function wrap_yaw(yaw) -- wrap to 0 to PI * 2
	local fmod = math.fmod(yaw, math.pi * 2)
	if fmod < 0 then
		return fmod + math.pi * 2
	end
	return fmod
end

local function angbet(theta1, theta2) -- theta1 relative to theta2, -PI to PI
	local ang = theta1 - theta2
	if ang < -math.pi then
		return ang + math.pi * 2
	end
	if ang > math.pi then
		return ang - math.pi * 2
	end
	return ang
end

local function add_smoke_particle(pos, player_name)
	minetest.add_particle({
		pos = pos,
		velocity = {x = 0, y = 0, z = 0},
		acceleration = {x = 0, y = 0, z = 0},
		expirationtime = 0.25,
		size = 2.8,
		collisiondetection = false,
		collision_removal = false,
		vertical = false,
		texture = "driftcar_smoke.png",
		playername = player_name,
	})
end

-- Entity

local car = {
	initial_properties = {
		physical = true,
		collide_with_objects = false, -- Fixes a MT 0.4.16 engine bug
		collisionbox = {-0.53, -0.75, -0.53, 0.53, 0.75, 0.53},
		visual = "wielditem",
		visual_size = {x = 1.0, y = 1.0}, -- Scale up of nodebox is these * 1.5
		textures = {"driftcar:driftcar_nodebox" .. name},
		stepheight = 0.6,
	},

	-- Custom fields
	driver = nil,
	removed = false,
	rot = 0,
}

function car.on_rightclick(self, clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	local name = clicker:get_player_name()
	if self.driver and name == self.driver then
		-- Detach
		self.driver = nil
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
			{x = 0, y = -1, z = 0}, {x = 0, y = -1, z = 0})
		default.player_attached[name] = true
		minetest.after(0.2, function()
			default.player_set_animation(clicker, "sit" , 30)
		end)
		clicker:set_look_horizontal(self.object:getyaw())
	end
end

function car.on_activate(self, staticdata, dtime_s)
	self.object:set_armor_groups({immortal = 1})
end

function car.on_punch(self, puncher)
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
				or not inv:contains_item("main", "driftcar:driftcar" .. name) then
		
		end
		minetest.after(0.1, function()
			self.object:remove()
		end)
	end
end

function car.on_step(self, dtime)
	local vel = self.object:getvelocity()
	local velmag = get_vecmag(vel)
	-- Early return for near-stationary vehicle with no driver
	if not self.driver and velmag < 0.01 and vel.y == 0 then
		self.object:setpos(self.object:getpos())
		self.object:setvelocity({x = 0, y = 0, z = 0})
		self.object:setacceleration({x = 0, y = 0, z = 0})
		return
	end

	-- Angle of yaw relative to velocity, -PI to PI
	local yawrtvel = angbet(
		wrap_yaw(self.object:getyaw()),
		get_theta(vel)
	)
	-- Velocity component linear to car
	local linvel = math.cos(yawrtvel) * velmag
	-- Touch ground bool
	local under_pos = self.object:getpos()
	under_pos.y = under_pos.y - 1.4
	local node_under = minetest.get_node(under_pos)
	local nodedef_under = minetest.registered_nodes[node_under.name]
	local touch = nodedef_under.walkable

	-- Torque acceleration applied linear to car
	local taccmag = 0

	-- Controls
	if self.driver and touch then
		local driver_objref = minetest.get_player_by_name(self.driver)
		if driver_objref then
			local ctrl = driver_objref:get_player_control()
			if ctrl.up or ctrl.down then
				-- Torque multiplier applied above 4nps to replicate reduction of
				-- motor torque with rotation speed.
				local torm = 1
				local abslinvel = math.abs(linvel)
				if abslinvel > 4 then
					torm = (SZTORQ - abslinvel) / sztorqmf
				end

				if ctrl.up then
					taccmag = GRIP * torm
				elseif ctrl.down then
					taccmag = -GRIP * torm
				end
			end
		else
			-- Player left server while driving
			-- In MT 5.0.0 use 'airboat:on_detach_child()' to do this
			self.driver = nil
			minetest.log("warning", "[driftcar] Driver left server while" ..
				" driving. This may cause some 'Pushing ObjectRef to" ..
				" removed/deactivated object' warnings.")
 		end
	end

	-- Early return for near-stationary vehicle with driver
	if taccmag == 0 and velmag < 0.01 and vel.y == 0 then
		self.object:setpos(self.object:getpos())
		self.object:setvelocity({x = 0, y = 0, z = 0})
		self.object:setacceleration({x = 0, y = 0, z = 0})
		return
	end

	-- Allows fast reduction of turn when no turn control
	local noturnctrl = true

	if self.driver and touch then
		local driver_objref = minetest.get_player_by_name(self.driver)
		if driver_objref then
			local ctrl = driver_objref:get_player_control()
			if ctrl.left then
				if self.rot == 0 then
					self.rot = TINIT
				else
					self.rot = self.rot + TACC
				end
				noturnctrl = false
			elseif ctrl.right then
				if self.rot == 0 then
					self.rot = -TINIT
				else
					self.rot = self.rot - TACC
				end
				noturnctrl = false
			end

			if AVIEW then
				driver_objref:set_look_horizontal(get_theta(vel))
			end
		else
			-- Player left server while driving
			-- In MT 5.0.0 use 'airboat:on_detach_child()' to do this
			self.driver = nil
 		end
	end

	-- If no turn control adjust turn towards zero
	local sr = get_sign(self.rot)
	if noturnctrl and touch then
		self.rot = self.rot - TDEC * sr
		if sr ~= get_sign(self.rot) then
			self.rot = 0
		end
	end
	-- Limit turn
	if math.abs(self.rot) > TMAX then
		self.rot = TMAX * get_sign(self.rot)
	end

	-- Acceleration caused by 4 Forces

	-- 1. Drag is proportional to velocity, assuming laminar flow
	local dragacc = vector.multiply(vel, -DRAG)

	-- 2. Rolling resistence is constant
	local rraccmag = 0
	if touch then
		if linvel > 0 then
			rraccmag = -ROLRES
		elseif linvel < 0 then
			rraccmag = ROLRES
		end
	end
	--local rracc = get_veccomp(rraccmag, self.object:getyaw(), 0)

	-- 3. Wheel torque acceleration
	--local tacc = get_veccomp(taccmag, self.object:getyaw(), 0)

	-- Combine taccmag and rraccmag since same direction
	local trracc = get_veccomp(taccmag + rraccmag, self.object:getyaw(), 0)

	-- 4. Tire lateral friction
	-- Velocity component lateral to car
	local tlfacc = {x = 0, y = 0, z = 0}
	if touch then
		local latvel = math.sin(yawrtvel) * velmag
		local tlfaccmag = math.min(math.max(latvel * 32, -GRIP), GRIP)
		tlfacc = get_veccomp(tlfaccmag, self.object:getyaw() + math.pi / 2, 0)

		-- Tire smoke
		if self.driver and math.random() < -0.05 + math.abs(latvel) / 30 then
			local opos = self.object:getpos()
			opos.y = opos.y - 0.5
			local yaw = self.object:getyaw()
			local yaw1 = yaw + math.pi * 0.25
			local yaw2 = yaw + math.pi * 0.75

			local srcomp1x = -math.sin(yaw1)
			local srcomp1z = math.cos(yaw1)
			local srcomp2x = -math.sin(yaw2)
			local srcomp2z = math.cos(yaw2)

			add_smoke_particle({
				x = opos.x + srcomp1x,
				y = opos.y,
				z = opos.z + srcomp1z
				}, self.driver)
			add_smoke_particle({
				x = opos.x - srcomp1x,
				y = opos.y,
				z = opos.z - srcomp1z
				}, self.driver)
			add_smoke_particle({
				x = opos.x + srcomp2x,
				y = opos.y,
				z = opos.z + srcomp2z
				}, self.driver)
			add_smoke_particle({
				x = opos.x - srcomp2x,
				y = opos.y,
				z = opos.z - srcomp2z
				}, self.driver)
		end
	end

	local new_acc = {
		x = trracc.x + dragacc.x + tlfacc.x,
		y = trracc.y + dragacc.y + tlfacc.y - GRAV,
		z = trracc.z + dragacc.z + tlfacc.z,
	}
	-- Turn multiplier
	local turm = 1
	-- Reduce turn below 4nps
	if velmag < 4 then
		turm = velmag / 4
	end
	-- Limit dtime to avoid too much turn
	dtime = math.min(dtime, 0.2)

	self.object:setpos(self.object:getpos())
	self.object:setvelocity(self.object:getvelocity())
	self.object:setacceleration(new_acc)
	self.object:setyaw(wrap_yaw(self.object:getyaw() + self.rot * dtime * turm))
end

-- Register entity

minetest.register_entity("driftcar:driftcar" .. name, car)

-- Craftitem

minetest.register_craftitem("driftcar:driftcar" .. name, {
	description = "Drift Car" .. name,
	inventory_image = "cars.png^[colorize:#"..colour..":70",
	wield_image = "none.png",
	wield_scale = {x = 2, y = 2, z = 2},

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

		pointed_thing.under.y = pointed_thing.under.y + 1.25
		local car = minetest.add_entity(pointed_thing.under,
			"driftcar:driftcar" .. name)
		if car then
			if placer then
				car:setyaw(placer:get_look_horizontal())
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


-- Nodebox

minetest.register_node("driftcar:driftcar_nodebox" ..name, {
	description = "Drift Car Nodebox" ..name,
	tiles = { -- Top, base, right, left, front, back
		"driftcar_top.png^[colorize:#"..colour..":70",
		"driftcar_base.png^[colorize:#"..colour..":70",
		"driftcar_right.png^[colorize:#"..colour..":70",
		"driftcar_left.png^[colorize:#"..colour..":70",
		"driftcar_front.png^[colorize:#"..colour..":70",
		"driftcar_back.png^[colorize:#"..colour..":70",
	},
	paramtype = "light",
	drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = { -- Widmin, heimin, lenmin, widmax, heimax, lenmax
				{-0.5,    0.125, -0.5,     0.5,     0.5,    0.4375}, -- Upper
				{-0.5,   -0.375, -0.5,     0.5,     0.125,  0.5},    -- Lower
				{-0.5,   -0.5,   -0.5,    -0.3125, -0.375, -0.1875}, -- Wheels
				{0.3125, -0.5,   -0.5,     0.5,    -0.375, -0.1875},
				{-0.5,   -0.5,    0.1875, -0.3125, -0.375,  0.5},
				{0.3125, -0.5,    0.1875,  0.5,    -0.375,  0.5},
			},
		},
	groups = {not_in_creative_inventory = 1},
})

end
