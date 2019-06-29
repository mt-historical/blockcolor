
music={}


music.pause_between_songs=minetest.settings:get("music.pause_between_songs") or 10

--end config

music.modpath=minetest.get_modpath("music")
if not music.modpath then
	error("music mod folder has to be named 'music'!")
end
--{name, length, gain~1}
music.songs = {}
local sfile, sfileerr=io.open(music.modpath..DIR_DELIM.."songs.txt")
if not sfile then error("Error opening songs.txt: "..sfileerr) end
for line in sfile:lines() do
	if line~="" and line[1]~="#" then
		local name, timeMinsStr, timeSecsStr, gainStr, title = string.match(line, "^(%S+)%s+(%d+):([%d%.]+)%s+([%d%.]+)%s*(.*)$")
		local timeMins, timeSecs, gain = tonumber(timeMinsStr), tonumber(timeSecsStr), tonumber(gainStr)
		if title=="" then title = name end
		if name and timeMins and timeSecs and gain then
			music.songs[#music.songs+1]={name=name, length=timeMins*60+timeSecs, lengthhr=timeMinsStr..":"..timeSecsStr, gain=gain, title=title}
		else
			minetest.log("warning", "[music] Misformatted song entry in songs.txt: "..line)
		end
	end
end
sfile:close()

if #music.songs==0 then
	print("[music]no songs registered, not doing anything")
	return
end

music.storage = minetest.get_mod_storage()

music.handles={}

music.playing=false
music.id_playing=nil
music.song_time_left=nil
music.time_next=10 --sekunden
music.id_last_played=nil

minetest.register_globalstep(function(dtime)
	if music.playing then
		if music.song_time_left<=0 then
			music.stop_song()
			music.time_next=music.pause_between_songs
		else
			music.song_time_left=music.song_time_left-dtime
		end
	elseif music.time_next then
		if music.time_next<=0 then
			music.next_song()
		else
			music.time_next=music.time_next-dtime
		end
	end
end)
music.play_song=function(id)
	if music.playing then
		music.stop_song()
	end
	local song=music.songs[id]
	if not song then return end
	for _,player in ipairs(minetest.get_connected_players()) do
		local pname=player:get_player_name()
		local pvolume=tonumber(music.storage:get_string("vol_"..pname))
		if not pvolume then pvolume=1 end
		if pvolume>0 then
			local handle = minetest.sound_play(song.name, {to_player=pname, gain=song.gain*pvolume})
			if handle then
				music.handles[pname]=handle
			end
		end
	end
	music.playing=id
	--adding 2 seconds as security
	music.song_time_left = song.length + 2
end
music.stop_song=function()
	for pname, handle in pairs(music.handles) do
		minetest.sound_stop(handle)
	end
	music.id_last_played=music.playing
	music.playing=nil
	music.handles={}
	music.time_next=nil
end

music.next_song=function()
	local next
	repeat
		next=math.random(1,#music.songs)
	until #music.songs==1 or next~=music.id_last_played
	music.play_song(next)
end

music.song_human_readable=function(id)
	if not tonumber(id) then return "<error>" end
	local song=music.songs[id]
	if not song then return "<error>" end
	return id..": "..song.title.." ["..song.lengthhr.."]"
end