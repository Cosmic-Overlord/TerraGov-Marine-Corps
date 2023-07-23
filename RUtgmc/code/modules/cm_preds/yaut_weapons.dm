#define FLAY_STAGE_SCALP 1
#define FLAY_STAGE_STRIP 2
#define FLAY_STAGE_SKIN 3

/*#########################################
########### Weapon Reused Procs ###########
#########################################*/
//Onehanded Weapons

/obj/item/weapon/gun/energy/yautja/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/item/weapon/gun/energy/yautja/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/*#########################################
############## Misc Weapons ###############
#########################################*/
/obj/item/weapon/harpoon/yautja
	name = "large harpoon"
	desc = "A huge metal spike with a hook at the end. It's carved with mysterious alien writing."

	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "spike"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)
	item_state = "harpoon"

	attack_verb = list("jabbed","stabbed","ripped", "skewered")
	throw_range = 4
	resistance_flags = UNACIDABLE
	edge = 1
	hitsound = 'sound/weapons/bladeslice.ogg'
	sharp = IS_SHARP_ITEM_BIG

/obj/item/weapon/harpoon/yautja/New()
	. = ..()

	force = 10
	throwforce = 30

/obj/item/weapon/wristblades
	name = "wrist blades"
	var/plural_name = "wrist blades"
	desc = "A pair of huge, serrated blades extending out from metal gauntlets."

	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "wrist"
	item_state = "wristblade"
	item_icons = list(
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)

	w_class = WEIGHT_CLASS_GIGANTIC
	edge = TRUE
	sharp = IS_SHARP_ITEM_ACCURATE
	flags_item = NODROP|ITEM_PREDATOR
	flags_equip_slot = NONE
	hitsound = 'sound/weapons/wristblades_hit.ogg'
	attack_speed = 6
	force = 40
	pry_capable = IS_PRY_CAPABLE_FORCE
	attack_verb = list("sliced", "slashed", "jabbed", "torn", "gored")

	var/has_speed_bonus = TRUE

/obj/item/weapon/wristblades/equipped(mob/user, slot)
	. = ..()
	if(has_speed_bonus && (slot == slot_l_store_str || slot == slot_r_store_str) && istype(user.get_inactive_held_item(), /obj/item/weapon/wristblades))
		attack_speed = initial(attack_speed) - 2

/obj/item/weapon/wristblades/dropped(mob/living/carbon/human/M)
	. = ..()
	attack_speed = initial(attack_speed)

