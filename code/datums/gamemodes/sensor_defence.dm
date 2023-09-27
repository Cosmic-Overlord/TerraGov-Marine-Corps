/datum/game_mode/infestation/distress/sensor_defence
	name = "Sensor defence"
	config_tag = "Sensor defence"
	silo_scaling = 0.4 //do you really need a silo?

	///The amount of activated sensor towers in sensor defence
	var/sensors_activated = 0

	//larva points generation

	var/larva_points_check_interval = 1 MINUTES
	///Last time larva balance was checked
	var/last_larva_points_check
	///Ponderation rate of sensors output
	var/sensors_larva_points_scaling = 1.6

	flags_round_type = MODE_INFESTATION|MODE_LATE_OPENING_SHUTTER_TIMER|MODE_XENO_RULER|MODE_PSY_POINTS|MODE_PSY_POINTS_ADVANCED|MODE_DEAD_GRAB_FORBIDDEN|MODE_HIJACK_POSSIBLE|MODE_SILO_RESPAWN|MODE_SILOS_SPAWN_MINIONS|MODE_ALLOW_XENO_QUICKBUILD

/datum/game_mode/infestation/distress/sensor_defence/post_setup()
	. = ..()
	for(var/turf/T AS in GLOB.sensor_towers_infestation)
		new /obj/structure/sensor_tower_infestation(T)

/datum/game_mode/infestation/distress/sensor_defence/check_finished()
	if(round_finished)
		return TRUE

	if(world.time < (SSticker.round_start_time + 5 SECONDS))
		return FALSE

	var/list/living_player_list = count_humans_and_xenos(count_flags = COUNT_IGNORE_ALIVE_SSD|COUNT_IGNORE_XENO_SPECIAL_AREA)
	var/num_humans = living_player_list[1]
	var/num_xenos = living_player_list[2]
	var/num_humans_ship = living_player_list[3]

	if(sensors_activated >= length_char(GLOB.sensor_towers_infestation))
		message_admins("Round finished: [MODE_INFESTATION_M_MAJOR]") //marines managed to activate all sensors
		round_finished = MODE_INFESTATION_M_MAJOR
		return TRUE

	if(SSevacuation.dest_status == NUKE_EXPLOSION_FINISHED)
		message_admins("Round finished: [MODE_GENERIC_DRAW_NUKE]") //ship blows, no one wins
		round_finished = MODE_GENERIC_DRAW_NUKE
		return TRUE

	if(round_stage == INFESTATION_DROPSHIP_CAPTURED_XENOS)
		message_admins("Round finished: [MODE_INFESTATION_X_MINOR]")
		round_finished = MODE_INFESTATION_X_MINOR
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

/datum/game_mode/infestation/distress/sensor_defence/process()
	. = ..()
	if(world.time > last_larva_points_check + larva_points_check_interval)
		add_larva_points()
		last_larva_points_check = world.time

/datum/game_mode/infestation/distress/sensor_defence/proc/add_larva_points()
	//prohibit generation before the shutters open
	if(!SSsilo.can_fire)
		return

	//we should not spawn larvas on shipside
	if(SSmonitor.gamestate == SHIPSIDE)
		return

	//GLOB.round_statistics.larva_from_silo += current_larva_spawn_rate / xeno_job.job_points_needed TODO: statistic

	var/current_larva_spawn_rate = 0

	var/datum/job/xeno_job = SSjob.GetJobType(/datum/job/xenomorph)
	var/active_humans = length(GLOB.humans_by_zlevel["2"]) //we should not spawn larvas on shipside anyway
	var/active_xenos = length(GLOB.alive_xeno_list_hive[XENO_HIVE_NORMAL]) + (xeno_job.total_positions - xeno_job.current_positions)
	//The larval spawn is based on the amount of how much sensors is NOT active
	current_larva_spawn_rate = (length_char(GLOB.sensor_towers_infestation) - sensors_activated) / length_char(GLOB.sensor_towers_infestation)
	//We then are normalising with the number of alive marines, so the balance is roughly the same whether or not we are in high pop
	current_larva_spawn_rate *= SILO_BASE_OUTPUT_PER_MARINE * active_humans
	current_larva_spawn_rate *= sensors_larva_points_scaling
	//We scale the rate based on the current ratio of humans to xenos
	current_larva_spawn_rate *= clamp(round((active_humans / active_xenos) / (LARVA_POINTS_REGULAR / xeno_job.job_points_needed), 0.01), 0.5, 1.2)

	xeno_job.add_job_points(current_larva_spawn_rate)

	var/datum/hive_status/normal_hive = GLOB.hive_datums[XENO_HIVE_NORMAL]
	normal_hive.update_tier_limits()

/datum/game_mode/infestation/distress/sensor_defence/siloless_hive_collapse()
	return

/datum/game_mode/infestation/distress/sensor_defence/get_siloless_collapse_countdown()
	return

/datum/game_mode/infestation/distress/sensor_defence/update_silo_death_timer(datum/hive_status/silo_owner)
	return
