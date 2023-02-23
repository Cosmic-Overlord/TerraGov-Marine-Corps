/datum/game_mode/infestation/crash/elimination
	name = "Elimination"
	config_tag = "Elimination"

	//More larvas in RUTGMC
	silo_scaling = 3.2

	flags_round_type = MODE_INFESTATION|MODE_PSY_POINTS|MODE_PSY_POINTS_ADVANCED|MODE_DEAD_GRAB_FORBIDDEN|MODE_SILO_RESPAWN|MODE_SILOS_SPAWN_MINIONS
	flags_xeno_abilities = ABILITY_DISTRESS
	factions = list(FACTION_SOM)
	valid_job_types = list(
		/datum/job/terragov/medical/medicalofficer = 6,
		/datum/job/som/silicon/droid = 1,
		/datum/job/som/squad/veteran = 1,
		/datum/job/som/squad/leader = 1,
		/datum/job/som/squad/medic = 8,
		/datum/job/som/squad/engineer = 4,
		/datum/job/som/squad/standard = -1,
		/datum/job/xenomorph = FREE_XENO_AT_START,
		/datum/job/xenomorph/queen = 1,
		/datum/job/survivor/rambo = 1,
	)
	// Shuttle details
	shuttle_id = SHUTTLE_WENDY
	starting_squad = "Zulu"
	bioscan_interval = 0

/datum/game_mode/infestation/crash/elimination/pre_setup()
	. = ..()

	// Spawn the ship
	if(!SSmapping.shuttle_templates[shuttle_id])
		message_admins("Gamemode: couldn't find a valid shuttle template for [shuttle_id]")
		CRASH("Shuttle [shuttle_id] wasn't found and can't be loaded")

	var/datum/map_template/shuttle/ST = SSmapping.shuttle_templates[shuttle_id]
	shuttle = SSshuttle.load_template_to_transit(ST)

	// Redefine the relevant spawnpoints after spawning the ship.
	for(var/job_type in shuttle.spawns_by_job)
		GLOB.spawns_by_job[job_type] = shuttle.spawns_by_job[job_type]

	GLOB.latejoinsom = shuttle.latejoins
	GLOB.latejoin_cryo = shuttle.latejoins
	GLOB.latejoin_gateway = shuttle.latejoins
	// Launch shuttle
	var/list/valid_docks = list()
	for(var/obj/docking_port/stationary/crashmode/potential_crash_site in SSshuttle.stationary)
		if(!shuttle.check_dock(potential_crash_site, silent = TRUE))
			continue
		valid_docks += potential_crash_site

	if(!length_char(valid_docks))
		CRASH("No valid crash sides found!")
	var/obj/docking_port/stationary/crashmode/actual_crash_site = pick(valid_docks)

	shuttle.crashing = TRUE
	SSshuttle.moveShuttleToDock(shuttle.id, actual_crash_site, TRUE) // FALSE = instant arrival
	addtimer(CALLBACK(src, .proc/crash_shuttle, actual_crash_site), 10 MINUTES)


/datum/game_mode/infestation/crash/elimination/post_setup()
	. = ..()
	SSpoints.add_psy_points(XENO_HIVE_NORMAL, 2 * SILO_PRICE + 4 * XENO_TURRET_PRICE)

	for(var/i in GLOB.xeno_turret_turfs)
		new /obj/structure/xeno/xeno_turret(i)
	for(var/obj/effect/landmark/corpsespawner/corpse AS in GLOB.corpse_landmarks_list)
		corpse.create_mob()


/datum/game_mode/infestation/crash/elimination/scale_roles(initial_players_assigned)
	. = ..()
	if(!.)
		return
	var/datum/job/scaled_job = SSjob.GetJobType(/datum/job/xenomorph) //Xenos
	scaled_job.job_points_needed  = DISTRESS_LARVA_POINTS_NEEDED


/datum/game_mode/infestation/crash/elimination/orphan_hivemind_collapse()
	if(round_finished)
		return
	if(round_stage == INFESTATION_MARINE_CRASHING)
		round_finished = MODE_INFESTATION_M_MINOR
		return
	round_finished = MODE_INFESTATION_M_MAJOR


/datum/game_mode/infestation/crash/elimination/get_hivemind_collapse_countdown()
	var/eta = timeleft(orphan_hive_timer) MILLISECONDS
	return !isnull(eta) ? round(eta) : 0

/datum/game_mode/infestation/crash/elimination/scale_squad_jobs()
	var/datum/job/scaled_job = SSjob.GetJobType(/datum/job/som/squad/leader)
	scaled_job.total_positions = length_char(SSjob.active_squads[FACTION_SOM])

/datum/game_mode/infestation/crash/elimination/scale_roles()
	if(SSjob.ssjob_flags & SSJOB_OVERRIDE_JOBS_START)
		return FALSE
	if(length_char(SSjob.active_squads[FACTION_SOM]))
		scale_squad_jobs()
	return TRUE

/datum/game_mode/infestation/crash/elimination/scale_roles()
	. = ..()
	if(!.)
		return
	var/datum/job/scaled_job = SSjob.GetJobType(/datum/job/som/squad/veteran)
	scaled_job.job_points_needed  = 5 //Every 5 non vets join, a new vet slot opens

/datum/game_mode/infestation/crash/elimination/set_valid_squads()
	SSjob.active_squads[FACTION_SOM] = list()
	for(var/key in SSjob.squads)
		var/datum/squad/squad = SSjob.squads[key]
		if(squad.faction == FACTION_SOM)
			SSjob.active_squads[squad.faction] += squad
	return TRUE

