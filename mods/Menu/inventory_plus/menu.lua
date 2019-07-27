 --[[

Inventory Plus for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-inventory_plus
License: BSD-3-Clause https://raw.github.com/cornernote/minetest-inventory_plus/master/LICENSE

Edited by TenPlus1 (23rd March 2016)

]]--

-- For Tooltip : First is name of button, Two is description

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
 .. "tooltip[blocks;Block]"

 .. "image_button_exit[1,0.5;1,1;stairs.png;stairs;]"
 .. "tooltip[stairs;Stair]"

 .. "image_button_exit[2,0.5;1,1;slabs.png;slabs;]"
 .. "tooltip[slabs;Slab]"

 .. "image_button_exit[3,0.5;1,1;windows.png;windows;]"
 .. "tooltip[windows;Window]"

 .. "image_button_exit[4,0.5;1,1;lights.png;lights;]"
 .. "tooltip[lights;Light]"

 .. "image_button_exit[5,0.5;1,1;waters.png;waters;]"
 .. "tooltip[waters;Water]"

 .. "image_button_exit[6,0.5;1,1;doors.png;doors;] "
 .. "tooltip[doors;Door]"

 .. "image_button_exit[7,0.5;1,1;carpets.png;carpets;]"
 .. "tooltip[carpets;Carpet]"

 .. "image_button_exit[0,2.5;1,1;trapdoor.png;trapdoor;]"
 .. "tooltip[trapdoor;Trapdoor]"

 .. "image_button_exit[1,2.5;1,1;fence.png;fence;]"
 .. "tooltip[fence;Fence]"

 .. "image_button_exit[2,2.5;1,1;cylinder.png;cylinder;]"
 .. "tooltip[cylinder;Cylinder]"

 .. "image_button_exit[3,2.5;1,1;triangle.png;triangle;]"
 .. "tooltip[triangle;Triangle]"

 .. "image_button_exit[4,2.5;1,1;long.png;long;]"
 .. "tooltip[long;Long Triangle]"

 .. "image_button_exit[5,2.5;1,1;cone.png;cone;]"
 .. "tooltip[cone;Cone]"

 .. "image_button_exit[6,2.5;1,1;sphere.png;sphere;]"
 .. "tooltip[sphere;Sphere]"

 .. "image_button_exit[7,2.5;1,1;cornera.png;outcorner;]"
 .. "tooltip[outcorner;Out Corner]"

 .. "image_button_exit[0,4.5;1,1;cornerb.png;incorner;]"
 .. "tooltip[incorner;In Corner]"

 .. "image_button_exit[1,4.5;1,1;arc.png;arc;]"
 .. "tooltip[arc;Arc]"

 .. "image_button_exit[2,4.5;1,1;arcin.png;inarc;]"
 .. "tooltip[inarc;In Arc]"

 .. "image_button_exit[3,4.5;1,1;arcout.png;outarc;]"
 .. "tooltip[outarc;Out Arc]"

 .. "image_button_exit[4,4.5;1,1;fullpipe.png;fullpipe;]"
 .. "tooltip[fullpipe;Fullpipe]"

 .. "image_button_exit[5,4.5;1,1;fullpipeborder.png;fullpipeborder;]"
 .. "tooltip[fullpipeborder;Fullpipe Border]"

 .. "image_button_exit[6,4.5;1,1;edge.png;edge;]"
 .. "tooltip[edge;Edge]"

 .. "image_button[7,4.5;1,1;droite.png;nodes2;]"
 .. "tooltip[nodes2;Nodes Page 2]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "tooltip[main;Back to Menu]"

 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "tooltip[rotate;Rotate]"

 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
 .. "tooltip[none;None]"


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

 .. "image_button_exit[0,0.5;1,1;edgecorner.png;edgecorner;]"
 .. "tooltip[edgecorner;Edge corner]"
 
.. "image_button[0,6.5;1,1;gauche.png;nodes;]"
.. "tooltip[nodes;Nodes Page 1]"

.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "tooltip[rotate;Rotate]"

.. "image_button_exit[2,6.5;1,1;nones.png;none;]"
.. "tooltip[none;None]"

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
.. "tooltip[panda;Animals & Tools]"
 
.. "image_button[0,6.5;1,1;gauche.png;main;]"
.. "tooltip[main;Back to Menu]"

.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "tooltip[rotate;Rotate]"

