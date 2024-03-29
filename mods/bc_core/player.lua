-- Minetest 0.4 mod: player
-- See README.txt for licensing and other information.

-- Player animation blending
-- Note: This is currently broken due to a bug in Irrlicht, leave at 0
local animation_blend = 0

bc_core.registered_player_models = { }

-- Local for speed.
local models = bc_core.registered_player_models

function bc_core.player_register_model(name, def)
	models[name] = def
end

-- License Model Player : CC0
-- https://opengameart.org/content/animated-human-low-poly
-- Model Player by Quaternius

-- Modify and Export b3d by Kroukuk

-- Default player appearance
bc_core.player_register_model("character.b3d", {
	animation_speed = 60,
	textures = {"character.png", },
	animations = {

--run: x=322 y=338
--work: x=426 y=581

		stand     = { x=26, y=266, },
		lay       = { x=339, y=424, },
		walk      = { x=295, y=320, },
  	mine      = { x=268, y=292, },

--walk_fast = { x=322, y=338, },
--dog_mine  = { x=426, y=581, },
  walk_mine = { x=0, y=0, },
  sit       = { x= 0, y=0, },
--jump      = { x= 0, y=24, },

	},
})

-- Player stats and animations
local player_model = {}
local player_textures = {}
local player_anim = {}
local player_sneak = {}
bc_core.player_attached = {}

function bc_core.player_get_animation(player)
	local name = player:get_player_name()
	return {
		model = player_model[name],
		textures = player_textures[name],
		animation = player_anim[name],
	}
end

-- Called when a player's appearance needs to be updated
function bc_core.player_set_model(player, model_name)
	local name = player:get_player_name()
	local model = models[model_name]
	if model then
		if player_model[name] == model_name then
			return
		end
		player:set_properties({
			mesh = model_name,
			textures = player_textures[name] or model.textures,
			visual = "mesh",
			visual_size = 4,
			collisionbox = model.collisionbox or {-0.3, -1.00, -0.3, 0.3, 1.0, 0.3},
			stepheight = model.stepheight or 0.4,
			eye_height = model.eye_height or 0.8,
		})
		bc_core.player_set_animation(player, "stand")
	else
		player:set_properties({
			textures = { "player.png", "player_back.png", },
			visual = "upright_sprite",
		})
	end
	player_model[name] = model_name
end

function bc_core.player_set_textures(player, textures)
	local name = player:get_player_name()
	player_textures[name] = textures
	player:set_properties({textures = textures,})
end

function bc_core.player_set_animation(player, anim_name, speed)
	local name = player:get_player_name()
	if player_anim[name] == anim_name then
		return
	end
	local model = player_model[name] and models[player_model[name]]
	if not (model and model.animations[anim_name]) then
		return
	end
	local anim = model.animations[anim_name]
	player_anim[name] = anim_name
	player:set_animation(anim, speed or model.animation_speed, animation_blend)
end

-- Update appearance when the player joins
minetest.register_on_joinplayer(function(player)
	bc_core.player_attached[player:get_player_name()] = false
	bc_core.player_set_model(player, "character.b3d")
	player:set_local_animation({x=0, y=0}, {x=0, y=0}, {x=0, y=0}, {x=0, y=0}, 0)

	player:hud_set_hotbar_image("gui_hotbar.png")
	player:hud_set_hotbar_selected_image("gui_hotbar_selected.png")
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_model[name] = nil
	player_anim[name] = nil
	player_textures[name] = nil
end)

-- Localize for better performance.
local player_set_animation = bc_core.player_set_animation
local player_attached = bc_core.player_attached

-- Check each player and apply animations
minetest.register_globalstep(function(dtime)
	for _, player in pairs(minetest.get_connected_players()) do
		local name = player:get_player_name()
		local model_name = player_model[name]
		local model = model_name and models[model_name]
		if model and not player_attached[name] then
			local controls = player:get_player_control()
			local walking = false
			local animation_speed_mod = model.animation_speed or 30

			-- Determine if the player is walking
			if controls.up or controls.down or controls.left or controls.right then
				walking = true
			end

			-- Determine if the player is sneaking, and reduce animation speed if so
			if controls.sneak then
				animation_speed_mod = animation_speed_mod / 2
			end

			-- Apply animations based on what the player is doing
			if player:get_hp() == 0 then
				player_set_animation(player, "lay")
			elseif walking then
				if player_sneak[name] ~= controls.sneak then
					player_anim[name] = nil
					player_sneak[name] = controls.sneak
				end
				if controls.LMB then
					player_set_animation(player, "walk_mine", animation_speed_mod)
				else
					player_set_animation(player, "walk", animation_speed_mod)
				end
			elseif controls.LMB then
				player_set_animation(player, "mine")
			else
				player_set_animation(player, "stand", animation_speed_mod)
			end
		end
	end
end)
