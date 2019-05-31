-- Prevent certain players from killing / PvP

minetest.register_privilege("nokill", "Per-player hit prevention")

-- The admin always has all privileges, including the hit prevention
-- so we track the admin as a special case
local ADMIN = minetest.setting_get("name")

local ALLOWPUNCH = false
local DENYPUNCH = true

minetest.register_on_punchplayer(function(target, hitter, time_from_last_punch, tool_capabilities, dir, damage)
	if not hitter:is_player() then
		return ALLOWPUNCH
	end

	local hittername = hitter:get_player_name()

	local preventkill = minetest.check_player_privs(hitter:get_player_name(), {nokill=true})
	local isplayer = target:is_player() 

	return isplayer and preventkill and hittername ~= ADMIN
end)

--[[ Truth study

	PLAYER		NOKILL-on	DENY
	true		true		true
	false		true		false
	true		false		false
	false		false		false

	Operation:			AND
--]]
