
/datum/species/robot/somdroid
	name = "SOM Support Droid"
	name_plural = "SOM Support Droids"
	icobase = 'RUtgmc/icons/mob/human_races/r_somdroid.dmi'
	damage_mask_icon = 'icons/mob/dam_mask.dmi'
	joinable_roundstart = FALSE
	total_health = 165
	brute_mod = 0.50
	burn_mod = 0.50
	species_flags = NO_BREATHE|NO_SCAN|IS_SOM_DROID|NO_BLOOD|NO_POISON|NO_PAIN|NO_CHEM_METABOLIZATION|NO_STAMINA|DETACHABLE_HEAD|HAS_NO_HAIR|ROBOTIC_LIMBS|IS_INSULATED


/mob/living/carbon/human/species/robot/somdroid
	race = "SOM Support Droid"

/datum/job/som/silicon
	job_category = JOB_CAT_SILICON
	selection_color = "#aaee55"

/datum/job/som/silicon/droid
	title = SOM_SUPPORT_DROID
	req_admin_notify = TRUE
	comm_title = "Sup"
	paygrade = "Ver.I"
	supervisors = "the acting captain"
	total_positions = 1

	exp_requirements = XP_REQ_EXPERT
	exp_type = EXP_TYPE_REGULAR_ALL

	skills_type = /datum/skills/synthetic
	access = ALL_ACCESS
	minimal_access = ALL_ACCESS
	display_order = JOB_DISPLAY_ORDER_SOM_DROID
	outfit = /datum/outfit/job/som/droid
	job_flags = JOB_FLAG_LATEJOINABLE|JOB_FLAG_ROUNDSTARTJOINABLE|JOB_FLAG_ADDTOMANIFEST|JOB_FLAG_ISCOMMAND|JOB_FLAG_BOLD_NAME_ON_SELECTION|JOB_FLAG_PROVIDES_SQUAD_HUD|JOB_FLAG_CAN_SEE_ORDERS|JOB_FLAG_ALWAYS_VISIBLE_ON_MINIMAP
	job_points_needed = 40
	jobworth = list(
		/datum/job/xenomorph = LARVA_POINTS_SHIPSIDE_STRONG,
		/datum/job/som/squad/veteran = VETERAN_POINTS_REGULAR,
	)
	html_description = {"
		<b>Difficulty</b>: Soul Crushing<br /><br />
		<b>You answer to the</b> acting Command Staff and the human crew<br /><br />
		<b>Unlock Requirement</b>: Starting Role<br /><br />
		<b>Gamemode Availability</b>: Elimination <br /><br /><br />
		<b>Duty</b>: Support and assist in every department of the TerraGov Marine Corps, use your incredibly developed skills to help the marines during their missions. You can talk to other synthetics or the AI on the :n channel. Serve your purpose.
	"}
	minimap_icon = "somdroid"

/datum/outfit/job/som/droid
	name = SOM_SUPPORT_DROID
	jobtype = /datum/job/som/silicon/droid

	id = /obj/item/card/id/som
	belt = /obj/item/storage/belt/utility/som/full
	ears = /obj/item/radio/headset/mainship/som
	w_uniform = /obj/item/clothing/under/marine/robotic
	r_store = /obj/item/storage/pouch/general/large/som
	back = /obj/item/storage/backpack/satchel/som

/datum/job/som/silicon/droid/return_spawn_type()
	return /mob/living/carbon/human/species/robot/somdroid