.. "image_button_exit[2,6.5;1,1;nones.png;none;]"
.. "tooltip[none;None]"

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
.. "tooltip[chair;Chair]"

.. "image_button_exit[1,0.5;1,1;sofas.png;sofas;]"
.. "tooltip[sofas;Armchair]"

.. "image_button_exit[2,0.5;1,1;table.png;table;]"
.. "tooltip[table;Table]"

.. "image_button_exit[3,0.5;1,1;signs.png;signs;]"
.. "tooltip[signs;Sign]"

.. "image_button_exit[4,0.5;1,1;beds.png;beds;]"
.. "tooltip[beds;Bed]"

.. "image_button_exit[5,0.5;1,1;flowers.png;flowers;]"
.. "tooltip[flowers;Flower]"

.. "image_button_exit[6,0.5;1,1;flag.png;flags;]"
.. "tooltip[flags;Flag]"

.. "image_button_exit[7,0.5;1,1;computer.png;computers;]"
.. "tooltip[computers;Computer]"

.. "image_button_exit[0,2.5;1,1;desk.png;desks;]"
.. "tooltip[desks;Desk]"

.. "image_button_exit[1,2.5;1,1;bench.png;bench;]"
.. "tooltip[bench;Bench]"

.. "image_button_exit[2,2.5;1,1;armoire.png;armoire;]"
.. "tooltip[armoire;Cabinet]"

.. "image_button_exit[3,2.5;1,1;frigo.png;frigo;]"
.. "tooltip[frigo;Fridge]"

.. "image_button_exit[4,2.5;1,1;fbtrap.png;fbtrap;]"
.. "tooltip[fbtrap;Strap]"

.. "image_button_exit[5,2.5;1,1;fbstair.png;fbstair;]"
.. "tooltip[fbstair;Stair]"

.. "image_button_exit[6,2.5;1,1;fbladder.png;fbladder;]"
.. "tooltip[fbladder;Ladder]"

.. "image_button_exit[7,2.5;1,1;cgherse.png;cgherse;]"
.. "tooltip[cgherse;Cg Harrow]"

.. "image_button_exit[0,4.5;1,1;cgborder.png;cgborder;]"
.. "tooltip[cgborder;Cg Border]"

.. "image_button_exit[1,4.5;1,1;cgdoor.png;cgdoor;]"
.. "tooltip[cgdoor;Cg Door]"

.. "image_button_exit[2,4.5;1,1;torch.png;torch;]"
.. "tooltip[torch;Torch]"

.. "image_button_exit[3,4.5;1,1;invcross.png;shieldcross;]"
.. "tooltip[shieldcross;Shield cross]"

.. "image_button_exit[4,4.5;1,1;invslash.png;shieldslash;]"
.. "tooltip[shieldslash;Shield slash]"

.. "image_button_exit[5,4.5;1,1;invchevron.png;shieldchevron;]"
.. "tooltip[shieldchevron;Shield chevron]"

.."image_button_exit[6,4.5;1,1;trampo.png;trampoline;]"
.. "tooltip[trampoline;Trampoline]"

.. "image_button[7,4.5;1,1;droite.png;furnitures2;]"
.. "tooltip[furnitures2;Furnitures Page 2]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "tooltip[main;Back to Menu]"

 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "tooltip[rotate;Rotate]"

 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
 .. "tooltip[none;None]"
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
.. "tooltip[beacon;Beacon]"

.. "image_button_exit[1,0.5;1,1;beaconoff.png;beaconoff;]"
.. "tooltip[beaconoff;Beacon Off]"
 
.. "image_button[0,6.5;1,1;gauche.png;furnitures;]"
.. "tooltip[furnitures;Furnitures Page1]"

.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "tooltip[rotate;Rotate]"

.. "image_button_exit[2,6.5;1,1;nones.png;none;]"
.. "tooltip[none;None]"

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
 .. "tooltip[cars;Car]"

 .. "image_button_exit[1,0.5;1,1;surfboard.png;surfboard;]"
 .. "tooltip[surfboard;Surfboard]"

.. "image_button_exit[2,0.5;1,1;airboat_airboat_inv.png;airboat;]"
.. "tooltip[airboat;AirBoat]"

.. "image_button_exit[3,0.5;1,1;spaceship_spaceship_inv.png;spaceship;]"
.. "tooltip[spaceship;SpaceShip]"

