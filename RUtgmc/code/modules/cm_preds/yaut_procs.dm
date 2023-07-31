// Notify all preds with the bracer icon
/proc/message_all_yautja(msg, soundeffect = TRUE)
	for(var/mob/living/carbon/human/Y in GLOB.yautja_mob_list)
		// Send message to the bracer; appear multiple times if we have more bracers
		for(var/obj/item/clothing/gloves/yautja/hunter/G in Y.contents)
			to_chat(Y, span_yautjabold("[icon2html(G)] \The <b>[G]</b> beeps: [msg]"))
			if(G.notification_sound)
				playsound(Y.loc, 'sound/items/pred_bracer.ogg', 75, 1)

/mob/living/carbon/human/proc/message_thrall(msg)
	if(!hunter_data.thrall)
		return

	var/mob/living/carbon/T = hunter_data.thrall

	for(var/obj/item/clothing/gloves/yautja/hunter/G in T.contents)
		to_chat(T, span_yautjabold("[icon2html(G)] \The <b>[G]</b> beeps: [msg]"))
		if(G.notification_sound)
			playsound(T.loc, 'sound/items/pred_bracer.ogg', 75, 1)

//Update the power display thing. This is called in Life()
/mob/living/carbon/human/proc/update_power_display(perc)
	if(hud_used?.pred_power_icon)
		switch(perc)
			if(91 to INFINITY)
				hud_used.pred_power_icon.icon_state = "powerbar100"
			if(81 to 91)
				hud_used.pred_power_icon.icon_state = "powerbar90"
			if(71 to 81)
				hud_used.pred_power_icon.icon_state = "powerbar80"
			if(61 to 71)
				hud_used.pred_power_icon.icon_state = "powerbar70"
			if(51 to 61)
				hud_used.pred_power_icon.icon_state = "powerbar60"
			if(41 to 51)
				hud_used.pred_power_icon.icon_state = "powerbar50"
			if(31 to 41)
				hud_used.pred_power_icon.icon_state = "powerbar40"
			if(21 to 31)
				hud_used.pred_power_icon.icon_state = "powerbar30"
			if(11 to 21)
				hud_used.pred_power_icon.icon_state = "powerbar20"
			else
				hud_used.pred_power_icon.icon_state = "powerbar10"

