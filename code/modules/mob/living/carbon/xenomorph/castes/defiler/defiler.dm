/mob/living/carbon/xenomorph/defiler
	caste_base_type = /mob/living/carbon/xenomorph/defiler
	name = "Defiler"
	desc = "A large, powerfully muscled xeno replete with dripping spines and gas leaking dorsal vents."
	icon = 'icons/Xeno/2x2_Xenos.dmi'
	icon_state = "Defiler Walking"
	health = 225
	maxHealth = 225
	plasma_stored = 400
	pixel_x = -16
	old_x = -16
	bubble_icon = "alienroyal"
	tier = XENO_TIER_THREE
	upgrade = XENO_UPGRADE_ZERO
	var/emitting_gas = FALSE
	inherent_verbs = list(
		/mob/living/carbon/xenomorph/proc/vent_crawl,
	)

	life_value = 0
	default_honor_value = 0
