/obj/effect/supply_drop/blink_kit
	desc = "A portable Bluespace Displacement Drive, otherwise known as a blink drive. Can teleport the user across short distances with a degree of unreliability, with potentially fatal results."

/obj/effect/supply_drop/rpgkit
	desc = "The V-71 is a man portable rocket propelled grenade launcher employed by the SOM. It's design has changed little over centuries and is light weight and cheap to manufacture, while capable of firing a wide variety of 84mm rockets to provide excellent tactical flexibility."

/obj/effect/supply_drop/rpgkit/Initialize()
	. = ..()
	new /obj/item/weapon/gun/launcher/rocket/som(loc)
	new /obj/item/storage/holster/backholster/rpg/som(loc)
	new /obj/item/storage/pouch/explosive/som(loc)
	return INITIALIZE_HINT_QDEL

/obj/effect/supply_drop/somvet/Initialize()
	. = ..()
	new /obj/item/clothing/head/modular/som/veteran(loc)
	new /obj/item/clothing/gloves/marine/som/veteran(loc)
	new /obj/item/clothing/glasses/meson(loc)
	return INITIALIZE_HINT_QDEL

/obj/item/storage/pouch/explosive/som
	name = "SOM rocket pouch"
	desc = "It can contain up to three RPG rockets."
	icon_state = "large_explosive"
	storage_slots = 3
	max_w_class = 3
	can_hold = list(
		/obj/item/ammo_magazine/rocket/som,
	)

/obj/item/storage/belt/lifesaver/som/full/Initialize()  //The belt, with all it's magic inside!
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/rig/medical/som
	name = "\improper S17 medical storage rig"
	desc = "A belt with heavy origins from the belt used by paramedics and doctors in the old mining colonies."
	icon = 'RUtgmc/icons/item/belts.dmi'
	icon_state = "medicalbelt_som"
	item_state = "medicbag_som"

