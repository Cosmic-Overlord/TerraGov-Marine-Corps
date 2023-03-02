//////////////////
//////UNIFORM/////
//////////////////
/obj/item/clothing/under/marine/ru
	name = "RUTGMS UNIFORM"
	desc = "RUTGMS UNIFORM"
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_w_uniform_str = 'RUtgmc/icons/mob/clothes.dmi')
	adjustment_variants = list()

/obj/item/clothing/under/marine/ru/black
	name = "Mercenary uniform"
	desc = "Some tasteless uniform using by security specialized mercs. Usually stocks of this uniform refills by dead mercs on colonies attacked by xenomorphs."
	icon_state = "merc"
	item_state = "merc"
	adjustment_variants = list(
		"Down" = "_d",
	)

/obj/item/clothing/under/marine/ru/slav
	name = "Old slavic uniform"
	desc = "This is some sports suit. Oh wait, this is slavic military uniform."
	icon_state = "slav"
	item_state = "slav"

/obj/item/clothing/under/marine/ru/gorka_eng
	name = "Engineer Gorka"
	desc = "Gorka. Engineer Gorka."
	icon_state = "gorka_eng"
	item_state = "gorka_eng"

/obj/item/clothing/under/marine/ru/gorka_med
	name = "Medic Gorka"
	desc = "Gorka. Medic Gorka."
	icon_state = "gorka_med"
	item_state = "gorka_med"

/obj/item/clothing/under/marine/ru/camo
	name = "Old camo uniform"
	desc = "This is old man clothes for fishing, now you can die for TerraGov in this very stealth camo."
	icon_state = "camo"
	item_state = "camo"
	adjustment_variants = list(
		"Down" = "_d",
	)

//////////////////
///////SHOES//////
//////////////////

/obj/item/clothing/shoes/marine/ru
	name = "ru boots"
	desc = "ru boots."
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_shoes_str = 'RUtgmc/icons/mob/clothes.dmi')

/obj/item/clothing/shoes/marine/ru/headskin
	name = "Marine veteran combat boots"
	desc = "Usual combat boots. There is nothing unusual about them. Nothing."
	icon_state = "headskin"
	item_state = "headskin"

/obj/item/clothing/shoes/marine/ru/amogus
	name = "Sport AMGS boots"
	desc = "Sus."
	icon_state = "amogus"
	item_state = "amogus"

/obj/item/clothing/shoes/marine/coolcowboy
	name = "Marine cowboy combat boots"
	desc = "Cowboy boots. Now can hold knives!"
	icon_state = "cboots"
	item_state = "cboots"

//////////////////
//////GLASSES/////
//////////////////

/obj/item/clothing/glasses/ru
	name = "ru glasses"
	desc = "ru glasses"
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_glasses_str = 'RUtgmc/icons/mob/clothes.dmi')

/obj/item/clothing/glasses/ru/orange
	name = "Orange glasses"
	desc = "Just orange glasses."
	icon_state = "og"
	item_state = "og"

/obj/item/clothing/glasses/ru/orange/attackby(obj/item/I, mob/user, params)
	. = ..()

	if(istype(I, /obj/item/clothing/glasses/hud/health))
		var/obj/item/clothing/glasses/hud/og/P = new
		to_chat(user, span_notice("You fasten the medical hud projector to the inside of the glasses."))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)
	else if(istype(I, /obj/item/clothing/glasses/night/imager_goggles))
		var/obj/item/clothing/glasses/night/imager_goggles/og/P = new
		to_chat(user, span_notice("You fasten the optical imager scaner to the inside of the glasses."))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)
	else if(istype(I, /obj/item/clothing/glasses/meson))
		var/obj/item/clothing/glasses/meson/og/P = new
		to_chat(user, span_notice("You fasten the optical meson scaner to the inside of the glasses."))
		qdel(I)
		qdel(src)
		user.put_in_hands(P)

		update_icon(user)

/obj/item/clothing/glasses/meson/og
	name = "Orange glasses"
	desc = "Just orange glasses. This pair has been fitted with an optical meson scanner."
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_glasses_str = 'RUtgmc/icons/mob/clothes.dmi')
	icon_state = "mesonog"
	item_state = "mesonog"
	deactive_state = "og"
	prescription = TRUE

/obj/item/clothing/glasses/night/imager_goggles/og
	name = "Orange glasses"
	desc = "Just orange glasses. This pair has been fitted with an internal optical imager scanner."
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_glasses_str = 'RUtgmc/icons/mob/clothes.dmi')
	icon_state = "optog"
	item_state = "optog"
	deactive_state = "og"
	prescription = TRUE

/obj/item/clothing/glasses/hud/og
	name = "Orange glasses"
	desc = "Just orange glasses. This pair has been fitted with an internal HealthMate HUD projector."
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_glasses_str = 'RUtgmc/icons/mob/clothes.dmi')
	icon_state = "medog"
	item_state = "medog"
	deactive_state = "og"
	prescription = TRUE
	toggleable = TRUE
	hud_type = DATA_HUD_MEDICAL_ADVANCED
	actions_types = list(/datum/action/item_action/toggle)

//////////////////
//////STORAGE/////
//////////////////

/obj/item/storage/backpack/marine/scav
	name = "Scav backpack"
	desc = "Pretty swag backpack."
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_back_str = 'RUtgmc/icons/mob/clothes.dmi')
	icon_state = "scavpack"
	item_state = "scavpack"

//////////////////
///////SUIT///////
//////////////////

/obj/item/clothing/suit/ru
	name = "ru suit"
	desc = "ru suit."
	icon = 'RUtgmc/icons/item/clothes.dmi'
	item_icons = list(
		slot_wear_suit_str = 'RUtgmc/icons/mob/clothes.dmi')

/obj/item/clothing/suit/ru/fartumasti
	name = "Military cook apron"
	desc = "Pretty apron. Looks like some emblem teared off from it."
	icon_state = "fartumasti"
	item_state = "fartumasti"
	allowed = list(
		/obj/item/weapon/gun,
		/obj/item/storage/holster/blade,
		/obj/item/weapon/claymore/harvester,
		/obj/item/storage/belt/knifepouch,
		/obj/item/weapon/twohanded,
	)
	flags_armor_protection = CHEST
	soft_armor = list(MELEE = 20, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)
