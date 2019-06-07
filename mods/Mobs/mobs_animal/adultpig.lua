
local S = mobs.intllib


-- Model by AspireMint (CC BY-SA 3.0)

mobs:register_mob("mobs_animal:adultpig", {
stepheight = 0.6,
	type = "animal",
	passive = true,
	group_attack = false,
	owner_loyal = true,
	attack_npcs = false,
	reach = 2,
	damage = 0,
	hp_min = 0,
	hp_max = 0,
	armor = 0,
 collisionbox = {-0.9, -0.9, -0.9, 0.9, 0.9, 0.9},
 inventory_image = "mobs_pig.png",
	visual = "mesh",
 visual_size = {x=2, y=2, z=2},
	mesh = "mobs_adult.b3d",
	textures = {
		{"mobs_pig.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_panda",
		attack = "mobs_panda",
	},
	walk_chance = 5,
	walk_velocity = 0.5,
	run_velocity = 1.5,
	jump = false,
	jump_height = 6,
	follow = {"color:orange"},
	view_range = 8,
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	fear_height = 6,
	animation = {
		speed_normal = 15,
		stand_start = 390,
		stand_end = 450,
		stand1_start = 0,
		stand1_end = 0,
		stand2_start = 1,
		stand2_end = 1,
		stand3_start = 2,
		stand3_end = 2,
		walk_start = 280,
		walk_end = 340,
		run_start = 10,
		run_end = 70,
		punch_start = 390,
		punch_end = 450,
		-- 0 = rest, 1 = hiding (covers eyes), 2 = surprised
	},


	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 20, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

	mobs:spawn({
		name = "mobs_animal:adultpig",
		nodes = {"comboblock:slab_green_onc_slab_orange"},
		neighbors = {"group:grass"},
		min_light = 14,
		interval = 60,
		chance = 15000,
		min_height = 0,
		max_height = 31000,
		day_toggle = true,
	})

mobs:register_egg("mobs_animal:adultpig", S("AdultPig"), "mobs_pig.png", 1)
