/datum/species/yautja
	name = "Yautja"
	name_plural = "Yautja"
	brute_mod = 0.28 //Beefy!
	burn_mod = 0.65
	reagent_tag = IS_YAUTJA
	species_flags = HAS_SKIN_COLOR|NO_POISON|NO_OVERDOSE|NO_PAIN|USES_ALIEN_WEAPONS|GREYSCALE_BLOOD
	inherent_traits = list(
		TRAIT_YAUTJA_TECH,
		TRAIT_SUPER_STRONG,
		TRAIT_FOREIGN_BIO,
	)

	unarmed_type = /datum/unarmed_attack/punch/strong
	secondary_unarmed_type = /datum/unarmed_attack/bite/strong
	max_stamina = 200
	blood_color = "#20d450"
	flesh_color = "#907E4A"
	speech_sounds = list('sound/voice/pred_click1.ogg', 'sound/voice/pred_click2.ogg')
	speech_chance = 100
	death_message = "clicks in agony and falls still, motionless and completely lifeless..."
	darksight = 5
	slowdown = -0.5
	total_health = 175 //more health than regular humans

	default_language_holder = /datum/language_holder/yautja

	heat_level_1 = 500
	heat_level_2 = 700
	heat_level_3 = 1000

	inherent_verbs = list(
		/mob/living/carbon/human/proc/pred_buy,
		/mob/living/carbon/human/proc/butcher,
		/mob/living/carbon/human/proc/mark_for_hunt,
		/mob/living/carbon/human/proc/remove_from_hunt,
		/mob/living/carbon/human/proc/mark_gear,
		/mob/living/carbon/human/proc/unmark_gear,
		/mob/living/carbon/human/proc/mark_honored,
		/mob/living/carbon/human/proc/unmark_honored,
		/mob/living/carbon/human/proc/mark_dishonored,
		/mob/living/carbon/human/proc/unmark_dishonored,
		/mob/living/carbon/human/proc/mark_thralled,
		/mob/living/carbon/human/proc/unmark_thralled,
		/mob/living/carbon/human/proc/mark_panel,
	)

	knock_down_reduction = 4
	stun_reduction = 4

	icobase = 'icons/mob/hunter/r_predator.dmi'

/datum/species/yautja/larva_impregnated(obj/item/alien_embryo/embryo)
	var/datum/hive_status/hive = GLOB.hive_datums[embryo.hivenumber]

	if(!istype(hive))
		return

	hive.max_thick_nests++

	xeno_message("The hive senses that a headhunter has been infected! The thick resin nest is now available in the special structures list!", hivenumber = hive.hivenumber)

/datum/species/yautja/handle_death(mob/living/carbon/human/H, gibbed)
	if(gibbed)
		GLOB.yautja_mob_list -= H

	for(var/mob/living/carbon/M in H.hunter_data.dishonored_targets)
		M.hunter_data.dishonored_set = null
		H.hunter_data.dishonored_targets -= M
	for(var/mob/living/carbon/M in H.hunter_data.honored_targets)
		M.hunter_data.honored_set = null
		H.hunter_data.honored_targets -= M
	for(var/mob/living/carbon/M in H.hunter_data.gear_targets)
		M.hunter_data.gear_set = null
		H.hunter_data.gear_targets -= M

	if(H.hunter_data.prey)
		var/mob/living/carbon/M = H.hunter_data.prey
		H.hunter_data.prey = null
		M.hunter_data.hunter = null
		M.hud_set_hunter()

	set_predator_status(H, gibbed ? "Gibbed" : "Dead")

	// Notify all yautja so they start the gear recovery
	message_all_yautja("[H.real_name] has died at \the [get_area_name(H)].")

	if(H.hunter_data.thrall)
		var/mob/living/carbon/T = H.hunter_data.thrall
		message_all_yautja("[H.real_name]'s Thrall, [T.real_name] is now masterless.")
		H.message_thrall("Your master has fallen!")
		H.hunter_data.thrall = null

/datum/species/yautja/handle_death(mob/living/carbon/human/H, gibbed)
	set_predator_status(H, gibbed ? "Gibbed" : "Dead")

/datum/species/yautja/handle_cryo(mob/living/carbon/human/H)
	set_predator_status(H, "Cryo")
	qdel(H)

/datum/species/yautja/proc/set_predator_status(mob/living/carbon/human/H, status = "Alive")
	if(!H.key)
		return
	var/datum/game_mode/GM
	if(SSticker?.mode)
		GM = SSticker.mode
		if(H.key in GM.predators)
			GM.predators[H.key]["Status"] = status
		else
			GM.predators[H.key] = list("Name" = H.real_name, "Status" = status)

/datum/species/yautja/on_species_gain(mob/living/carbon/human/H, datum/species/old_species)
	. = ..()
	var/datum/atom_hud/medical/advanced/A = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	A.remove_hud_from(H)

