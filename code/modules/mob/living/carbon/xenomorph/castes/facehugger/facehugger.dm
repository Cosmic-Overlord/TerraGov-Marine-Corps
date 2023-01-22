/mob/living/carbon/xenomorph/facehugger
	caste_base_type = /mob/living/carbon/xenomorph/facehugger
	name = "Facehugger"
	desc = "This one looks much more active than its fellows"
	icon = 'icons/Xeno/facehugger_playable.dmi'
	icon_state = "Facehugger Walking"
	health = 50
	maxHealth = 50
	plasma_stored = 100
	pixel_x = -12
	pixel_y = -4
	old_x = -12
	old_y = -4
	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE
	pull_speed = -2
	flags_pass = PASSXENO | PASSTABLE | PASSMOB
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

// ***************************************
// *********** Mob overrides
// ***************************************
/mob/living/carbon/xenomorph/facehugger/handle_living_health_updates()
	. = ..()
	if(!loc_weeds_type && !is_ventcrawling)
		adjustBruteLoss(2, TRUE)
		return

/mob/living/carbon/xenomorph/facehugger/on_death()
	///We QDEL them as cleanup and preventing them from being sold
	QDEL_IN(src, 1 MINUTES)
	return ..()

/mob/living/carbon/xenomorph/facehugger/start_pulling(atom/movable/AM, force = move_force, suppress_message = FALSE)
	return FALSE

/mob/living/carbon/xenomorph/facehugger/pull_response(mob/puller)
	return TRUE

/mob/living/carbon/xenomorph/facehugger/proc/try_attach(mob/living/carbon/human/host)
	var/obj/item/clothing/mask/facehugger/mask = new /obj/item/clothing/mask/facehugger(host, src.hivenumber, src)
	if(host.can_be_facehugged(mask, provoked = TRUE))
		if(mask.Attach(host))
			src.forceMove(get_turf(host))
			return TRUE
		else
			qdel(mask)
			return FALSE
	else
		qdel(mask)
		return FALSE



