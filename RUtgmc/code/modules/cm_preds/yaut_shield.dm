/obj/item/weapon/shield/riot/yautja
	name = "clan shield"
	desc = "A large tribal shield made of a strange metal alloy. The face of the shield bears three skulls, two human, one alien."
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "shield"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi',
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi'
	)
	item_state = "shield"
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BACK

	max_integrity = 400
	integrity_failure = 0

	var/last_attack = 0
	var/cooldown_time = 25 SECONDS

/obj/item/weapon/shield/riot/yautja/attack(mob/living/M, mob/living/user)
	. = ..()
	if(. && (world.time > last_attack + cooldown_time))
		last_attack = world.time
		M.throw_at(get_step(M, user.dir), 1, 5, user, FALSE)
		M.apply_effect(3, EYE_BLUR)
		M.apply_effect(5, WEAKEN)

/obj/item/weapon/shield/riot/yautja/attackby(obj/item/I, mob/user)
	if(cooldown < world.time - 25)
		if(istype(I, /obj/item/weapon) && (I.flags_item & ITEM_PREDATOR))
			user.visible_message(span_warning("[user] bashes \the [src] with \the [I]!"))
			playsound(user.loc, 'sound/effects/shieldbash.ogg', 25, 1)
			cooldown = world.time
	else
		..()