.. "image_button_exit[4,0.5;1,1;hovercraft_inv.png;hovercraft;]"
.. "tooltip[hovercraft;Hovercraft]"

.. "image_button_exit[5,0.5;1,1;hotair_inv.png;hotairballoon;]"
.. "tooltip[hotairballoon;HotairBallon]"

.. "image_button_exit[6,0.5;1,1;cart.png;carts;]"
.. "tooltip[carts;Cart]"

.. "image_button_exit[7,0.5;1,1;carts_rail_straight_pwr.png;rails;]"
.. "tooltip[rails;Rail]"

.. "image_button[0,6.5;1,1;gauche.png;main;]"
.. "tooltip[main;Back to Menu]"

.. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
.. "tooltip[rotate;Rotate]"

.. "image_button_exit[2,6.5;1,1;nones.png;none;]"
.. "tooltip[none;None]"


.. ""

	end

if page == "planets" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

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
 .. "tooltip[smalltrees;Small Tree]"
 .. "image_button_exit[1,0.5;1,1;normaltrees.png;normaltrees;]"
 .. "tooltip[normaltrees;Tree]"
 .. "image_button_exit[2,0.5;1,1;bigtrees.png;bigtrees;]"
 .. "tooltip[bigtrees;Big Tree]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "tooltip[main;Back to Menu]"
 
 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "tooltip[rotate;Rotate]"
 
 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
 .. "tooltip[none;None]"

.. ""

	end

	-- letters page
	if page == "mathmenu" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;0.png;math0;]"
 .. "tooltip[math0;0]" 
 
 .. "image_button_exit[1,0.5;1,1;1.png;math1;]"
 .. "tooltip[math1;1]"

 .. "image_button_exit[2,0.5;1,1;2.png;math2;]"
 .. "tooltip[math2;2]"

 .. "image_button_exit[3,0.5;1,1;3.png;math3;]"
 .. "tooltip[math3;3]"

 .. "image_button_exit[4,0.5;1,1;4.png;math4;]"
 .. "tooltip[math4;4]"

 .. "image_button_exit[5,0.5;1,1;5.png;math5;]"
 .. "tooltip[math5;5]"

 .. "image_button_exit[6,0.5;1,1;6.png;math6;]"
 .. "tooltip[math6;6]"

 .. "image_button_exit[7,0.5;1,1;7.png;math7;]"
 .. "tooltip[math7;7]"

 .. "image_button_exit[0,2.5;1,1;8.png;math8;]"
 .. "tooltip[math8;8]"

 .. "image_button_exit[1,2.5;1,1;9.png;math9;]"
 .. "tooltip[math9;9]"

 .. "image_button_exit[2,2.5;1,1;egale.png;mathegale;]"
 .. "tooltip[mathegale;Equal to]"

 .. "image_button_exit[3,2.5;1,1;inferieure.png;mathinferieure;]"
 .. "tooltip[mathinferieure;Less than]"

 .. "image_button_exit[4,2.5;1,1;superieure.png;mathsuperieure;]"
 .. "tooltip[mathsuperieure;Greater than]"

 .. "image_button_exit[5,2.5;1,1;diviser.png;mathdiviser;]"
 .. "tooltip[mathdiviser;Divide]"

 .. "image_button_exit[6,2.5;1,1;plus.png;mathplus;]"
 .. "tooltip[mathplus;Plus]"

 .. "image_button_exit[7,2.5;1,1;moins.png;mathmoins;]"
 .. "tooltip[mathmoins;Minus]"

 .. "image_button_exit[0,4.5;1,1;multiplier.png;mathmultiplier;]"
 .. "tooltip[mathmultiplier;Multiply]"

 .. "image_button_exit[1,4.5;1,1;virgule.png;mathvirgule;]"
 .. "tooltip[mathvirgule;Comma]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "tooltip[main;Back to Menu]"

 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "tooltip[rotate;Rotate]"

 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
 .. "tooltip[none;None]"

