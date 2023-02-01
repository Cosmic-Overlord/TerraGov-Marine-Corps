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
	icon_state = "flare_som"

/obj/item/storage/pouch/flare/som/full/Initialize()
	var/obj/item/flare_gun = new /obj/item/weapon/gun/grenade_launcher/single_shot/flare/marine(src)
	fill_number = max_storage_space - flare_gun.w_class
	return ..()

/obj/item/storage/belt/gun/revolver/standard_revolver/som
	name = "\improper S19-R revolver holster rig"
	desc = "A belt with origins dating back to old colony security holster rigs."
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