/datum/species/yautja/post_species_loss(mob/living/carbon/human/H)
	..()
	var/datum/atom_hud/medical/advanced/A = GLOB.huds[DATA_HUD_MEDICAL_ADVANCED]
	A.add_to_hud(H)
	H.blood_type = pick("A+","A-","B+","B-","O-","O+","AB+","AB-")
	H.h_style = "Bald"
	GLOB.yautja_mob_list -= H

	if(H.actions_by_path[/datum/action/minimap/observer])
		var/datum/action/minimap/observer/mini = H.actions_by_path[/datum/action/minimap/observer]
		mini.remove_action(src)

/datum/species/yautja/handle_post_spawn(mob/living/carbon/human/H)
	GLOB.alive_human_list -= H

	H.blood_type = "Y*"
	H.h_style = "Standard"
	#ifndef UNIT_TESTS // Since this is a hard ref, we shouldn't confuse create_and_destroy
	GLOB.yautja_mob_list += H
	#endif

	if(!H.actions_by_path[/datum/action/minimap/observer])
		var/datum/action/minimap/observer/mini = new
		mini.give_action(H)

	return ..()

/datum/species/yautja/get_hairstyle(style)
	return GLOB.yautja_hair_styles_list[style]

/mob/proc/hud_set_hunter()
	return

var/global/image/hud_icon_hunter_gear
var/global/image/hud_icon_hunter_hunted
var/global/image/hud_icon_hunter_dishonored
var/global/image/hud_icon_hunter_honored
var/global/image/hud_icon_hunter_thralled

/mob/living/carbon/hud_set_hunter()
	var/image/holder = hud_list[HUNTER_HUD]
	holder.icon_state = "hudblank"
	holder.overlays.Cut()
	if(hunter_data.hunted)
		if(!hud_icon_hunter_hunted)
			hud_icon_hunter_hunted = image('icons/mob/screen/yautja.dmi', src, "hunter_hunted")
		holder.overlays += hud_icon_hunter_hunted

	if(hunter_data.dishonored)
		if(!hud_icon_hunter_dishonored)
			hud_icon_hunter_dishonored = image('icons/mob/screen/yautja.dmi', src, "hunter_dishonored")
		holder.overlays += hud_icon_hunter_dishonored
	else if(hunter_data.honored)
		if(!hud_icon_hunter_honored)
			hud_icon_hunter_honored = image('icons/mob/screen/yautja.dmi', src, "hunter_honored")
		holder.overlays += hud_icon_hunter_honored

	if(hunter_data.thralled)
		if(!hud_icon_hunter_thralled)
			hud_icon_hunter_thralled = image('icons/mob/screen/yautja.dmi', src, "hunter_thralled")
		holder.overlays += hud_icon_hunter_thralled
	else if(hunter_data.gear)
		if(!hud_icon_hunter_gear)
			hud_icon_hunter_gear = image('icons/mob/screen/yautja.dmi', src, "hunter_gear")
		holder.overlays += hud_icon_hunter_gear

	hud_list[HUNTER_HUD] = holder

/mob/living/carbon/xenomorph/hud_set_hunter()
	var/image/holder = hud_list[HUNTER_HUD]
	holder.icon_state = "hudblank"
	holder.overlays.Cut()
	holder.pixel_x = -18
	if(hunter_data.hunted)
		if(!hud_icon_hunter_hunted)
			hud_icon_hunter_hunted = image('icons/mob/screen/yautja.dmi', src, "hunter_hunted")
		holder.overlays += hud_icon_hunter_hunted

	if(hunter_data.dishonored)
		if(!hud_icon_hunter_dishonored)
			hud_icon_hunter_dishonored = image('icons/mob/screen/yautja.dmi', src, "hunter_dishonored")
		holder.overlays += hud_icon_hunter_dishonored
	else if(hunter_data.honored)
		if(!hud_icon_hunter_honored)
			hud_icon_hunter_honored = image('icons/mob/screen/yautja.dmi', src, "hunter_honored")
		holder.overlays += hud_icon_hunter_honored

	hud_list[HUNTER_HUD] = holder

/mob/living/carbon/human/yautja/hud_set_hunter()
	. = ..()

	var/image/holder = hud_list[HUNTER_CLAN]

	holder.icon_state = "predhud"

	if(client?.clan_info?.item?[4])
		var/datum/db_query/player_clan = SSdbcore.NewQuery("SELECT id, name, description, honor, color FROM [format_table_name("clan")] WHERE id = :clan_id", list("clan_id" = client.clan_info.item[4]))
		player_clan.Execute()
		if(player_clan.NextRow())
			holder.color = player_clan.item[5]

	hud_list[HUNTER_CLAN] = holder

/mob/living/carbon/human/yautja/send_speech(message, range = 7, obj/source = src, bubble_type, list/spans, datum/language/message_language, list/message_mods = list())
	. = ..()
	playsound(loc, pick('sound/voice/pred_click1.ogg', 'sound/voice/pred_click2.ogg'), 25, 1)
