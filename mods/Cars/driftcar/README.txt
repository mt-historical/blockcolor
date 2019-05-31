driftcar 0.1.12 by paramat
For Minetest 0.4.16 and later. Compatible with Minetest 5.0.0-dev.
Depends: default

Licenses
--------
Source code: MIT
Media (textures and car nodebox): CC BY-SA 3.0

Description
-----------
A vehicle using some physics modelling for more realistic behaviour.

Usage
-----
Due to client->server->client control delay this mod is best used in
singleplayer or in local multiplayer.
Intensive mods that cause long server lags, such as Lua mapgen mods, will affect
the responsiveness of the vehicle, even in singleplayer.

There is no crafting recipe, the vehicle can be found in the creative inventory.
Third-person camera mode is recommended when driving for a better view.
If parameter 'AVIEW' in the 'init.lua' file is set to 'true', view is
automatically set to vehicle velocity direction.

Controls
--------
Right mouse button = Enter or exit car when pointing at car.
Forward            = Speed up.
                     Slow down when moving backwards.
Backward           = Slow down.
                     Speed up when moving backwards.
Left               = Rotate anticlockwise.
Right              = Rotate clockwise.
