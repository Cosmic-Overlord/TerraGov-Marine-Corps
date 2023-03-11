/mob/living/carbon/xenomorph/facehugger
	caste_base_type = /mob/living/carbon/xenomorph/facehugger
	name = "Facehugger"
	desc = "This one looks much more active than its fellows"
	icon = 'icons/Xeno/facehugger_playable.dmi'
	icon_state = "Facehugger Walking"

	health = 50
	maxHealth = 50
	plasma_stored = 100

	pixel_x = -8
	pixel_y = -3
	old_x = -8
	old_y = -3

	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	mob_size = MOB_SIZE_SMALL
	pull_speed = -2
	flags_pass = PASSXENO | PASSTABLE | PASSMOB
	density = FALSE

	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

	bubble_icon = "alien"

// ***************************************
// *********** Mob overrides
// ***************************************
/mob/living/carbon/xenomorph/facehugger/Initialize(mapload)
	. = ..()
	switch(xeno_caste.upgrade_name)
		if("Clawed")
			a_intent = INTENT_HARM
			color = COLOR_RED
		if("Neuro")
			a_intent = INTENT_HARM
			color = COLOR_DARK_ORANGE
		if("Acid")
			a_intent = INTENT_HARM
			color = COLOR_GREEN
		if("Resin")
			a_intent = INTENT_HARM
			color = COLOR_STRONG_VIOLET
	GLOB.hive_datums[hivenumber].facehuggers += src

/mob/living/carbon/xenomorph/facehugger/handle_living_health_updates()
	. = ..()
	//We lose health if we go off the weed
	if(!loc_weeds_type && !is_ventcrawling && !(lying_angle || resting))
		adjustBruteLoss(2, TRUE)
		return

/mob/living/carbon/xenomorph/facehugger/update_progression()
	return

/mob/living/carbon/xenomorph/facehugger/upgrade_xeno(newlevel, silent = FALSE)
	newlevel = XENO_UPGRADE_BASETYPE
	return ..()

/mob/living/carbon/xenomorph/facehugger/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, 1 MINUTES)
	GLOB.hive_datums[hivenumber].facehuggers -= src
	return ..()

/mob/living/carbon/xenomorph/facehugger/start_pulling(atom/movable/AM, force = move_force, suppress_message = FALSE)
	return FALSE

/mob/living/carbon/xenomorph/facehugger/pull_response(mob/puller)
	return TRUE

/mob/living/carbon/xenomorph/facehugger/a_intent_change(input as text)
	if(xeno_caste.upgrade_name == "Larval")
		return ..()
	return

/mob/living/carbon/xenomorph/facehugger/death_cry()
	playsound(loc, 'sound/voice/alien_facehugger_dies.ogg', 25, 1)

///Trying to attach facehagger to face. Returns true on success and false otherwise
/mob/living/carbon/xenomorph/facehugger/proc/try_attach(mob/living/carbon/human/host)
	var/obj/item/clothing/mask/facehugger/larval/mask = new /obj/item/clothing/mask/facehugger/larval(host, src.hivenumber, src)
	if(host.can_be_facehugged(mask, provoked = TRUE))
		if(mask.Attach(host, FALSE)) //Attach hugger-mask
			src.forceMove(host) //Moving sentient hugger inside host
			return TRUE
		else
			qdel(mask)
			return FALSE
	else
		qdel(mask)
		return FALSE



// ***************************************
// *********** AI Section
// ***************************************
/datum/ai_behavior/xeno/facehugger
	minimum_health = 0.1

/datum/ai_behavior/xeno/facehugger/start_ai()
	RegisterSignal(mob_parent, COMSIG_MOVABLE_POST_THROW, .proc/sidestep)
	return ..()

/datum/ai_behavior/xeno/facehugger/cleanup_signals()
	. = ..()
	UnregisterSignal(mob_parent, COMSIG_MOVABLE_POST_THROW)

/datum/ai_behavior/xeno/facehugger/deal_with_obstacle(datum/source, direction)
	var/turf/obstacle_turf = get_step(mob_parent, direction)
	if(obstacle_turf.flags_atom & AI_BLOCKED)
		return
	for(var/thing in obstacle_turf.contents)
		if(istype(thing, /obj/machinery/door/airlock))
			var/obj/machinery/door/airlock/lock = thing
			if(!lock.density) //Airlock is already open no need to force it open again
				continue
			if(lock.operating) //Airlock already doing something
				continue
			if(lock.welded || lock.locked) //It's welded or locked, can't force that open
				continue
			lock.attack_facehugger(mob_parent)
			return COMSIG_OBSTACLE_DEALT_WITH
	if(ISDIAGONALDIR(direction) && ((deal_with_obstacle(null, turn(direction, -45)) & COMSIG_OBSTACLE_DEALT_WITH) || (deal_with_obstacle(null, turn(direction, 45)) & COMSIG_OBSTACLE_DEALT_WITH)))
		return COMSIG_OBSTACLE_DEALT_WITH

/datum/ai_behavior/xeno/facehugger/proc/sidestep()
	if(HAS_TRAIT(mob_parent, TRAIT_HANDS_BLOCKED))
		return
	var/step_dir = pick(CARDINAL_ALL_DIRS)
	var/turf/next_turf = get_step(mob_parent, step_dir)
	mob_parent.Move(next_turf, step_dir)