/obj/item/storage/belt/rig/medical/som/full/Initialize()
	. = ..()
	new /obj/item/storage/pill_bottle/bicaridine(src)
	new /obj/item/storage/pill_bottle/kelotane(src)
	new /obj/item/storage/pill_bottle/tramadol(src)
	new /obj/item/storage/pill_bottle/tricordrazine(src)
	new /obj/item/storage/pill_bottle/dylovene(src)
	new /obj/item/storage/pill_bottle/inaprovaline(src)
	new /obj/item/storage/pill_bottle/dexalin(src)
	new /obj/item/storage/pill_bottle/spaceacillin(src)
	new /obj/item/storage/pill_bottle/alkysine(src)
	new /obj/item/storage/pill_bottle/imidazoline(src)
	new /obj/item/storage/pill_bottle/quickclot(src)
	new /obj/item/storage/pill_bottle/hypervene(src)
	new /obj/item/bodybag/cryobag(src)
	new /obj/item/roller(src)
	new /obj/item/defibrillator(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/belt/hypospraybelt/som
	name = "\improper S17 hypospray belt"
	desc = "A belt with heavy origins from the belt used by paramedics and doctors in the old mining colonies."
	icon = 'RUtgmc/icons/item/belts.dmi'
	icon_state = "hypospraybelt_som"
	item_state = "medicbag_som"

/obj/item/storage/belt/hypospraybelt/som/full/Initialize()  //The belt, with all it's magic inside!
	. = ..()
	new /obj/item/reagent_containers/hypospray/advanced/big/bicaridine(src)
	new /obj/item/reagent_containers/glass/bottle/bicaridine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/kelotane(src)
	new /obj/item/reagent_containers/glass/bottle/kelotane(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tramadol(src)
	new /obj/item/reagent_containers/glass/bottle/tramadol(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/tricordrazine(src)
	new /obj/item/reagent_containers/glass/bottle/tricordrazine(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/dylovene(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/inaprovaline(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/dexalin(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/spaceacillin(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/imialky(src)
	new /obj/item/reagent_containers/hypospray/advanced/big/quickclot(src)
	new /obj/item/reagent_containers/hypospray/advanced/hypervene(src)
	new /obj/item/healthanalyzer(src)

/obj/item/storage/pouch/medkit/som/medic/Initialize()
	. = ..()
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/burn_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/stack/medical/heal_pack/advanced/bruise_pack(src)
	new /obj/item/reagent_containers/hypospray/advanced/meraderm(src)

/obj/item/storage/pouch/magazine/pistol/large/som
	name = "pistol magazine pouch"
	desc = "This pouch can contain six pistol and revolver ammo magazines."
	icon = 'RUtgmc/icons/item/marine-pouches.dmi'
	storage_slots = 6
	icon_state = "large_pistol_mag_som"

/obj/item/storage/pouch/construction/som/full/Initialize()
	. = ..()
	new /obj/item/stack/sandbags_empty/half (src)
	new /obj/item/stack/barbed_wire/small_stack (src)
	new /obj/item/tool/shovel/etool (src)

/obj/item/storage/pouch/grenade/som/slightlyfull
	fill_type = /obj/item/explosive/grenade/stick
	fill_number = 4

/obj/item/storage/pouch/medkit/som/firstaid/Initialize()
	. = ..()
	new /obj/item/storage/pill_bottle/packet/bicaridine(src)
	new /obj/item/storage/pill_bottle/packet/kelotane(src)
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/storage/pill_bottle/packet/tricordrazine(src)
	new /obj/item/storage/pill_bottle/packet/dylovene(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/reagent_containers/hypospray/autoinjector/inaprovaline(src)

/obj/item/storage/pouch/flare/som
	icon = 'RUtgmc/icons/item/marine-pouches.dmi'
	icon_state = "flare_som"

/obj/item/storage/pouch/flare/som/full/Initialize()
	var/obj/item/flare_gun = new /obj/item/weapon/gun/grenade_launcher/single_shot/flare/marine(src)
	fill_number = max_storage_space - flare_gun.w_class
	return ..()

/obj/item/storage/belt/gun/revolver/standard_revolver/som
	name = "\improper S19-R revolver holster rig"
	desc = "A belt with origins dating back to old colony security holster rigs."
	icon = 'RUtgmc/icons/item/belts.dmi'
	icon_state = "tp44_holster_som"
	item_state = "som_belt_pistol"
	can_hold = list(
		/obj/item/weapon/gun/revolver/upp,
		/obj/item/weapon/gun/revolver/single_action/m44,
		/obj/item/ammo_magazine/revolver,
	)

/obj/item/storage/backpack/marine/standard/som
	name = "mining rucksack"
	desc = "A rucksack with origins dating back to the mining colonies."
	icon_state = "som_lightpack"
	item_state = "som_lightpack"

/obj/item/storage/belt/utility/som
	name = "\improper T14 pattern toolbelt"
	desc = "The T14 is the standard load-bearing equipment of the SOM. It consists of a modular belt with various clips. This version lacks any combat functionality, and is commonly used by engineers to transport important tools."
	icon = 'RUtgmc/icons/item/belts.dmi'
	icon_state = "utilitybelt_som"
	item_state = "som_belt"

/obj/item/storage/belt/utility/som/full/Initialize()
	. = ..()
	new /obj/item/tool/screwdriver(src)
	new /obj/item/tool/wrench(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/crowbar(src)
	new /obj/item/tool/wirecutters(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))
	new /obj/item/multitool(src)

/obj/item/storage/pouch/electronics/som
	icon = 'RUtgmc/icons/item/marine-pouches.dmi'
	icon_state = "electronics_som"

/obj/item/storage/pouch/electronics/som/full/Initialize()
	. = ..()
	new /obj/item/circuitboard/airlock (src)
	new /obj/item/circuitboard/apc (src)
	new /obj/item/cell/high (src)

/obj/item/clothing/suit/modular/som/heavy/leader/valkalt
	starting_attachments = list(
		/obj/item/armor_module/module/valkyrie_autodoc,
	)

/turf/closed/wall/mainship/outer/canterbury/alt
	icon = 'icons/turf/gorg_almayer.dmi'
	icon_state = "rwall0"
	walltype = "rwall"

/turf/closed/wall/mainship/outer/canterbury/alt/handle_icon_junction(junction)
	if (!walltype)
		return
	//lets make some detailed randomized shit happen.
	var/r1 = rand(0,10) //Make a random chance for this to happen
	if(junction == 12)
		switch(r1)
			if(0 to 8)
				icon_state = "[walltype]12"
	else
		icon_state = "[walltype][junction]"

/obj/structure/window/framed/mainship/canterbury/alt
	icon = 'icons/obj/structures/gorg_windows.dmi'
	icon_state = "prison_rwindow0"
	basestate = "prison_rwindow"
	smoothing_behavior = NO_SMOOTHING

/obj/structure/window_frame/mainship/prisonalt
	icon = 'icons/obj/structures/gorg_windows.dmi'
	icon_state = "prison_rwindow0_frame"
	basestate = "prison_rwindow"

/obj/structure/window/framed/mainship/canterbury/alt
	icon = 'icons/obj/structures/gorg_windows.dmi'
	icon_state = "prison_rwindow0"
	basestate = "prison_rwindow"
	window_frame = /obj/structure/window_frame/mainship/prisonalt

/obj/structure/window/framed/mainship/hull/canterbury/alt
	icon = 'icons/obj/structures/gorg_windows.dmi'
	icon_state = "prison_rwindow0"
	basestate = "prison_rwindow"
	smoothing_behavior = NO_SMOOTHING

/obj/machinery/bioprinter/som
	icon = 'RUtgmc/icons/object/vending.dmi'

/obj/machinery/bioprinter/som/stocked
	stored_metal = 1000
	stored_matter = 1000

//AMMO BOXES
/obj/item/ammo_magazine/packet/akm
	name = "box of 7.62x39mm"
	desc = "A box containing 120 rounds of 7.62x39."
	icon = 'RUtgmc/icons/item/ammunition.dmi'
	icon_state = "7.62x39"
	default_ammo = /datum/ammo/bullet/rifle/mpi_km
	caliber = CALIBER_762X39
	current_rounds = 120
	icon_state_mini = "ammo_packet"
	max_rounds = 120

/obj/item/ammo_magazine/packet/m16
	name = "box of 5.56x45mm"
	desc = "A box containing 90 rounds of 5.56x45."
	icon = 'RUtgmc/icons/item/ammunition.dmi'
	icon_state = "5.56x45"
	default_ammo = /datum/ammo/bullet/rifle
	caliber = CALIBER_556X45
	current_rounds = 90
	icon_state_mini = "ammo_packet"
	max_rounds = 90

/obj/item/ammo_magazine/packet/deagle
	name = "box of .50AE"
	desc = "A box containing 35 rounds of 5.56x45."
	icon = 'RUtgmc/icons/item/ammunition.dmi'
	icon_state = ".50AE"
	default_ammo = /datum/ammo/bullet/pistol/superheavy
	caliber = CALIBER_50AE
	current_rounds = 35
	icon_state_mini = "ammo_packet"
	max_rounds = 35

/obj/item/ammo_magazine/packet/ppsh
	name = "box of 7.62x25mm"
	desc = "A box containing 155 rounds of 7.62x25."
	icon = 'RUtgmc/icons/item/ammunition.dmi'
	icon_state = "7.62x25"
	default_ammo = /datum/ammo/bullet/smg
	caliber = CALIBER_762X25
	current_rounds = 155
	icon_state_mini = "ammo_packet"
	max_rounds = 155

/obj/effect/landmark/start/job/som/squadleader/ru
	icon = 'RUtgmc/icons/mob/landmarks.dmi'
	icon_state = "SL"

/obj/effect/landmark/start/job/som/squadstandard/ru
	icon = 'RUtgmc/icons/mob/landmarks.dmi'
	icon_state = "infantry"

/obj/effect/landmark/start/job/som/squadcorpsman/ru
	icon = 'RUtgmc/icons/mob/landmarks.dmi'
	icon_state = "medic"

/obj/effect/landmark/start/job/som/squadveteran/ru
	icon = 'RUtgmc/icons/mob/landmarks.dmi'
	icon_state = "veteran"

/obj/effect/landmark/start/job/som/squadengineer/ru
	icon = 'RUtgmc/icons/mob/landmarks.dmi'
	icon_state = "engineer"

/obj/effect/landmark/start/job/som/supportdroid
	icon = 'RUtgmc/icons/mob/landmarks.dmi'
	icon_state = "droid"
	job = /datum/job/som/silicon/droid

/obj/item/weapon/gun/shotgun/pump/lever/repeater/raven
	name = "Raven Repeater"
	icon = 'RUtgmc/icons/item/gun64.dmi'
	icon_state = "raven_repeater"
	item_state = "raven_repeater"
	inhand_x_dimension = 64
	inhand_y_dimension = 32
	max_chamber_items = 9
	fire_sound = "winchester_fire"
	cocked_sound = "winchester_lever"
	hand_reload_sound = "winchester_reload"
	item_icons = list(
		slot_l_hand_str = 'RUtgmc/icons/mob/items_lefthand_64.dmi',
		slot_r_hand_str = 'RUtgmc/icons/mob/items_righthand_64.dmi',
		slot_s_store_str = 'RUtgmc/icons/mob/suit_slot.dmi',
		slot_back_str = 'RUtgmc/icons/mob/back.dmi',)

	aim_fire_delay = 0.2 SECONDS

	fire_delay = 7
	accuracy_mult = 2
	accuracy_mult_unwielded = 0.3
	damage_falloff_mult = 0.3
	scatter = -8
	scatter_unwielded = 14
	recoil = 0
	recoil_unwielded = 4
	aim_slowdown = 0.3

/turf/open/floor/mainship/som/alt
	icon = 'RUtgmc/icons/turf/som_flag.dmi'
	icon_state = "somn"

/turf/open/floor/mainship/som/alt/south
	icon_state = "soms"

/turf/open/floor/mainship/som/alt/northwest
	icon_state = "somnw"

/turf/open/floor/mainship/som/alt/southwest
	icon_state = "somsw"

/turf/open/floor/mainship/som/alt/southeast
	icon_state = "somse"

/turf/open/floor/mainship/som/alt/northeast
	icon_state = "somne"

/obj/structure/sign/prop1/som
	icon = 'RUtgmc/icons/turf/som_flag.dmi'
	name = "\improper Sons of Mars symbol"
	desc = "The symbol of the SoM."
	icon_state = "som_decal"

/obj/structure/sign/prop1/som/Initialize()
	. = ..()
	icon = 'RUtgmc/icons/turf/som_flag.dmi'
	if(!directional) //if not directional do not initialize to a x or y offset
		return
	switch(dir)
		if(NORTH)
			pixel_y = 0
		if(SOUTH)
			pixel_y = 0
		if(EAST)
			pixel_x = 0
		if(WEST)
			pixel_x = 0
