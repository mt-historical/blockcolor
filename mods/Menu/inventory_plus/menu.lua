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
inventory_plus.default = "main"

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

 .. "image_button_exit[0,0.5;1,1;blocks.png;blocks;]"
 .. "image_button_exit[1,0.5;1,1;stairs.png;stairs;]"
 .. "image_button_exit[2,0.5;1,1;slabs.png;slabs;]"
 .. "image_button_exit[3,0.5;1,1;windows.png;windows;]"
 .. "image_button_exit[4,0.5;1,1;lights.png;lights;]"
 .. "image_button_exit[5,0.5;1,1;waters.png;waters;]"
 .. "image_button_exit[6,0.5;1,1;doors.png;doors;] "
 .. "image_button_exit[7,0.5;1,1;carpets.png;carpets;]"
 .. "image_button_exit[0,2.5;1,1;trapdoor.png;trapdoor;]"
 .. "image_button_exit[1,2.5;1,1;fence.png;fence;]"
 .. "image_button_exit[2,2.5;1,1;cylinder.png;cylinder;]"
 .. "image_button_exit[3,2.5;1,1;triangle.png;triangle;]"
 .. "image_button_exit[4,2.5;1,1;long.png;long;]"
 .. "image_button_exit[5,2.5;1,1;cone.png;cone;]"
 .. "image_button_exit[6,2.5;1,1;sphere.png;sphere;]"
 .. "image_button_exit[7,2.5;1,1;cornera.png;outcorner;]"
 .. "image_button_exit[0,4.5;1,1;cornerb.png;incorner;]"
 .. "image_button_exit[1,4.5;1,1;arc.png;arc;]"
 .. "image_button_exit[2,4.5;1,1;arcin.png;inarc;]"
 .. "image_button_exit[3,4.5;1,1;arcout.png;outarc;]"
 .. "image_button_exit[4,4.5;1,1;fullpipe.png;fullpipe;]"
 .. "image_button_exit[5,4.5;1,1;fullpipeborder.png;fullpipeborder;]"
 .. "image_button_exit[6,4.5;1,1;edge.png;edge;]"
 .. "image_button[7,4.5;1,1;droite.png;nodes2;]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"

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

 .. "image_button_exit[0,0.5;1,1;edgecorner.png;edgecorner;]"
 
.. "image_button[0,6.5;1,1;gauche.png;nodes;]"
.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "image_button_exit[2,6.5;1,1;nones.png;none;]"

.. ""

	end

	if page == "animals" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec


.. "image_button_exit[0,0.5;1,1;mobs_chicken_egg_overlay.png;panda;]"
 
.. "image_button[0,6.5;1,1;gauche.png;main;]"

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

.. "image_button_exit[0,0.5;1,1;chair.png;chair;]"
.. "image_button_exit[1,0.5;1,1;sofas.png;sofas;]"
.. "image_button_exit[2,0.5;1,1;table.png;table;]"
.. "image_button_exit[3,0.5;1,1;signs.png;signs;]"
.. "image_button_exit[4,0.5;1,1;beds.png;beds;]"
.. "image_button_exit[5,0.5;1,1;flowers.png;flowers;]"
.. "image_button_exit[6,0.5;1,1;flag.png;flags;]"
.. "image_button_exit[7,0.5;1,1;computer.png;computers;]"
.. "image_button_exit[0,2.5;1,1;desk.png;desks;]"
.. "image_button_exit[1,2.5;1,1;bench.png;bench;]"
.. "image_button_exit[2,2.5;1,1;armoire.png;armoire;]"
.. "image_button_exit[3,2.5;1,1;frigo.png;frigo;]"
.. "image_button_exit[4,2.5;1,1;fbtrap.png;fbtrap;]"
.. "image_button_exit[5,2.5;1,1;fbstair.png;fbstair;]"
.. "image_button_exit[6,2.5;1,1;fbladder.png;fbladder;]"
.. "image_button_exit[7,2.5;1,1;cgherse.png;cgherse;]"
.. "image_button_exit[0,4.5;1,1;cgborder.png;cgborder;]"
.. "image_button_exit[1,4.5;1,1;cgdoor.png;cgdoor;]"
-- .. "image_button_exit[2,4.5;1,1;slabs.png;tslabs;]"
.. "image_button_exit[2,4.5;1,1;torch.png;torch;]"
.. "image_button_exit[3,4.5;1,1;invcross.png;shieldcross;]"
.. "image_button_exit[4,4.5;1,1;invslash.png;shieldslash;]"
.. "image_button_exit[5,4.5;1,1;invchevron.png;shieldchevron;]"
.."image_button_exit[6,4.5;1,1;trampo.png;trampoline;]"

.. "image_button[7,4.5;1,1;droite.png;furnitures2;]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
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

.. "image_button_exit[0,0.5;1,1;beaconon.png;beacon;]"
.. "image_button_exit[1,0.5;1,1;beaconoff.png;beaconoff;]"
 
.. "image_button[0,6.5;1,1;gauche.png;furnitures;]"
.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "image_button_exit[2,6.5;1,1;nones.png;none;]"

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

 .. "image_button_exit[0,0.5;1,1;cars.png;cars;]"
 .. "image_button_exit[1,0.5;1,1;surfboard.png;surfboard;]"
.. "image_button_exit[2,0.5;1,1;airboat_airboat_inv.png;airboat;]"
.. "image_button_exit[3,0.5;1,1;spaceship_spaceship_inv.png;spaceship;]"
.. "image_button_exit[4,0.5;1,1;hovercraft_inv.png;hovercraft;]"
.. "image_button_exit[5,0.5;1,1;hotair_inv.png;hotairballoon;]"
.. "image_button_exit[6,0.5;1,1;cart.png;carts;]"
.. "image_button_exit[7,0.5;1,1;carts_rail_straight_pwr.png;rails;]"

.. "image_button[0,6.5;1,1;gauche.png;main;]"
.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "image_button_exit[2,6.5;1,1;nones.png;none;]"

.. ""

	end

if page == "planets" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;mmars.png;mars;]"
 .. "image_button_exit[1,0.5;1,1;moon.png;moon;]"
 .. "image_button_exit[2,0.5;1,1;earth.png;earth;]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"

.. ""

	end

if page == "trees" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;smalltrees.png;smalltrees;]"
 .. "image_button_exit[1,0.5;1,1;normaltrees.png;normaltrees;]"
 .. "image_button_exit[2,0.5;1,1;bigtrees.png;bigtrees;]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"

.. ""

	end
	
	-- main page
	if page == "main" then

		-- buttons
		local x, y = 2, 0

		for k, v in pairs(inventory_plus.buttons[player:get_player_name()]) do

			formspec = formspec 

.. "image_button[2,0.5;4,1;;character_creator;Skin]"
.. "image_button[2,1.5;4,1;;vehicules;Vehicules]"

.. "image_button[2,2.5;4,1;;trees;Tree]"
.. "image_button[2,3.5;4,1;;animals;Animals]"

.. "image_button[2,4.5;4,1;;nodes;Build]"
.. "image_button[2,5.5;4,1;;furnitures;Decorations]"

.. "image_button_exit[2,6.5;4,1;;quit;Back To Game]"

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