.. ""

	end	

	-- letters page
	if page == "lettermenu" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;a.png;lettera;]"
 .. "tooltip[lettera;A]"

 .. "image_button_exit[1,0.5;1,1;b.png;letterb;]"
 .. "tooltip[letterb;B]"

 .. "image_button_exit[2,0.5;1,1;c.png;letterc;]"
 .. "tooltip[letterc;C]"

 .. "image_button_exit[3,0.5;1,1;d.png;letterd;]"
 .. "tooltip[letterd;D]"

 .. "image_button_exit[4,0.5;1,1;e.png;lettere;]"
 .. "tooltip[lettere;E]"

 .. "image_button_exit[5,0.5;1,1;f.png;letterf;]"
 .. "tooltip[letterf;F]"

 .. "image_button_exit[6,0.5;1,1;g.png;letterg;]"
 .. "tooltip[letterg;G]"

 .. "image_button_exit[7,0.5;1,1;h.png;letterh;]"
 .. "tooltip[letterh;H]"

 .. "image_button_exit[0,2.5;1,1;i.png;letteri;]"
 .. "tooltip[letteri;I]"

 .. "image_button_exit[1,2.5;1,1;j.png;letterj;]"
 .. "tooltip[letterj;J]"

 .. "image_button_exit[2,2.5;1,1;k.png;letterk;]"
 .. "tooltip[letterk;K]"

 .. "image_button_exit[3,2.5;1,1;l.png;letterl;]"
 .. "tooltip[letterl;L]"

 .. "image_button_exit[4,2.5;1,1;m.png;letterm;]"
 .. "tooltip[letterm;M]"

 .. "image_button_exit[5,2.5;1,1;n.png;lettern;]"
 .. "tooltip[lettern;N]"

 .. "image_button_exit[6,2.5;1,1;o.png;lettero;]"
 .. "tooltip[lettero;O]"

 .. "image_button_exit[7,2.5;1,1;p.png;letterp;]"
 .. "tooltip[letterp;P]"

 .. "image_button_exit[0,4.5;1,1;q.png;letterq;]"
 .. "tooltip[letterq;Q]"

 .. "image_button_exit[1,4.5;1,1;r.png;letterr;]"
 .. "tooltip[letterr;R]"

 .. "image_button_exit[2,4.5;1,1;s.png;letters;]"
 .. "tooltip[letters;S]"

 .. "image_button_exit[3,4.5;1,1;t.png;lettert;]"
 .. "tooltip[lettert;T]"

 .. "image_button_exit[4,4.5;1,1;u.png;letteru;]"
 .. "tooltip[letteru;U]"

 .. "image_button_exit[5,4.5;1,1;v.png;letterv;]"
 .. "tooltip[letterv;V]"

 .. "image_button_exit[6,4.5;1,1;w.png;letterw;]"
 .. "tooltip[letterw;W]"

 .. "image_button[7,4.5;1,1;droite.png;lettermenu2;]"
 .. "tooltip[lettermenu2;Letters Page 2]"

 .. "image_button[0,6.5;1,1;gauche.png;main;]"
 .. "tooltip[main;Back to Menu]"

 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "tooltip[rotate;Rotate]"

 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
 .. "tooltip[none;None]"

.. ""

	end	

	-- letters page 2

	if page == "lettermenu2" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec

 .. "image_button_exit[0,0.5;1,1;x.png;letterx;]"
 .. "tooltip[letterx;X]"
 
 .. "image_button_exit[1,0.5;1,1;y.png;lettery;]"
 .. "tooltip[lettery;Y]"

 .. "image_button_exit[2,0.5;1,1;z.png;letterz;]"
 .. "tooltip[letterz;Z]"

 .. "image_button[0,6.5;1,1;gauche.png;lettermenu;]"
 .. "tooltip[lettermenu;Letters Page 1]"

 .. "image_button_exit[1,6.5;1,1;rotate.png;rotate;]"
 .. "tooltip[rotate;Rotate]"

 .. "image_button_exit[2,6.5;1,1;nones.png;none;]"
 .. "tooltip[none;None]"

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

.. "image_button[2,2.5;4,1;;trees;Trees]"
.. "image_button[2,3.5;4,1;;animals;Animals]"

.. "image_button[2,4.5;2,1;;nodes;Builds]"
.. "image_button[4,4.5;2,1;;furnitures;Decorations]"

.. "image_button[2,5.5;2,1;;lettermenu;Letters]"
.. "image_button[4,5.5;2,1;;mathmenu;Maths]"

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

	if fields.lettermenu then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "lettermenu"))

		return
	end

	if fields.lettermenu2 then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "lettermenu2"))

		return
	end

	if fields.mathmenu then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "mathmenu"))

		return
	end

	if fields.lettermenu2 then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "mathmenu2"))

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
