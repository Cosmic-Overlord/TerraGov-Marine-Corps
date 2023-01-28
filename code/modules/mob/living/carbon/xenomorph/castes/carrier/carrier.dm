/mob/living/carbon/xenomorph/carrier
	caste_base_type = /mob/living/carbon/xenomorph/carrier
	name = "Carrier"
	desc = "A strange-looking alien creature. It carries a number of scuttling jointed crablike creatures."
	icon = 'icons/Xeno/2x2_Xenos.dmi' //They are now like, 2x2
	icon_state = "Carrier Walking"
	health = 200
	maxHealth = 200
	plasma_stored = 50
	///Number of huggers the carrier is currently carrying
	var/huggers = 0
	tier = XENO_TIER_TWO
	upgrade = XENO_UPGRADE_ZERO
	pixel_x = -16 //Needed for 2x2
	old_x = -16
	bubble_icon = "alienroyal"
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
		/mob/living/carbon/xenomorph/proc/toggle_playable_facehugger,
	)

// ***************************************
// *********** Life overrides
// ***************************************
/mob/living/carbon/xenomorph/carrier/Stat()
	. = ..()

	if(statpanel("Game"))
		stat("Stored Huggers:", "[huggers] / [xeno_caste.huggers_max]")

//Observers can become playable facehuggers by clicking on the carrier
/mob/living/carbon/xenomorph/carrier/attack_ghost(mob/dead/observer/user)
	. = ..()

	if(!user.client?.prefs || !(user.client.prefs.be_special & (BE_ALIEN)) || is_banned_from(user.ckey, ROLE_XENOMORPH))
		return FALSE

	if(!sentient_huggers)
		return FALSE

	if(GLOB.key_to_time_of_death[user.key] + TIME_BEFORE_TAKING_FACEHUGGER > world.time && !user.started_as_observer)
		to_chat(user, span_warning("You died too recently to be able to take a new facehugger."))
		return FALSE

	if(alert("Are you sure you want to be a Facehugger?", "Become a part of the Horde", "Yes", "No") != "Yes")
		return FALSE

	if(!huggers)
		to_chat(user, span_warning("The carrier has no available huggers"))
		return FALSE

	var/mob/living/carbon/xenomorph/facehugger/new_hugger = new /mob/living/carbon/xenomorph/facehugger(get_turf(src))
	huggers--
	new_hugger.transfer_mob(user)
	log_admin("[user.key] took control of [new_hugger.name] from a [name] at [AREACOORD(src)].")
	return TRUE
