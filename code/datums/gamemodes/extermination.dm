/datum/game_mode/infestation/distress/extermination
	name = "Extermination"
	config_tag = "Extermination"

	flags_round_type = MODE_INFESTATION|MODE_LATE_OPENING_SHUTTER_TIMER|MODE_XENO_RULER|MODE_PSY_POINTS|MODE_PSY_POINTS_ADVANCED|MODE_DEAD_GRAB_FORBIDDEN|MODE_HIJACK_POSSIBLE|MODE_SILO_RESPAWN|MODE_SILOS_SPAWN_MINIONS|MODE_ALLOW_XENO_QUICKBUILD|MODE_ALLOW_PINPOINTER|MODE_SILO_NO_LARVA_GENERATION

	///How long between two larva check, 2 minutes for crush
	var/larva_check_interval = 4 MINUTES
	///Last time larva balance was checked
	var/last_larva_check

/datum/game_mode/infestation/distress/extermination/post_setup()
	. = ..()
	for(var/i in GLOB.nuke_spawn_locs)
		new /obj/machinery/nuclearbomb(i)
	RegisterSignal(SSdcs, COMSIG_GLOB_NUKE_EXPLODED, PROC_REF(on_nuclear_explosion))
	RegisterSignal(SSdcs, COMSIG_GLOB_NUKE_DIFFUSED, PROC_REF(on_nuclear_diffuse))
	RegisterSignal(SSdcs, COMSIG_GLOB_NUKE_START, PROC_REF(on_nuke_started))

/datum/game_mode/infestation/distress/extermination/check_finished()
	if(round_finished)
		return TRUE

	if(world.time < (SSticker.round_start_time + 5 SECONDS))
		return FALSE

	var/list/living_player_list = count_humans_and_xenos(count_flags = COUNT_IGNORE_ALIVE_SSD|COUNT_IGNORE_XENO_SPECIAL_AREA)
	var/num_humans = living_player_list[1]
	var/num_xenos = living_player_list[2]
	var/num_humans_ship = living_player_list[3]

	if(SSevacuation.dest_status == NUKE_EXPLOSION_FINISHED)
		message_admins("Round finished: [MODE_GENERIC_DRAW_NUKE]") //ship blows, no one wins
		round_finished = MODE_GENERIC_DRAW_NUKE
		return TRUE

	if(round_stage == INFESTATION_DROPSHIP_CAPTURED_XENOS)
		message_admins("Round finished: [MODE_INFESTATION_X_MINOR]")
		round_finished = MODE_INFESTATION_X_MINOR
		return TRUE

	if(planet_nuked == INFESTATION_NUKE_COMPLETED)
		message_admins("Round finished: [MODE_INFESTATION_M_MAJOR]") //marines managed to nuke the colony
		round_finished = MODE_INFESTATION_M_MAJOR
		return TRUE

	if(!num_humans)
		if(!num_xenos)
			message_admins("Round finished: [MODE_INFESTATION_DRAW_DEATH]") //everyone died at the same time, no one wins
			round_finished = MODE_INFESTATION_DRAW_DEATH
			return TRUE
		message_admins("Round finished: [MODE_INFESTATION_X_MAJOR]") //xenos wiped out ALL the marines without hijacking, xeno major victory
		round_finished = MODE_INFESTATION_X_MAJOR
		return TRUE
	if(!num_xenos)
		if(round_stage == INFESTATION_MARINE_CRASHING)
			message_admins("Round finished: [MODE_INFESTATION_M_MINOR]") //marines lost the ground operation but managed to wipe out Xenos on the ship at a greater cost, minor victory
			round_finished = MODE_INFESTATION_M_MINOR
			return TRUE
		message_admins("Round finished: [MODE_INFESTATION_M_MAJOR]") //marines win big
		round_finished = MODE_INFESTATION_M_MAJOR
		return TRUE
	if(round_stage == INFESTATION_MARINE_CRASHING && !num_humans_ship)
		if(SSevacuation.human_escaped > SSevacuation.initial_human_on_ship * 0.5)
			message_admins("Round finished: [MODE_INFESTATION_X_MINOR]") //xenos have control of the ship, but most marines managed to flee
			round_finished = MODE_INFESTATION_X_MINOR
			return
		message_admins("Round finished: [MODE_INFESTATION_X_MAJOR]") //xenos wiped our marines, xeno major victory
		round_finished = MODE_INFESTATION_X_MAJOR
		return TRUE
	return FALSE

/datum/game_mode/infestation/distress/extermination/process()
	. = ..()

	if(world.time > last_larva_check + larva_check_interval)
		balance_scales()
		last_larva_check = world.time

/datum/game_mode/infestation/distress/extermination/proc/balance_scales()
	var/datum/hive_status/normal/xeno_hive = GLOB.hive_datums[XENO_HIVE_NORMAL]
	var/datum/job/xeno_job = SSjob.GetJobType(/datum/job/xenomorph)
	var/stored_larva = xeno_job.total_positions - xeno_job.current_positions
	var/num_xenos = xeno_hive.get_total_xeno_number() + stored_larva
	if(!num_xenos)
		xeno_job.add_job_positions(1)
		return
	var/larva_surplus = (get_total_joblarvaworth() - (num_xenos * xeno_job.job_points_needed )) / xeno_job.job_points_needed
	if(larva_surplus < 1)
		return //Things are balanced, no burrowed needed
	xeno_job.add_job_positions(1)
	xeno_hive.update_tier_limits()


/datum/game_mode/infestation/distress/extermination/get_total_joblarvaworth(list/z_levels, count_flags)
	. = 0

	for(var/mob/living/carbon/human/H AS in GLOB.human_mob_list)
		if(!H.job)
			continue
		if(isspaceturf(H.loc))
			continue
		. += H.job.jobworth[/datum/job/xenomorph]