/mob/living/carbon/human/proc/butcher()
	set category = "Yautja"
	set name = "Butcher"
	set desc = "Butcher a corpse you're standing on for its tasty meats."

	if(stat || (lying_angle && !resting && !IsSleeping()) || (IsParalyzed() || IsUnconscious()) || lying_angle || buckled)
		return

	var/list/choices = list()
	for(var/mob/living/carbon/M in view(1, src) - src)
		if(Adjacent(M) && M.stat == DEAD)
			if(ishuman(M))
				var/mob/living/carbon/human/Q = M
				if(Q.species && species && Q.species.name == species.name)
					continue
			choices += M

	var/mob/living/carbon/T = tgui_input_list(src, "What do you wish to butcher?", "Butcher", choices)

	var/mob/living/carbon/xenomorph/xeno_victim
	var/mob/living/carbon/human/victim

	if(!T || !src || !T.stat)
		to_chat(src, span_warning("Nope."))
		return

	if(!Adjacent(T))
		to_chat(src, span_warning("You have to be next to your target."))
		return

	if(isxenolarva(T) || isxenofacehugger(T))
		to_chat(src, span_warning("This tiny worm is not even worth using your tools on."))
		return

	if(stat || (lying_angle && !resting && !IsSleeping()) || (IsParalyzed() || IsUnconscious()) || lying_angle || buckled)
		return

	if(isxeno(T))
		xeno_victim = T

	else if(ishuman(T))
		victim = T

		if(issynth(T) || isrobot(T) || victim.species.species_flags & ROBOTIC_LIMBS)
			to_chat(src, span_warning("You would break your tools if you did this!"))
			return

	var/static/list/procedure_choices = list(
		"Skin" = null,
		"Behead" = "head",
		"Delimb - Right Hand" = "r_hand",
		"Delimb - Left Hand" = "l_hand",
		"Delimb - Right Arm" = "r_arm",
		"Delimb - Left Arm" = "l_arm",
		"Delimb - Right Foot" = "r_foot",
		"Delimb - Left Foot" = "l_foot",
		"Delimb - Right Leg" = "r_leg",
		"Delimb - Left Leg" = "l_leg",
	)

	var/procedure = ""

	if(victim)
		procedure = tgui_input_list(src, "Which slice would you like to take?", "Take Slice", procedure_choices)
		if(!procedure)
			return

	if(isxeno(T) || procedure == "Skin")
		if(T.butchery_progress)
			playsound(loc, 'sound/weapons/pierce.ogg', 25)
			visible_message(span_danger("[src] goes back to butchering \the [T]."), span_notice("You get back to butchering \the [T]."))
		else
			playsound(loc, 'sound/weapons/pierce.ogg', 25)
			visible_message(span_danger("[src] begins chopping and mutilating \the [T]."), span_notice("You take out your tools and begin your gruesome work on \the [T]. Hold still."))
			T.butchery_progress = 1

		if(T.butchery_progress == 1)
			if(do_after(src, 7 SECONDS, FALSE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
				visible_message(span_danger("[src] makes careful slices and tears out the viscera in \the [T]'s abdominal cavity."), span_notice("You carefully vivisect \the [T], ripping out the guts and useless organs. What a stench!"))
				T.butchery_progress = 2
				playsound(loc, 'sound/weapons/slash.ogg', 25)
			else
				to_chat(src, span_notice("You pause your butchering for later."))

		if(T.butchery_progress == 2)
			if(do_after(src, 6.5 SECONDS, FALSE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
				visible_message(span_danger("[src] hacks away at \the [T]'s limbs and slices off strips of dripping meat."), span_notice("You slice off a few of \the [T]'s limbs, making sure to get the finest cuts."))
				if(xeno_victim && isturf(xeno_victim.loc))
					var/obj/item/reagent_containers/food/snacks/meat/xenomeat = new /obj/item/reagent_containers/food/snacks/meat/xenomeat(T.loc)
					xenomeat.name = "raw [xeno_victim.xeno_caste.upgrade_name][xeno_victim.xeno_caste.display_name] steak"
				else if(victim && isturf(victim.loc))
					victim.apply_damage(100, BRUTE, pick("r_leg", "l_leg", "r_arm", "l_arm"), FALSE, TRUE) //Basically just rips off a random limb.
					var/obj/item/reagent_containers/food/snacks/meat/meat = new /obj/item/reagent_containers/food/snacks/meat(victim.loc)
					meat.name = "raw [victim.name] steak"
				T.butchery_progress = 3
				playsound(loc, 'sound/weapons/bladeslice.ogg', 25)
			else
				to_chat(src, span_notice("You pause your butchering for later."))

		if(T.butchery_progress == 3)
			if(do_after(src, 7 SECONDS, FALSE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
				visible_message(span_danger("[src] tears apart \the [T]'s ribcage and begins chopping off bit and pieces."), span_notice("You rip open \the [T]'s ribcage and start tearing the tastiest bits out."))
				if(xeno_victim && isturf(xeno_victim.loc))
					var/obj/item/reagent_containers/food/snacks/meat/xenomeat = new /obj/item/reagent_containers/food/snacks/meat/xenomeat(T.loc)
					xenomeat.name = "raw [xeno_victim.xeno_caste.upgrade_name][xeno_victim.xeno_caste.display_name] tenderloin"
				else if(victim && isturf(T.loc))
					var/obj/item/reagent_containers/food/snacks/meat/meat = new /obj/item/reagent_containers/food/snacks/meat(victim.loc)
					meat.name = "raw [victim.name] tenderloin"
					victim.apply_damage(100, BRUTE,"chest", FALSE, FALSE)
				T.butchery_progress = 4
				playsound(loc, 'sound/weapons/wristblades_hit.ogg', 25)
			else
				to_chat(src, span_notice("You pause your butchering for later."))

		if(T.butchery_progress == 4)
			if(do_after(src, 9 SECONDS, FALSE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
				if(xeno_victim && isturf(T.loc))
					visible_message(span_danger("[src] flenses the last of [victim]'s exoskeleton, revealing only bones!."), span_notice("You flense the last of [victim]'s exoskeleton clean off!"))
					new /obj/effect/decal/remains/xeno(xeno_victim.loc)
					var/obj/item/stack/sheet/animalhide/xeno/xenohide = new /obj/item/stack/sheet/animalhide/xeno(xeno_victim.loc)
					xenohide.name = "[xeno_victim.xeno_caste.upgrade_name][xeno_victim.xeno_caste.display_name]-hide"
					xenohide.singular_name = "[xeno_victim.xeno_caste.upgrade_name][xeno_victim.xeno_caste.display_name]-hide"
					xenohide.merge_type = "[xeno_victim.xeno_caste.upgrade_name][xeno_victim.xeno_caste.display_name]-hide"
				else if(victim && isturf(T.loc))
					visible_message(span_danger("[src] reaches down and rips out \the [T]'s spinal cord and skull!."), span_notice("You firmly grip the revealed spinal column and rip [T]'s head off!"))
					var/datum/limb/head_limb = victim.get_limb("head")
					if(!(head_limb.limb_status & LIMB_DESTROYED))
						victim.apply_damage(150, BRUTE, "head", FALSE, TRUE)
						var/obj/item/armor_module/limb/skeleton/head/spine/new_spine = new /obj/item/armor_module/limb/skeleton/head/spine(victim.loc)
						new_spine.name = "[victim]'s spine"
					else
						var/obj/item/reagent_containers/food/snacks/meat/meat = new /obj/item/reagent_containers/food/snacks/meat(victim.loc)
						meat.name = "raw [victim.real_name] steak"
						new /obj/item/armor_module/limb/skeleton/torso(victim.loc)
					var/obj/item/stack/sheet/animalhide/human/hide = new /obj/item/stack/sheet/animalhide/human(victim.loc)
					hide.name = "[victim.name]-hide"
					hide.singular_name = "[victim.name]-hide"
					new /obj/effect/decal/remains/human(T.loc)
				T.butchery_progress = 5 //Won't really matter.
				playsound(loc, 'sound/weapons/slice.ogg', 25)
				if(hunter_data.prey == T)
					to_chat(src, span_yautjabold("You have claimed [T] as your trophy."))
					emote("roar2")
					message_all_yautja("[src.real_name] has claimed [T] as their trophy.")
					hunter_data.prey = null
				else
					to_chat(src, span_notice("You finish butchering!"))
				qdel(T)
			else
				to_chat(src, span_notice("You pause your butchering for later."))
	else
		var/limb = procedure_choices[procedure]
		var/limbName = parse_zone(limb)
		var/datum/limb/limb_datum = victim.get_limb(limb)
		if(limb_datum.limb_status & LIMB_DESTROYED)
			to_chat(src, span_warning("The victim lacks a [limbName]."))
			return
		if(limb_datum.name == "head")
			visible_message("<b>[src] reaches down and starts beheading [T].</b>","<b>You reach down and start beheading [T].</b>")
		else
			visible_message("<b>[src] reaches down and starts removing [T]'s [limbName].</b>","<b>You reach down and start removing [T]'s [limbName].</b>")
		if(do_after(src, 9 SECONDS, FALSE, src, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
			if(limb_datum.limb_status & LIMB_DESTROYED)
				to_chat(src, span_warning("The victim lacks a [limbName]."))
				return
			limb_datum.droplimb(TRUE, FALSE, "butchering")
			playsound(loc, 'sound/weapons/slice.ogg', 25)
			if(hunter_data.prey == T)
				to_chat(src, span_yautjabold("You have claimed [T] as your trophy."))
				emote("roar2")
				message_all_yautja("[src.real_name] has claimed [T] as their trophy.")
				hunter_data.prey = null
			else
				to_chat(src, span_notice("You finish butchering!"))

/area/yautja
	name = "\improper Yautja Ship"
	icon_state = "teleporter"
	ceiling = CEILING_METAL
	requires_power = FALSE
	static_lighting = FALSE
	base_lighting_alpha = 255

/mob/living/carbon/human/proc/pred_buy()
	if(hunter_data.claimed_equipment)
		to_chat(src, span_warning("You've already claimed your equipment."))
		return

	if(stat || (lying_angle && !resting && !IsSleeping()) || (IsParalyzed() || IsUnconscious()) || lying_angle || buckled)
		to_chat(src, span_warning("You're not able to do that right now."))
		return

	if(!isyautja(src))
		to_chat(src, span_warning("How did you get this verb?"))
		return

	if(!istype(get_area(src), /area/yautja))
		to_chat(src, span_warning("Not here. Only on the ship."))
		return

	var/obj/item/clothing/gloves/yautja/hunter/bracer = gloves
	if(!istype(bracer))
		to_chat(src, span_warning("You need to be wearing your bracers to do this."))
		return

	var/sure = alert("An array of powerful weapons are displayed to you. Pick your gear carefully. If you cancel at any point, you will not claim your equipment.", "Sure?", "Begin the Hunt", "No, not now")
	if(sure != "Begin the Hunt")
		return

	var/list/melee = list(YAUTJA_GEAR_GLAIVE = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "glaive"), YAUTJA_GEAR_WHIP = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "whip"),YAUTJA_GEAR_SWORD = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "clansword"),YAUTJA_GEAR_SCYTHE = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "predscythe"), YAUTJA_GEAR_STICK = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "combistick"), YAUTJA_GEAR_SCIMS = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "scim"))
	var/list/other = list(YAUTJA_GEAR_LAUNCHER = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "spikelauncher"), YAUTJA_GEAR_PISTOL = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "plasmapistol"), YAUTJA_GEAR_DISC = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "disc"), YAUTJA_GEAR_FULL_ARMOR = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "fullarmor_ebony"), YAUTJA_GEAR_SHIELD = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "shield"), YAUTJA_GEAR_DRONE = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "falcon_drone"))
	var/list/restricted = list(YAUTJA_GEAR_LAUNCHER, YAUTJA_GEAR_PISTOL, YAUTJA_GEAR_FULL_ARMOR, YAUTJA_GEAR_SHIELD, YAUTJA_GEAR_DRONE) //Can only select them once each.

	var/list/secondaries = list()
	var/total_secondaries = 2

	var/main_weapon = show_radial_menu(src, src, melee)

	if(main_weapon == YAUTJA_GEAR_SCYTHE)
		var/list/scythe_variants = list(YAUTJA_GEAR_SCYTHE = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "predscythe"), YAUTJA_GEAR_SCYTHE_ALT = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "predscythe_alt"))
		main_weapon = show_radial_menu(src, src, scythe_variants)

	if(main_weapon == YAUTJA_GEAR_GLAIVE)
		var/list/glaive_variants = list(YAUTJA_GEAR_GLAIVE = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "glaive"), YAUTJA_GEAR_GLAIVE_ALT = image(icon = 'icons/obj/items/hunter/pred_gear.dmi', icon_state = "glaive_alt"))
		main_weapon = show_radial_menu(src, src, glaive_variants)

	if(!main_weapon)
		return
	for(var/i = 1 to total_secondaries)
		var/secondary = show_radial_menu(src, src, other)
		if(!secondary)
			return
		secondaries += secondary
		if(secondary in restricted)
			other -= secondary

	if(hunter_data.claimed_equipment)
		to_chat(src, span_warning("You've already claimed your equipment."))
		return

	hunter_data.claimed_equipment = TRUE

	switch(main_weapon)
		if(YAUTJA_GEAR_GLAIVE)
			equip_to_slot_if_possible(new /obj/item/weapon/twohanded/yautja/glaive(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_GLAIVE_ALT)
			equip_to_slot_if_possible(new /obj/item/weapon/twohanded/yautja/glaive/alt(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_WHIP)
			equip_to_slot_if_possible(new /obj/item/weapon/yautja/chain(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_SWORD)
			equip_to_slot_if_possible(new /obj/item/weapon/yautja/sword(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_SCYTHE)
			equip_to_slot_if_possible(new /obj/item/weapon/yautja/scythe(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_SCYTHE_ALT)
			equip_to_slot_if_possible(new /obj/item/weapon/yautja/scythe/alt(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_STICK)
			equip_to_slot_if_possible(new /obj/item/weapon/yautja/combistick(src.loc), SLOT_S_STORE, warning = TRUE)
		if(YAUTJA_GEAR_SCIMS)
			if(bracer.wristblades_deployed)
				bracer.wristblades_internal(usr, TRUE)
			qdel(bracer.left_wristblades)
			qdel(bracer.right_wristblades)
			bracer.left_wristblades = new /obj/item/weapon/wristblades/scimitar(bracer)
			bracer.right_wristblades = new /obj/item/weapon/wristblades/scimitar(bracer)

	for(var/choice in secondaries)
		switch(choice)
			if(YAUTJA_GEAR_LAUNCHER)
				equip_to_slot_if_possible(new /obj/item/weapon/gun/energy/yautja/spike(src.loc), SLOT_IN_BELT, warning = TRUE)
			if(YAUTJA_GEAR_PISTOL)
				equip_to_slot_if_possible(new /obj/item/weapon/gun/energy/yautja/plasmapistol(src.loc), SLOT_IN_BELT, warning = TRUE)
			if(YAUTJA_GEAR_DISC)
				equip_to_slot_if_possible(new /obj/item/explosive/grenade/spawnergrenade/smartdisc(src.loc), SLOT_IN_BELT, warning = TRUE)
			if(YAUTJA_GEAR_FULL_ARMOR)
				if(wear_suit)
					dropItemToGround(wear_suit)
				equip_to_slot_if_possible(new /obj/item/clothing/suit/armor/yautja/hunter/full(src.loc, 0, src.client.prefs.predator_armor_material), SLOT_WEAR_SUIT, warning = TRUE)
			if(YAUTJA_GEAR_SHIELD)
				equip_to_slot_if_possible(new /obj/item/weapon/shield/riot/yautja(src.loc), SLOT_BACK, warning = TRUE)
			if(YAUTJA_GEAR_DRONE)
				equip_to_slot_if_possible(new /obj/item/clothing/falcon_drone(src.loc), SLOT_HEAD, warning = TRUE)

	var/datum/species/yautja/owner_species = species
	owner_species.pred_buy.remove_action(src)
