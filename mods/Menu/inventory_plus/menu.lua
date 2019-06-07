 --[[

Inventory Plus for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-inventory_plus
License: BSD-3-Clause https://raw.github.com/cornernote/minetest-inventory_plus/master/LICENSE

Edited by TenPlus1 (23rd March 2016)

]]--

-- expose api
inventory_plus = {}

-- define buttons
inventory_plus.buttons = {}

-- default inventory page
inventory_plus.default = minetest.settings:get("inventory_default") or "main"

-- register_button
inventory_plus.register_button = function(player, name, label)

	local player_name = player:get_player_name()

	if inventory_plus.buttons[player_name] == nil then
		inventory_plus.buttons[player_name] = {}
	end

	inventory_plus.buttons[player_name][name] = label
end

-- set_inventory_formspec
inventory_plus.set_inventory_formspec = function(player, formspec)

	 -- error checking
	if not formspec then
		return
	end

	if minetest.settings:get_bool("creative_mode") then

		-- if creative mode is on then wait a bit
		minetest.after(0.01,function()
			player:set_inventory_formspec(formspec)
		end)
	else
		player:set_inventory_formspec(formspec)
	end
end

-- create detached inventory for trashcan
local trashInv = minetest.create_detached_inventory(
	"trash", {
		on_put = function(inv, toList, toIndex, stack, player)
			inv:set_stack(toList, toIndex, ItemStack(nil))
		end
	})

trashInv:set_size("main", 1)

-- get_formspec
inventory_plus.get_formspec = function(player, page)

	if not player then
		return
	end

	-- default inventory page
	local formspec = "size[8,7.5]"
		.. default.gui_bg
		.. default.gui_bg_img
		.. ""

	-- nodes page
	if page == "nodes" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^blocks.png;blocks;]"
 .. "image_button_exit[1,0.5;1,1;gui_hotbar_selected.png^stairs.png;stairs;]"
 .. "image_button_exit[2,0.5;1,1;gui_hotbar_selected.png^slabs.png;slabs;]"
 .. "image_button_exit[3,0.5;1,1;gui_hotbar_selected.png^windows.png;windows;]"
 .. "image_button_exit[4,0.5;1,1;gui_hotbar_selected.png^lights.png;lights;]"
 .. "image_button_exit[5,0.5;1,1;gui_hotbar_selected.png^waters.png;waters;]"
 .. "image_button_exit[6,0.5;1,1;gui_hotbar_selected.png^doors.png;doors;] "
 .. "image_button_exit[7,0.5;1,1;gui_hotbar_selected.png^carpets.png;carpets;]"
 .. "image_button_exit[0,2.5;1,1;gui_hotbar_selected.png^trapdoor.png;trapdoor;]"
 .. "image_button_exit[1,2.5;1,1;gui_hotbar_selected.png^fence.png;fence;]"
 .. "image_button_exit[2,2.5;1,1;gui_hotbar_selected.png^cylinder.png;cylinder;]"
 .. "image_button_exit[3,2.5;1,1;gui_hotbar_selected.png^triangle.png;triangle;]"
 .. "image_button_exit[4,2.5;1,1;gui_hotbar_selected.png^long.png;long;]"
 .. "image_button_exit[5,2.5;1,1;gui_hotbar_selected.png^cone.png;cone;]"
 .. "image_button_exit[6,2.5;1,1;gui_hotbar_selected.png^sphere.png;sphere;]"
 .. "image_button_exit[7,2.5;1,1;gui_hotbar_selected.png^cornera.png;outcorner;]"
 .. "image_button_exit[0,4.5;1,1;gui_hotbar_selected.png^cornerb.png;incorner;]"
 .. "image_button_exit[1,4.5;1,1;gui_hotbar_selected.png^arc.png;arc;]"
 .. "image_button_exit[2,4.5;1,1;gui_hotbar_selected.png^arcin.png;inarc;]"
 .. "image_button_exit[3,4.5;1,1;gui_hotbar_selected.png^arcout.png;outarc;]"
 .. "image_button_exit[4,4.5;1,1;gui_hotbar_selected.png^fullpipe.png;fullpipe;]"
 .. "image_button_exit[5,4.5;1,1;gui_hotbar_selected.png^fullpipeborder.png;fullpipeborder;]"
 .. "image_button_exit[6,4.5;1,1;gui_hotbar_selected.png^edge.png;edge;]"
 .. "image_button[7,4.5;1,1;gui_hotbar_selected.png^droite.png;nodes2;]"

 .. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;main;]"
 .. "image_button_exit[1,6.5;1,1;gui_hotbar_selected.png^rotate.png;rotate;]"
 .. "image_button_exit[2,6.5;1,1;gui_hotbar_selected.png^nones.png;none;]"

