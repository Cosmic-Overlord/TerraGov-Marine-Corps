/datum/xeno_caste/predalien
	caste_name = "Predalien"
	display_name = "Abomination"
	caste_type_path = /mob/living/carbon/xenomorph/predalien

	// *** Melee Attacks *** //
	melee_damage = 40

	// *** Tackle *** //
	tacklemin = 3
	tacklemax = 6

	// *** Speed *** //
	speed = -0.8

	// *** Plasma *** //
	plasma_max = 300
	plasma_gain = 5

	soft_armor = list(MELEE = 30, BULLET = 30, LASER = 30, ENERGY = 30, BOMB = 100, BIO = 55, FIRE = 55, ACID = 55)

	// *** Health *** //
	max_health = 650

	// *** Minimap Icon *** //
	minimap_icon = "predalien"

	// *** Abilities *** ///
	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/activable/pounce/predalien,
		/datum/action/xeno_action/activable/predalien_roar,
		/datum/action/xeno_action/activable/smash,
		/datum/action/xeno_action/activable/devastate,

	)

/mob/living/carbon/xenomorph/predalien
	caste_base_type = /mob/living/carbon/xenomorph/predalien
	name = "Abomination" //snowflake name
	desc = "A strange looking creature with fleshy strands on its head. It appears like a mixture of armor and flesh, smooth, but well carapaced."
	icon = 'icons/Xeno/predalien.dmi'
	icon_state = "Predalien Walking"
	wall_smash = TRUE
	pixel_x = -16
	old_x = -16
	mob_size = MOB_SIZE_BIG
	tier = 1

	var/kills = 0
	var/max_kills = 10
	var/butcher_time = 6 SECONDS


/mob/living/carbon/xenomorph/predalien/Initialize(mapload, mob/living/carbon/xenomorph/oldxeno, h_number)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(announce_spawn)), 3 SECONDS)
	hunter_data.dishonored = TRUE
	hunter_data.dishonored_reason = "An abomination upon the honor of us all!"
	hunter_data.dishonored_set = src
	hud_set_hunter()

/mob/living/carbon/xenomorph/predalien/proc/announce_spawn()
	if(!loc)
		return FALSE

	to_chat(src, {"
<span class='role_body'>|______________________|</span>
<span class='role_header'>You are a predator-alien hybrid!</span>
<span class='role_body'>You are a very powerful xenomorph creature that was born of a Yautja warrior body.
You are stronger, faster, and smarter than a regular xenomorph, but you must still listen to the queen.
You have a degree of freedom to where you can hunt and claim the heads of the hive's enemies, so check your verbs.
Your health meter will not regenerate normally, so kill and die for the hive!</span>
<span class='role_body'>|______________________|</span>
"})
	emote("roar")

/* *black spiderman* spiderman go back to work! Need port cause_data scumbag
/datum/behavior_delegate/predalien_base/append_to_stat()
	. = list()
	. += "Kills: [kills]/[max_kills]"

/datum/behavior_delegate/predalien_base/on_kill_mob(mob/M)
	. = ..()

	kills = min(kills + 1, max_kills)

//no damage modify here, only applying to MELEE DAMAGE
/datum/behavior_delegate/predalien_base/melee_attack_modify_damage(original_damage, mob/living/carbon/attacked_mob)
	if(ishuman(attacked_mob))
		var/mob/living/carbon/human/attacked_human = attacked_mob
		if(isyautja(attacked_human))
			original_damage *= 1.5

	return original_damage + kills * 2.5
*/