/obj/item/weapon/wristblades/afterattack(atom/attacked_target, mob/user, proximity)
	if(!proximity || !user)
		return FALSE

	if(istype(attacked_target, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/door = attacked_target
		if(!door.density || door.locked)
			return FALSE
		user.visible_message(span_danger("[user] jams their [name] into [door] and strains to rip it open..."), span_danger("You jam your [name] into [door] and strain to rip it open..."))
		playsound(user,'sound/weapons/wristblades_hit.ogg', 15, TRUE)
		if(do_after(user, 3 SECONDS, TRUE, door, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE) && door.density)
			user.visible_message(span_danger("[user] forces [door] open with the [name]!"), span_danger("You force [door] open with the [name]."))
			door.open(TRUE)

	else if(istype(attacked_target, /obj/structure/mineral_door/resin))
		var/obj/structure/mineral_door/resin/door = attacked_target
		if(door.isSwitchingStates || user.a_intent == INTENT_HARM)
			return
		if(door.density)
			user.visible_message(span_danger("[user] jams their [name] into [door] and strains to rip it open..."), span_danger("You jam your [name] into [door] and strain to rip it open..."))
			playsound(user, 'sound/weapons/wristblades_hit.ogg', 15, TRUE)
			if(do_after(user, 1.5 SECONDS, TRUE, door, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE) && door.density)
				user.visible_message(span_danger("[user] forces [door] open using the [name]!"), span_danger("You force [door] open with your [name]."))
				door.Open()
		else
			user.visible_message(span_danger("[user] pushes [door] with their [name] to force it closed..."), span_danger("You push [door] with your [name] to force it closed..."))
			playsound(user, 'sound/weapons/wristblades_hit.ogg', 15, TRUE)
			if(do_after(user, 2 SECONDS, TRUE, door, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE) && !door.density)
				user.visible_message(span_danger("[user] forces [door] closed using the [name]!"), span_danger("You force [door] closed with your [name]."))
				door.Close()

/obj/item/weapon/wristblades/attack_self(mob/living/carbon/human/user)
	..()
	if(istype(user))
		var/obj/item/clothing/gloves/yautja/hunter/gloves = user.gloves
		gloves.wristblades_internal(user, TRUE) // unlikely that the yaut would have gloves without blades, so if they do, runtime logs here would be handy

/obj/item/weapon/wristblades/scimitar
	name = "wrist scimitar"
	plural_name = "wrist scimitars"
	desc = "A huge, serrated blade extending from metal gauntlets."
	icon_state = "scim"
	item_state = "scim"
	attack_speed = 5
	attack_verb = list("sliced", "slashed", "jabbed", "torn", "gored")
	force = 25

/*#########################################
########### One Handed Weapons ############
#########################################*/
/obj/item/weapon/yautja
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	item_icons = list(
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)
	var/human_adapted = FALSE

/obj/item/weapon/yautja/chain
	name = "chainwhip"
	desc = "A segmented, lightweight whip made of durable, acid-resistant metal. Not very common among Yautja Hunters, but still a dangerous weapon capable of shredding prey."
	icon_state = "whip"
	item_state = "whip"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = UNACIDABLE
	force = 30
	throwforce = 25
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	attack_verb = list("whipped", "slashed","sliced","diced","shredded")
	attack_speed = 0.8 SECONDS
	hitsound = 'sound/weapons/chain_whip.ogg'


/obj/item/weapon/yautja/chain/attack(mob/target, mob/living/user)
	. = ..()
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

/obj/item/weapon/yautja/sword
	name = "clan sword"
	desc = "An expertly crafted Yautja blade carried by hunters who wish to fight up close. Razor sharp and capable of cutting flesh into ribbons. Commonly carried by aggressive and lethal hunters."
	icon_state = "clansword"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = SLOT_BACK
	force = 35
	throwforce = 25
	sharp = IS_SHARP_ITEM_ACCURATE
	edge = TRUE
	w_class = WEIGHT_CLASS_HUGE
	hitsound = "clan_sword_hit"
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	attack_speed = 1 SECONDS
	resistance_flags = UNACIDABLE

/obj/item/weapon/yautja/sword/attack(mob/target, mob/living/user)
	. = ..()
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

/obj/item/weapon/yautja/scythe
	name = "dual war scythe"
	desc = "A huge, incredibly sharp dual blade used for hunting dangerous prey. This weapon is commonly carried by Yautja who wish to disable and slice apart their foes."
	icon_state = "predscythe"
	item_state = "scythe_dual"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BELT
	force = 30
	throwforce = 25
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	w_class = WEIGHT_CLASS_HUGE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	resistance_flags = UNACIDABLE

/obj/item/weapon/yautja/scythe/attack(mob/living/target as mob, mob/living/carbon/human/user as mob)
	..()
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 15

	if(prob(15))
		user.visible_message(span_danger("An opening in combat presents itself!"),span_danger("You manage to strike at your foe once more!"))
		user.spin(5, 1)
		..() //Do it again! CRIT! This will be replaced by a bleed effect.

	return

/obj/item/weapon/yautja/scythe/alt
	name = "double war scythe"
	desc = "A huge, incredibly sharp double blade used for hunting dangerous prey. This weapon is commonly carried by Yautja who wish to disable and slice apart their foes."
	icon_state = "predscythe_alt"
	item_state = "scythe_double"

//Combistick
/obj/item/weapon/yautja/combistick
	name = "combi-stick"
	desc = "A compact yet deadly personal weapon. Can be concealed when folded. Functions well as a throwing weapon or defensive tool. A common sight in Yautja packs due to its versatility."
	icon_state = "combistick"
	flags_atom = CONDUCT
	flags_equip_slot = SLOT_BACK
	flags_item = TWOHANDED|ITEM_PREDATOR
	w_class = WEIGHT_CLASS_HUGE
	throw_speed = 10
	throw_range = 4
	resistance_flags = UNACIDABLE
	force = 30
	throwforce = 45
	sharp = IS_SHARP_ITEM_SIMPLE
	edge = TRUE
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("speared", "stabbed", "impaled")

	var/on = 1
	var/charged

	var/force_wielded = 30
	var/force_unwielded = 10
	var/force_storage = 5

/obj/item/weapon/yautja/combistick/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_PRE_THROW, PROC_REF(try_to_throw))

/obj/item/weapon/yautja/combistick/proc/try_to_throw()
	SIGNAL_HANDLER

	var/mob/handler = usr
	if(!istype(handler))
		return

	if(!charged)
		to_chat(handler, span_warning("Your combistick refuses to leave your hand. You must charge it with blood from prey before throwing it."))
		unwield(handler)
		handler.put_in_hands(src)
		wield(handler)
		return COMPONENT_MOVABLE_BLOCK_PRE_THROW

	charged = FALSE
	remove_filter("combistick_charge")
	unwield(handler) //Otherwise stays wielded even when thrown

/obj/item/weapon/yautja/combistick/verb/use_unique_action()
	set category = "Weapons"
	set name = "Unique Action"
	set desc = "Activate or deactivate the combistick."
	set src in usr
	unique_action(usr)

/obj/item/weapon/yautja/combistick/attack_self(mob/user)
	..()
	if(on)
		if(flags_item & WIELDED)
			unwield(user)
		else
			wield(user)
	else
		to_chat(user, span_warning("You need to extend the combi-stick before you can wield it."))


/obj/item/weapon/yautja/combistick/wield(mob/user)
	. = ..()
	if(!.)
		return
	force = force_wielded
	update_icon()

/obj/item/weapon/yautja/combistick/unwield(mob/user)
	. = ..()
	if(!.)
		return
	force = force_unwielded
	update_icon()

/obj/item/weapon/yautja/combistick/update_icon()
	if(flags_item & WIELDED)
		item_state = "combistick_w"
	else if(!on)
		item_state = "combistick_f"
	else
		item_state = "combistick"

/obj/item/weapon/yautja/combistick/unique_action(mob/living/user)
	if(user.get_active_held_item() != src)
		return
	if(!on)
		user.visible_message(span_info("With a flick of their wrist, [user] extends [src]."),\
		span_notice("You extend [src]."),\
		"You hear blades extending.")
		playsound(src,'sound/items/combistick_open.ogg', 50, TRUE, 3)
		icon_state = initial(icon_state)
		flags_equip_slot = initial(flags_equip_slot)
		flags_item |= TWOHANDED
		w_class = WEIGHT_CLASS_HUGE
		force = force_unwielded
		throwforce = 30
		attack_verb = list("speared", "stabbed", "impaled")

		if(blood_overlay && blood_color)
			overlays.Cut()
			add_blood(blood_color)
		on = TRUE
		update_icon()
	else
		unwield(user)
		to_chat(user, span_notice("You collapse [src] for storage."))
		playsound(src, 'sound/items/combistick_close.ogg', 50, TRUE, 3)
		icon_state = initial(icon_state) + "_f"
		flags_equip_slot = ITEM_SLOT_BACK
		flags_item &= ~TWOHANDED
		w_class = WEIGHT_CLASS_TINY
		force = force_storage
		throwforce = 30
		attack_verb = list("thwacked", "smacked")
		overlays.Cut()
		on = FALSE
		update_icon()

	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_l_hand()
		H.update_inv_r_hand()

	add_fingerprint(user)

	return

/obj/item/weapon/yautja/combistick/attack(mob/living/target, mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

	if(target == user || target.stat == DEAD)
		to_chat(user, span_danger("You think you're smart?")) //very funny
		return
	if(isanimal(target))
		return

	if(!charged)
		to_chat(user, span_danger("Your combistick's reservoir fills up with your opponent's blood! You may now throw it!"))
		charged = TRUE
		var/color = target.get_blood_color()
		var/alpha = 70
		color += num2text(alpha, 2, 16)
		add_filter("combistick_charge", 1, list("type" = "outline", "color" = color, "size" = 2))

/obj/item/weapon/yautja/combistick/attack_hand(mob/user) //Prevents marines from instantly picking it up via pickup macros.
	if(!human_adapted && !HAS_TRAIT(user, TRAIT_SUPER_STRONG))
		user.visible_message(span_danger("[user] starts to untangle the chain on \the [src]..."), span_notice("You start to untangle the chain on \the [src]..."))
		if(do_after(user, 3 SECONDS, TRUE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE, PROGRESS_BRASS))
			..()
	else ..()

/obj/item/weapon/yautja/combistick/throw_impact(atom/hit_atom)
	if(isyautja(hit_atom))
		var/mob/living/carbon/human/human = hit_atom
		if(human.put_in_hands(src))
			hit_atom.visible_message(span_notice(" [hit_atom] expertly catches [src] out of the air. "), \
				span_notice(" You easily catch [src]. "))
			return
	..()

/obj/item/weapon/yautja/knife
	name = "ceremonial dagger"
	desc = "A viciously sharp dagger inscribed with ancient Yautja markings. Smells thickly of blood. Carried by some hunters."
	icon_state = "predknife"
	item_state = "knife"
	flags_atom = CONDUCT
	flags_item = ITEM_PREDATOR
	flags_equip_slot = ITEM_SLOT_BACK
	sharp = IS_SHARP_ITEM_ACCURATE
	force = 25
	w_class = WEIGHT_CLASS_TINY
	throwforce = 20
	throw_speed = 10
	throw_range = 6
	hitsound = 'sound/weapons/slash.ogg'
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	resistance_flags = UNACIDABLE

/obj/item/weapon/yautja/knife/attack(mob/living/target, mob/living/carbon/human/user)
	if(target.stat != DEAD)
		return ..()

	if(!ishuman(target))
		to_chat(user, span_warning("You can only use this dagger to flay humanoids!"))
		return

	var/mob/living/carbon/human/victim = target

	if(!HAS_TRAIT(user, TRAIT_SUPER_STRONG))
		to_chat(user, span_warning("You're not strong enough to rip an entire humanoid apart. Also, that's kind of fucked up.")) //look at this dumbass
		return TRUE

	if(user.species.name == victim.species.name)
		to_chat(user, span_highdanger("ARE YOU OUT OF YOUR MIND!?"))
		return

	if(issynth(victim) || isrobot(victim) || victim.species.species_flags & ROBOTIC_LIMBS)
		to_chat(user, span_warning("You can't flay metal...")) //look at this dumbass
		return

	if(SEND_SIGNAL(victim, COMSIG_HUMAN_FLAY_ATTEMPT, user, src) & COMPONENT_CANCEL_ATTACK)
		return TRUE

	if(victim.overlays_standing[FLAY_LAYER]) //Already fully flayed. Possibly the user wants to cut them down?
		return ..()

	if(!do_after(user, 1 SECONDS, FALSE, victim, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		return TRUE

	user.visible_message(span_danger("<B>[user] begins to flay [victim] with \a [src]...</B>"),
		span_danger("<B>You start flaying [victim] with your [src.name]...</B>"))
	playsound(loc, 'sound/weapons/pierce.ogg', 25)
	if(do_after(user, 4 SECONDS, FALSE, victim, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		if(SEND_SIGNAL(victim, COMSIG_HUMAN_FLAY_ATTEMPT, user, src) & COMPONENT_CANCEL_ATTACK) //In case two preds try to flay the same person at once.
			return TRUE
		user.visible_message(span_danger("<B>[user] makes a series of cuts in [victim]'s skin.</B>"),
			span_danger("<B>You prepare the skin, cutting the flesh off in vital places.</B>"))
		playsound(loc, 'sound/weapons/slash.ogg', 25)

		for(var/limb in victim.limbs)
			victim.apply_damage(15, BRUTE, limb, sharp = FALSE)
		victim.add_flay_overlay(stage = 1)

		var/datum/flaying_datum/flay_datum = new(victim)
		flay_datum.create_leftovers(victim, TRUE, 0)
		SEND_SIGNAL(victim, COMSIG_HUMAN_FLAY_ATTEMPT, user, src, TRUE)
	else
		to_chat(user, span_warning("You were interrupted before you could finish your work!"))
	return TRUE

///Records status of flaying attempts and handles progress.
/datum/flaying_datum
	var/mob/living/carbon/human/victim
	var/current_flayer
	var/flaying_stage = FLAY_STAGE_SCALP

/datum/flaying_datum/New(mob/living/carbon/human/target)
	. = ..()
	victim = target
	RegisterSignal(victim, COMSIG_HUMAN_FLAY_ATTEMPT, PROC_REF(begin_flaying))

///Loops until interrupted or done.
/datum/flaying_datum/proc/begin_flaying(mob/living/carbon/human/target, mob/living/carbon/human/user, obj/item/tool, ongoing_attempt)
	SIGNAL_HANDLER
	if(current_flayer)
		if(current_flayer != user)
			to_chat(user, span_warning("You can't flay [target], [current_flayer] is already at work!"))
	else
		current_flayer = user
		if(!ongoing_attempt)
			playsound(user.loc, 'sound/weapons/pierce.ogg', 25)
			user.visible_message(span_danger("<B>[user] resumes the flaying of [victim] with \a [tool]...</B>"),
				span_danger("<B>You resume the flaying of [victim] with your [tool.name]...</B>"))
		INVOKE_ASYNC(src, PROC_REF(flay), target, user, tool) //do_after sleeps.
	return COMPONENT_CANCEL_ATTACK

/datum/flaying_datum/proc/flay(mob/living/carbon/human/target, mob/living/carbon/human/user, obj/item/tool)
	if(!do_after(user, 4 SECONDS, TRUE, victim, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		to_chat(user, span_warning("You were interrupted before you could finish your work!"))
		current_flayer = null
		return

	switch(flaying_stage)
		if(FLAY_STAGE_SCALP)
			playsound(user.loc, 'sound/weapons/slashmiss.ogg', 25)
			flaying_stage = FLAY_STAGE_STRIP
			var/datum/limb/head/v_head = victim.get_limb("head")
			if(!v_head || (v_head.limb_status & LIMB_DESTROYED)) //they might be beheaded
				victim.apply_damage(10, BRUTE, "chest", sharp = TRUE)
				user.visible_message(span_danger("<B>[user] peels the skin around the stump of [victim]'s head loose with \the [tool].</B>"),
					span_danger("<B>[victim] is missing \his head. Pelts like this just aren't the same... You peel the skin around the stump loose with your [tool.name].</B>"))
			else
				victim.apply_damage(10, BRUTE, v_head, sharp = TRUE)
				v_head.disfigured = TRUE
				create_leftovers(victim, has_meat = FALSE, skin_amount = 1)
				if(victim.h_style == "Bald") //you can't scalp someone with no hair.
					user.visible_message(span_danger("<B>[user] makes some rough cuts on [victim]'s head and face with \a [tool].</B>"),
						span_danger("<B>You make some rough cuts on [victim]'s head and face.</B>"))
				else
					user.visible_message(span_danger("<B>[user] cuts around [victim]'s hairline, then tears \his scalp from \his head!</B>"),
						span_danger("<B>You cut around [victim]'s hairline, then rip \his scalp from \his head.</B>"))
					var/obj/item/scalp/cut_scalp = new(get_turf(user), victim, user) //Create a scalp of the victim at the user's feet.
					user.put_in_inactive_hand(cut_scalp) //Put it in the user's offhand if possible.
					victim.h_style = "Bald"
					victim.update_hair() //tear the hair off with the scalp

		if(FLAY_STAGE_STRIP)
			user.visible_message(span_danger("<B>[user] jabs \his [tool.name] into [victim]'s cuts, prying, cutting, then tearing off large areas of skin. The remainder hangs loosely.</B>"),
				span_danger("<B>You jab your [tool.name] into [victim]'s cuts, prying, cutting, then tearing off large areas of skin. The remainder hangs loosely.</B>"))
			playsound(user.loc, 'sound/weapons/bladeslice.ogg', 25)
			create_leftovers(victim, has_meat = FALSE, skin_amount = 3)
			flaying_stage = FLAY_STAGE_SKIN
			for(var/limb in victim.limbs)
				victim.apply_damage(18, BRUTE, limb, sharp = TRUE)
			victim.remove_overlay(UNIFORM_LAYER)
			victim.dropItemToGround(victim.get_item_by_slot(SLOT_W_UNIFORM)) //Drop uniform, belt etc as well.
			victim.f_style = "Shaved"
			victim.update_hair() //then rip the beard off along the skin
			victim.add_flay_overlay(stage = 2)

		if(FLAY_STAGE_SKIN)
			user.visible_message(span_danger("<B>[user] completely flays [victim], pulling the remaining skin off of \his body like a glove!</B>"),
				span_danger("<B>You completely flay [victim], pulling the remaining skin off of \his body like a glove.\nUse rope to hang \him from the ceiling.</B>"))
			playsound(user.loc, 'sound/weapons/wristblades_hit.ogg', 25)
			create_leftovers(victim, has_meat = TRUE, skin_amount = 2)
			for(var/limb in victim.limbs)
				victim.apply_damage(22, BRUTE, limb, sharp = TRUE)
			for(var/obj/item/item in victim)
				victim.transferItemToLoc(item, victim.loc, FALSE, TRUE)
				ADD_TRAIT(victim, TRAIT_UNDEFIBBABLE, TRAIT_UNDEFIBBABLE)
			victim.add_flay_overlay(stage = 3)

			//End the loop and remove all references to the datum.
			current_flayer = null
			UnregisterSignal(victim, COMSIG_HUMAN_FLAY_ATTEMPT)
			victim = null
			return

	flay(target, user, tool)

/mob/living/carbon/human/proc/add_flay_overlay(stage = 1)
	remove_overlay(FLAY_LAYER)
	var/image/flay_icon = new /image('icons/mob/hunter/dam_human.dmi', "human_[stage]")
	flay_icon.layer = -FLAY_LAYER
	flay_icon.blend_mode = BLEND_INSET_OVERLAY
	overlays_standing[FLAY_LAYER] = flay_icon
	apply_overlay(FLAY_LAYER)

/datum/flaying_datum/proc/create_leftovers(mob/living/victim, has_meat, skin_amount)
	if(has_meat)
		var/obj/item/reagent_containers/food/snacks/meat/meat = new /obj/item/reagent_containers/food/snacks/meat(victim.loc)
		meat.name = "raw [victim.name] steak"

	if(skin_amount)
		var/obj/item/stack/sheet/animalhide/human/hide = new /obj/item/stack/sheet/animalhide/human(victim.loc)
		hide.name = "[victim.name]-hide"
		hide.singular_name = "[victim.name]-hide"
		hide.stack_name = "[victim.name]-hide"
		hide.amount = skin_amount

/obj/item/weapon/yautja/knife/afterattack(obj/attacked_obj, mob/living/user, proximity)
	if(!proximity)
		return

	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		return

	if(!istype(attacked_obj, /obj/item/limb))
		return
	var/obj/item/limb/current_limb = attacked_obj

	if(current_limb.flayed)
		to_chat(user, span_notice("This limb has already been flayed."))
		return

	playsound(loc, 'sound/weapons/pierce.ogg', 25)
	to_chat(user, span_warning("You start flaying the skin from [current_limb]."))
	if(!do_after(user, 2 SECONDS, FALSE, current_limb, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		to_chat(user, span_notice("You decide not to flay [current_limb]."))
		return
	to_chat(user, span_warning("You finish flaying [current_limb]."))
	current_limb.flayed = TRUE

/*#########################################
########### Two Handed Weapons ############
#########################################*/
/obj/item/weapon/twohanded/yautja
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	item_icons = list(
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)

	flags_item = TWOHANDED|ITEM_PREDATOR
	resistance_flags = UNACIDABLE
	flags_equip_slot = SLOT_BACK
	w_class = WEIGHT_CLASS_HUGE
	throw_speed = 10
	edge = TRUE
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/human_adapted = FALSE

/obj/item/weapon/twohanded/yautja/spear
	name = "hunter spear"
	desc = "A spear of exquisite design, used by an ancient civilisation."
	icon_state = "spearhunter"
	item_state = "spearhunter"
	flags_item = TWOHANDED
	force = 15
	force_wielded = 35
	sharp = IS_SHARP_ITEM_SIMPLE
	attack_verb = list("attacked", "stabbed", "jabbed", "torn", "gored")

/obj/item/weapon/twohanded/yautja/glaive
	name = "war glaive"
	desc = "A huge, powerful blade on a metallic pole. Mysterious writing is carved into the weapon."
	icon_state = "glaive"
	item_state = "glaive"
	force = 15
	force_wielded = 45
	throwforce = 15
	sharp = IS_SHARP_ITEM_BIG
	flags_atom = CONDUCT
	attack_verb = list("sliced", "slashed", "carved", "diced", "gored")
	attack_speed = 14 //Default is 7.

/obj/item/weapon/twohanded/yautja/glaive/attack(mob/living/target, mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return
	if((human_adapted || isyautja(user)) && isxeno(target))
		var/mob/living/carbon/xenomorph/xenomorph = target
		xenomorph.interference = 30

/obj/item/weapon/twohanded/yautja/glaive/alt
	icon_state = "glaive_alt"
	item_state = "glaive_alt"

/obj/item/weapon/twohanded/yautja/glaive/damaged
	name = "ancient war glaive"
	desc = "A huge, powerful blade on a metallic pole. Mysterious writing is carved into the weapon. This one is ancient and has suffered serious acid damage, making it near-useless."
	force = 10
	force_wielded = 25
	throwforce = 10
	icon_state = "glaive_alt"
	item_state = "glaive_alt"
	flags_item = TWOHANDED


/*#########################################
############## Ranged Weapons #############
#########################################*/

/obj/item/weapon/gun/energy/yautja
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = null
	item_icons = list(
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)
	default_ammo_type = null

	flags_gun_features = GUN_AMMO_COUNTER|GUN_NO_PITCH_SHIFT_NEAR_EMPTY|GUN_ENERGY|GUN_AMMO_COUNT_BY_PERCENTAGE

/obj/item/weapon/gun/energy/yautja/Initialize(mapload, spawn_empty)
	. = ..()
	verbs -= /obj/item/weapon/gun/verb/toggle_burstfire
	verbs -= /obj/item/weapon/gun/verb/empty_mag
	verbs -= /obj/item/weapon/gun/verb/use_unique_action

/obj/item/weapon/gun/energy/yautja/update_icon_state()
	return

/obj/item/weapon/gun/energy/yautja/update_ammo_count()
	gun_user?.hud_used.update_ammo_hud(src, get_ammo_list(), get_display_ammo_count())

/obj/item/weapon/gun/energy/yautja/unload(mob/living/user, drop = TRUE, after_fire = FALSE)
	return

//Spike launcher
/obj/item/weapon/gun/energy/yautja/spike
	name = "spike launcher"
	desc = "A compact Yautja device in the shape of a crescent. It can rapidly fire damaging spikes and automatically recharges."

	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "spikelauncher"
	item_state = "spikelauncher"
	item_icons = list(
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)

	muzzle_flash = "muzzle_flash_laser"
	muzzle_flash_color = COLOR_MAGENTA

	resistance_flags = UNACIDABLE
	fire_sound = 'sound/effects/woodhit.ogg' // TODO: Decent THWOK noise.
	ammo_datum_type = /datum/ammo/alloy_spike
	flags_equip_slot = ITEM_SLOT_BELT|ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY //Fits in yautja bags.
	rounds = 12
	max_rounds = 12
	var/last_regen
	flags_gun_features = GUN_UNUSUAL_DESIGN
	flags_item = ITEM_PREDATOR|TWOHANDED

	fire_delay = 5
	accuracy_mult = 1.25
	accuracy_mult_unwielded = 1
	scatter = 1
	scatter_unwielded = 2
	damage_mult = 1

/obj/item/weapon/gun/energy/yautja/spike/Initialize(mapload, spawn_empty)
	. = ..()
	START_PROCESSING(SSobj, src)
	last_regen = world.time
	update_icon()

/obj/item/weapon/gun/energy/yautja/spike/process()
	if(rounds < max_rounds && world.time > last_regen + 100 && prob(70))
		rounds++
		last_regen = world.time
		update_icon()

/obj/item/weapon/gun/energy/yautja/spike/examine(mob/user)
	if(isyautja(user))
		. = ..()
		. += span_notice("It currently has <b>[rounds]/[max_rounds]</b> spikes.")
	else
		. = list()
		. += span_notice("Looks like some kind of...mechanical donut.")

/obj/item/weapon/gun/energy/yautja/spike/update_icon()
	..()
	var/new_icon_state = rounds <= 1 ? null : icon_state + "[round(rounds / (max_rounds / 3), 1)]"
	update_special_overlay(new_icon_state)

/obj/item/weapon/gun/energy/yautja/spike/able_to_fire(mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return

	return ..()

/obj/item/weapon/gun/energy/yautja/spike/cycle()
	if(rounds > 0)
		in_chamber = get_ammo_object()
		rounds--
		return in_chamber

/obj/item/weapon/gun/energy/yautja/plasmarifle
	name = "plasma rifle"
	desc = "A long-barreled heavy plasma weapon capable of taking down large game. It has a mounted scope for distant shots and an integrated battery."
	icon_state = "plasmarifle"
	item_state = "plasmarifle"
	resistance_flags = UNACIDABLE
	fire_sound = 'sound/weapons/pred_plasma_shot.ogg'
	ammo_datum_type = /datum/ammo/energy/yautja/rifle/bolt
	muzzle_flash = "muzzle_flash_laser"
	muzzle_flash_color = COLOR_MAGENTA
	zoomdevicename = "scope"
	flags_equip_slot = SLOT_BACK
	w_class = WEIGHT_CLASS_GIGANTIC
	rounds = 100
	max_rounds = 100
	charge_cost = 10
	var/last_regen = 0
	flags_gun_features = GUN_UNUSUAL_DESIGN
	flags_item = ITEM_PREDATOR|TWOHANDED

	fire_delay = 10
	accuracy_mult = 1.5
	accuracy_mult_unwielded = 1.5
	scatter = 2
	scatter_unwielded = 4
	damage_mult = 1

/obj/item/weapon/gun/energy/yautja/plasmarifle/Initialize(mapload, spawn_empty)
	. = ..()
	START_PROCESSING(SSobj, src)
	last_regen = world.time
	update_icon()

/obj/item/weapon/gun/energy/yautja/plasmarifle/process()
	if(rounds < max_rounds)
		rounds++
		if(rounds == max_rounds)
			if(ismob(loc)) to_chat(loc, span_notice("[src] hums as it achieves maximum charge."))
		update_icon()

/obj/item/weapon/gun/energy/yautja/plasmarifle/examine(mob/user)
	if(isyautja(user))
		. = ..()
		. += span_notice("It currently has <b>[rounds]/[max_rounds]</b> charge.")
	else
		. = list()
		. += span_notice("This thing looks like an alien rifle of some kind. Strange.")

/obj/item/weapon/gun/energy/yautja/plasmarifle/update_icon()
	if(last_regen < rounds + max_rounds / 5 || last_regen > rounds || rounds > max_rounds / 1.05)
		var/new_icon_state = rounds <= 15 ? null : icon_state + "[round(rounds/(max_rounds / 3), 1)]"
		update_special_overlay(new_icon_state)
		last_regen = rounds

/obj/item/weapon/gun/energy/yautja/plasmarifle/able_to_fire(mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return

	return ..()

/obj/item/weapon/gun/energy/yautja/plasmarifle/cycle()
	if(rounds < charge_cost)
		return

	if(rounds >= charge_cost * 8)
		ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/rifle/blast]
		rounds -= charge_cost * 8
	else
		ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/rifle/bolt]
		rounds -= charge_cost
	var/obj/projectile/proj = get_ammo_object()
	in_chamber = proj
	return in_chamber

/obj/item/weapon/gun/energy/yautja/plasmapistol
	name = "plasma pistol"
	desc = "A plasma pistol capable of rapid fire. It has an integrated battery. Can be used to set fires, either to braziers or on people."
	icon_state = "plasmapistol"
	item_state = "plasmapistol"

	resistance_flags = UNACIDABLE
	fire_sound = 'sound/weapons/pulse3.ogg'
	flags_equip_slot = ITEM_SLOT_BELT
	ammo_datum_type = /datum/ammo/energy/yautja/pistol
	muzzle_flash = "muzzle_flash_laser"
	muzzle_flash_color = COLOR_MAGENTA
	w_class = WEIGHT_CLASS_BULKY
	rounds = 40
	max_rounds = 40
	charge_cost = 1
	flags_gun_features = GUN_UNUSUAL_DESIGN
	flags_item = ITEM_PREDATOR|TWOHANDED

	fire_delay = 4
	accuracy_mult = 1.5
	accuracy_mult_unwielded = 1.35
	scatter = 1
	scatter_unwielded = 3
	damage_mult = 1


/obj/item/weapon/gun/energy/yautja/plasmapistol/Initialize(mapload, spawn_empty)
	. = ..()
	START_PROCESSING(SSobj, src)
	verbs -= /obj/item/weapon/gun/verb/toggle_burstfire
	verbs -= /obj/item/weapon/gun/verb/empty_mag



/obj/item/weapon/gun/energy/yautja/plasmapistol/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)


/obj/item/weapon/gun/energy/yautja/plasmapistol/process()
	if(rounds < max_rounds)
		rounds += 0.25
		if(rounds == max_rounds)
			if(ismob(loc)) to_chat(loc, span_notice("[src] hums as it achieves maximum charge."))


/obj/item/weapon/gun/energy/yautja/plasmapistol/examine(mob/user)
	if(isyautja(user))
		. = ..()
		. += span_notice("It currently has <b>[rounds]/[max_rounds]</b> charge.")
	else
		. = list()
		. += span_notice("This thing looks like an alien rifle of some kind. Strange.")


/obj/item/weapon/gun/energy/yautja/plasmapistol/able_to_fire(mob/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return
	else
		return ..()

/obj/item/weapon/gun/energy/yautja/plasmapistol/cycle()
	if(rounds < charge_cost)
		return
	var/obj/projectile/proj = get_ammo_object()
	in_chamber = proj
	rounds -= charge_cost
	return in_chamber

/obj/item/weapon/gun/energy/yautja/plasma_caster
	name = "plasma caster"
	desc = "A powerful, shoulder-mounted energy weapon."
	icon_state = "plasma_ebony"
	var/initial_icon_state = "plasma"
	var/base_item_state = "plasma_wear"
	item_icons = list(
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_s_store_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)
	item_state_slots = list(
		slot_back_str = "plasma_wear_off",
		slot_s_store_str = "plasma_wear_off"
	)
	fire_sound = 'sound/weapons/pred_plasmacaster_fire.ogg'
	ammo_datum_type = /datum/ammo/energy/yautja/caster/stun
	muzzle_flash = "muzzle_flash_laser"
	muzzle_flash_color = COLOR_VIOLET
	w_class = WEIGHT_CLASS_GIGANTIC
	force = 0
	fire_delay = 3
	flags_atom = CONDUCT
	flags_item = NOBLUDGEON|DELONDROP //Can't bludgeon with this.
	flags_gun_features = GUN_UNUSUAL_DESIGN

	fire_delay = 5
	accuracy_mult = 1
	accuracy_mult_unwielded = 6
	scatter = 2
	scatter_unwielded = 4
	damage_mult = 1

	var/obj/item/clothing/gloves/yautja/hunter/source = null
	charge_cost = 100 //How much energy is needed to fire.
	var/mode = "stun"//fire mode (stun/lethal)
	var/strength = "low power stun bolts"//what it's shooting

	var/mob/living/carbon/laser_target = null
	var/image/LT = null

/obj/item/weapon/gun/energy/yautja/plasma_caster/Initialize(mapload, spawn_empty, caster_material = "ebony")
	icon_state = "[initial_icon_state]_[caster_material]"
	item_state = "[initial_icon_state]_[caster_material]"
	item_state_slots[slot_back_str] = "[base_item_state]_off_[caster_material]"
	item_state_slots[slot_s_store_str] = "[base_item_state]_off_[caster_material]"
	. = ..()
	source = loc
	verbs -= /obj/item/weapon/gun/verb/toggle_burstfire
	verbs -= /obj/item/weapon/gun/verb/empty_mag
	RegisterSignal(src, COMSIG_ITEM_MIDDLECLICKON, PROC_REF(target_action))

	LT = image("icon" = 'icons/obj/items/projectiles.dmi', "icon_state" = "sniper_laser", "layer" =- PRED_LASER_LAYER)

/obj/item/weapon/gun/energy/yautja/plasma_caster/Destroy()
	. = ..()
	source = null

/obj/item/weapon/gun/energy/yautja/plasma_caster/attack_self(mob/living/user)
	..()

	switch(mode)
		if("stun")
			switch(strength)
				if("low power stun bolts")
					strength = "high power stun bolts"
					charge_cost = 100
					fire_delay = 5 * 3
					fire_sound = 'sound/weapons/pred_lasercannon.ogg'
					to_chat(user, span_notice("[src] will now fire [strength]."))
					ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/bolt/stun]
				if("high power stun bolts")
					strength = "plasma immobilizers"
					charge_cost = 300
					fire_delay = 5 * 20
					fire_sound = 'sound/weapons/pulse.ogg'
					to_chat(user, span_notice("[src] will now fire [strength]."))
					ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/sphere/stun]
				if("plasma immobilizers")
					strength = "low power stun bolts"
					charge_cost = 30
					fire_delay = 5
					fire_sound = 'sound/weapons/pred_plasmacaster_fire.ogg'
					to_chat(user, span_notice("[src] will now fire [strength]."))
					ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/stun]
		if("lethal")
			switch(strength)
				if("plasma bolts")
					strength = "plasma spheres"
					charge_cost = 1200
					fire_delay = 5 * 20
					fire_sound = 'sound/weapons/pulse.ogg'
					to_chat(user, span_notice("[src] will now fire [strength]."))
					ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/sphere]
				if("plasma spheres")
					strength = "plasma bolts"
					charge_cost = 100
					fire_delay = 5 * 3
					fire_sound = 'sound/weapons/pred_lasercannon.ogg'
					to_chat(user, span_notice("[src] will now fire [strength]."))
					ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/bolt]

/obj/item/weapon/gun/energy/yautja/plasma_caster/unique_action()
	switch(mode)
		if("stun")
			mode = "lethal"
			to_chat(usr, span_yautjabold("[src.source] beeps: [src] is now set to [mode] mode"))
			strength = "plasma bolts"
			charge_cost = 100
			fire_delay = 5 * 3
			fire_sound = 'sound/weapons/pred_lasercannon.ogg'
			to_chat(usr, span_notice("[src] will now fire [strength]."))
			ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/bolt]

		if("lethal")
			mode = "stun"
			to_chat(usr, span_yautjabold("[src.source] beeps: [src] is now set to [mode] mode"))
			strength = "low power stun bolts"
			charge_cost = 30
			fire_delay = 5
			fire_sound = 'sound/weapons/pred_plasmacaster_fire.ogg'
			to_chat(usr, span_notice("[src] will now fire [strength]."))
			ammo_datum_type = GLOB.ammo_list[/datum/ammo/energy/yautja/caster/stun]

/obj/item/weapon/gun/energy/yautja/plasma_caster/examine(mob/user)
	. = ..()
	var/msg = "It is set to fire [strength]."
	if(mode == "lethal")
		. += span_red(msg)
	else
		. += span_orange(msg)

/obj/item/weapon/gun/energy/yautja/plasma_caster/dropped(mob/living/carbon/human/M)
	playsound(M, 'sound/weapons/pred_plasmacaster_off.ogg', 15, 1)
	to_chat(M, span_notice("You deactivate your plasma caster."))
	if(source)
		forceMove(source)
		source.caster_deployed = FALSE
		return
	..()

/obj/item/weapon/gun/energy/yautja/plasma_caster/able_to_fire(mob/user)
	if(!source)
		return
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_warning("You have no idea how this thing works!"))
		return
	return ..()

/obj/item/weapon/gun/energy/yautja/plasma_caster/cycle(mob/user)
	if(source.drain_power(user, charge_cost))
		in_chamber = get_ammo_object()
		return in_chamber

/atom/proc/apply_pred_laser()
	return FALSE

/mob/living/carbon/human/apply_pred_laser()
	overlays_standing[PRED_LASER_LAYER] = image("icon" = 'icons/obj/items/projectiles.dmi',"icon_state" = "sniper_laser", "layer" =- PRED_LASER_LAYER)
	apply_overlay(PRED_LASER_LAYER)
	return TRUE

/mob/living/carbon/xenomorph/apply_pred_laser()
	overlays_standing[X_PRED_LASER_LAYER] = image("icon" = 'icons/obj/items/projectiles.dmi',"icon_state" = "sniper_laser", "layer" =- X_PRED_LASER_LAYER)
	apply_overlay(X_PRED_LASER_LAYER)
	return TRUE

/mob/living/carbon/proc/remove_pred_laser()
	return FALSE

/mob/living/carbon/human/remove_pred_laser()
	remove_overlay(PRED_LASER_LAYER)
	return TRUE

/mob/living/carbon/xenomorph/remove_pred_laser()
	remove_overlay(X_PRED_LASER_LAYER)
	return TRUE

/obj/item/weapon/gun/energy/yautja/plasma_caster/dropped()
	laser_off()
	. = ..()

/obj/item/weapon/gun/energy/yautja/plasma_caster/process()
	var/mob/living/user = loc
	if(!istype(user))
		laser_off()
		return
	if(!laser_target)
		laser_off(user)
		playsound(user,'sound/machines/click.ogg', 25, 1)
		return
	if(!line_of_sight(user, laser_target, 24))
		laser_off()
		to_chat(user, span_danger("You lose sight of your target!"))
		playsound(user,'sound/machines/click.ogg', 25, 1)

/obj/item/weapon/gun/energy/yautja/plasma_caster/do_fire(obj/object_to_fire)
	if(!QDELETED(laser_target))
		target = laser_target
	return ..()

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/target_action(datum/source, atom/A)
	if(!istype(A, /mob/living/carbon))
		deactivate_laser_target()
	else if(A == laser_target)
		deactivate_laser_target()
	else
		activate_laser_target(A, usr)

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/activate_laser_target(atom/target, mob/living/user)
	target.apply_pred_laser()
	laser_target = target
	to_chat(user, span_danger("You focus your target marker on [target]!"))
	RegisterSignal(src, COMSIG_PROJ_SCANTURF, PROC_REF(scan_turf_for_target))
	START_PROCESSING(SSobj, src)
	accuracy_mult += 0.50 //We get a big accuracy bonus vs the lasered target

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/scan_turf_for_target(datum/source, turf/target_turf)
	SIGNAL_HANDLER
	if(QDELETED(laser_target) || !isturf(laser_target.loc))
		return NONE
	if(get_turf(laser_target) == target_turf)
		return COMPONENT_PROJ_SCANTURF_TARGETFOUND
	return COMPONENT_PROJ_SCANTURF_TURFCLEAR

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/deactivate_laser_target()
	UnregisterSignal(src, COMSIG_PROJ_SCANTURF)
	laser_target.remove_pred_laser()
	laser_target = null

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/laser_on(mob/user)
	RegisterSignal(src, COMSIG_ITEM_UNEQUIPPED, PROC_REF(laser_off))
	if(user?.client)
		user.client.click_intercept = src
		to_chat(user, span_notice("<b>You activate your target marker and take careful aim.</b>"))
		playsound(user,'sound/machines/click.ogg', 25, 1)
	return TRUE

/obj/item/weapon/gun/energy/yautja/plasma_caster/proc/laser_off(datum/source, mob/user)
	SIGNAL_HANDLER
	if(laser_target)
		deactivate_laser_target()
		accuracy_mult -= 0.50 //We lose a big accuracy bonus vs the now unlasered target
		STOP_PROCESSING(SSobj, src)
	if(user)
		UnregisterSignal(src, COMSIG_ITEM_UNEQUIPPED)
	if(user?.client)
		user.client.click_intercept = null
		to_chat(user, span_notice("<b>You deactivate your target marker.</b>"))
		playsound(user,'sound/machines/click.ogg', 25, 1)
	return TRUE


#undef FLAY_STAGE_SCALP
#undef FLAY_STAGE_STRIP
#undef FLAY_STAGE_SKIN
