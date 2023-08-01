
### music Mod for Minetest
(c) 2017 orwell96
This mod is licensed under the LGPL 2.1 license.

Adds an easy but powerful background music backend.

## Usage:

For all players:
/mvolume <volume>
Set your individual music volume or disable background music (/mvolume 0). Saved across server restarts.
/music_list: list available music

With music privilege:
/music_play <id>: play a song
/music_stop: stop the current song. Unless /music_play or /music_next are invoked, no more music is played
/music_next [time]: Play the next song after [time] seconds, immediately if omitted.

## Votes:
This mod integrates with the [vote] mod by rubenwardy (https://github.com/minetest-mods/vote)
/vote_music_next - vote to start next song
/vote_music_play <id> - Vote to play certain sing

## Music credits:
rainymemory		2:10	1.0
-> (c) Deemo collection (game music collection)