.. ""

	end	

-- nodes page2

	if page == "nodes2" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

-- .. "image_button_exit[0,0.5;1,1;nctwoedge.png;nct;]" 
-- .. "label[0.1,1;Node-T]"

-- .. "image_button_exit[1,0.5;1,1;nccross.png;nccross;]"
-- .. "label[1.1,1;Cross]"

 .. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^edgecorner.png;edgecorner;]"
 
.. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;nodes;]"
.. "image_button_exit[1,6.5;1,1;gui_hotbar_selected.png^rotate.png;rotate;]"
.. "image_button_exit[2,6.5;1,1;gui_hotbar_selected.png^nones.png;none;]"

.. ""

	end

	if page == "animals" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec


.. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^mobs_chicken_egg_overlay.png;panda;]"
 
.. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;main;]"

.. ""

	end

-- furnitures page

if page == "furnitures" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

.. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^chair.png;chair;]"
.. "image_button_exit[1,0.5;1,1;gui_hotbar_selected.png^sofas.png;sofas;]"
.. "image_button_exit[2,0.5;1,1;gui_hotbar_selected.png^table.png;table;]"
.. "image_button_exit[3,0.5;1,1;gui_hotbar_selected.png^signs.png;signs;]"
.. "image_button_exit[4,0.5;1,1;gui_hotbar_selected.png^beds.png;beds;]"
.. "image_button_exit[5,0.5;1,1;gui_hotbar_selected.png^flowers.png;flowers;]"
.. "image_button_exit[6,0.5;1,1;gui_hotbar_selected.png^flag.png;flags;]"
.. "image_button_exit[7,0.5;1,1;gui_hotbar_selected.png^computer.png;computers;]"
.. "image_button_exit[0,2.5;1,1;gui_hotbar_selected.png^desk.png;desks;]"
.. "image_button_exit[1,2.5;1,1;gui_hotbar_selected.png^bench.png;bench;]"
.. "image_button_exit[2,2.5;1,1;gui_hotbar_selected.png^armoire.png;armoire;]"
.. "image_button_exit[3,2.5;1,1;gui_hotbar_selected.png^frigo.png;frigo;]"
.. "image_button_exit[4,2.5;1,1;gui_hotbar_selected.png^fbtrap.png;fbtrap;]"
.. "image_button_exit[5,2.5;1,1;gui_hotbar_selected.png^fbstair.png;fbstair;]"
.. "image_button_exit[6,2.5;1,1;gui_hotbar_selected.png^fbladder.png;fbladder;]"
.. "image_button_exit[7,2.5;1,1;gui_hotbar_selected.png^cgherse.png;cgherse;]"
.. "image_button_exit[0,4.5;1,1;gui_hotbar_selected.png^cgborder.png;cgborder;]"
.. "image_button_exit[1,4.5;1,1;gui_hotbar_selected.png^cgdoor.png;cgdoor;]"
-- .. "image_button_exit[2,4.5;1,1;gui_hotbar_selected.png^slabs.png;tslabs;]"
.. "image_button_exit[2,4.5;1,1;gui_hotbar_selected.png^torch.png;torch;]"
.. "image_button_exit[3,4.5;1,1;gui_hotbar_selected.png^invcross.png;shieldcross;]"
.. "image_button_exit[4,4.5;1,1;gui_hotbar_selected.png^invslash.png;shieldslash;]"
.. "image_button_exit[5,4.5;1,1;gui_hotbar_selected.png^invchevron.png;shieldchevron;]"
.."image_button_exit[6,4.5;1,1;gui_hotbar_selected.png^trampo.png;trampoline;]"

.. "image_button[7,4.5;1,1;gui_hotbar_selected.png^droite.png;furnitures2;]"

 .. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;main;]"
 .. "image_button_exit[1,6.5;1,1;gui_hotbar_selected.png^rotate.png;rotate;]"
 .. "image_button_exit[2,6.5;1,1;gui_hotbar_selected.png^nones.png;none;]"
 .. ""

	end

-- furnitures page2

	if page == "furnitures2" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

.. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^beaconon.png;beacon;]"
.. "image_button_exit[1,0.5;1,1;gui_hotbar_selected.png^beaconoff.png;beaconoff;]"
 
.. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;furnitures;]"
.. "image_button_exit[1,6.5;1,1;gui_hotbar_selected.png^rotate.png;rotate;]"
.. "image_button_exit[2,6.5;1,1;gui_hotbar_selected.png^nones.png;none;]"

.. ""

	end


-- Cars 

	if page == "vehicules" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^cars.png;cars;]"
 .. "image_button_exit[1,0.5;1,1;gui_hotbar_selected.png^surfboard.png;surfboard;]"
.. "image_button_exit[2,0.5;1,1;gui_hotbar_selected.png^airboat_airboat_inv.png;airboat;]"
.. "image_button_exit[3,0.5;1,1;gui_hotbar_selected.png^spaceship_spaceship_inv.png;spaceship;]"
.. "image_button_exit[4,0.5;1,1;gui_hotbar_selected.png^hovercraft_inv.png;hovercraft;]"
.. "image_button_exit[5,0.5;1,1;gui_hotbar_selected.png^hotair_inv.png;hotairballoon;]"
.. "image_button_exit[6,0.5;1,1;gui_hotbar_selected.png^cart.png;carts;]"
.. "image_button_exit[7,0.5;1,1;gui_hotbar_selected.png^carts_rail_straight_pwr.png;rails;]"

.. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;main;]"
.. "image_button_exit[1,6.5;1,1;gui_hotbar_selected.png^rotate.png;rotate;]"
.. "image_button_exit[2,6.5;1,1;gui_hotbar_selected.png^nones.png;none;]"

.. ""

	end

if page == "planets" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^mmars.png;mars;]"
 .. "image_button_exit[1,0.5;1,1;gui_hotbar_selected.png^moon.png;moon;]"
 .. "image_button_exit[2,0.5;1,1;gui_hotbar_selected.png^earth.png;earth;]"

 .. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;main;]"

.. ""

	end

if page == "trees" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;gui_hotbar_selected.png^smalltrees.png;smalltrees;]"
 .. "image_button_exit[1,0.5;1,1;gui_hotbar_selected.png^normaltrees.png;normaltrees;]"
 .. "image_button_exit[2,0.5;1,1;gui_hotbar_selected.png^bigtrees.png;bigtrees;]"

 .. "image_button[0,6.5;1,1;gui_hotbar_selected.png^gauche.png;main;]"

.. ""

	end
	
	-- main page
	if page == "main" then

		-- buttons
		local x, y = 2, 0

		for k, v in pairs(inventory_plus.buttons[player:get_player_name()]) do

			formspec = formspec 

.. "image_button[2,0.5;4,1;gui_hotbar_selected.png;character_creator;Skin]"
.. "image_button[2,1.5;4,1;gui_hotbar_selected.png;vehicules;Vehicules]"

.. "image_button[2,2.5;4,1;gui_hotbar_selected.png;trees;Tree]"
.. "image_button[2,3.5;4,1;gui_hotbar_selected.png;animals;Animals]"

.. "image_button[2,4.5;4,1;gui_hotbar_selected.png;nodes;Build]"
.. "image_button[2,5.5;4,1;gui_hotbar_selected.png;furnitures;Decorations]"

.. "image_button_exit[2,6.5;4,1;gui_hotbar_selected.png;quit;Back To Game]"

			x = x 
y = y + 1
		end
	end
	
	return formspec
end

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)

	minetest.after(1, function()

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, inventory_plus.default))
	end)
end)

-- register_on_player_receive_fields
minetest.register_on_player_receive_fields(function(player, formname, fields)

	-- main

	if fields.main then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "main"))

		return
	end

	-- craft
	if fields.nodes then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "nodes"))

		return
	end

if fields.nodes2 then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "nodes2"))

		return
	end

	if fields.furnitures then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "furnitures"))

		return
	end

if fields.furnitures2 then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "furnitures2"))

		return
	end

if fields.vehicules then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "vehicules"))

		return
	end

if fields.trees then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "trees"))

		return
	end

if fields.animals then

inventory_plus.set_inventory_formspec(player,
inventory_plus.get_formspec(player, "animals"))

return
end


	-- creative
	if fields.creative_prev
	or fields.creative_next then

		minetest.after(0.1, function()

			inventory_plus.set_inventory_formspec(player,
				inventory_plus.get_formspec(player, "creative"))
		end)

		return
	end
end)
