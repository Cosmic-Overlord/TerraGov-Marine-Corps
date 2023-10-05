/proc/random_ethnicity()
	return pick(GLOB.human_ethnicities_list)

/proc/random_hair_style(gender, species = "Human")
	var/list/valid_hairstyles = list()
	for(var/hairstyle in GLOB.hair_styles_list)
		var/datum/sprite_accessory/S = GLOB.hair_styles_list[hairstyle]
		if(gender == MALE && S.gender == FEMALE)
			continue
		if(gender == FEMALE && S.gender == MALE)
			continue
		if(!(species in S.species_allowed))
			continue
		valid_hairstyles[hairstyle] = GLOB.hair_styles_list[hairstyle]

	if(!length_char(valid_hairstyles))
		return "Crewcut"

	return pick(valid_hairstyles)


/proc/random_facial_hair_style(gender, species = "Human")
	var/list/valid_facialhairstyles = list()
	for(var/facialhairstyle in GLOB.facial_hair_styles_list)
		var/datum/sprite_accessory/S = GLOB.facial_hair_styles_list[facialhairstyle]
		if(gender == MALE && S.gender == FEMALE)
			continue
		if(gender == FEMALE && S.gender == MALE)
			continue
		if(!(species in S.species_allowed))
			continue

		valid_facialhairstyles[facialhairstyle] = GLOB.facial_hair_styles_list[facialhairstyle]

	if(!length_char(valid_facialhairstyles))
		return "Shaved"

	return pick(valid_facialhairstyles)


/proc/get_playable_species()
	return GLOB.roundstart_species


/proc/do_mob(mob/user, mob/target, delay = 30, user_display, target_display, prog_bar = PROGRESS_GENERIC, ignore_flags = NONE, datum/callback/extra_checks)
	if(!user || !target)
		return FALSE
	var/user_loc = user.loc

	var/target_loc = target.loc

	var/holding = user.get_active_held_item()
	var/datum/progressbar/P = prog_bar ? new prog_bar(user, delay, target, user_display, target_display) : null

	LAZYINCREMENT(user.do_actions, target)
	var/endtime = world.time + delay
	var/starttime = world.time
	. = TRUE
	while (world.time < endtime)
		stoplag(1)
		P?.update(world.time - starttime)

		if(QDELETED(user) || QDELETED(target) || (extra_checks && !extra_checks.Invoke()))
			. = FALSE
			break

		if(!(ignore_flags & IGNORE_LOC_CHANGE) && (user.loc != user_loc || target.loc != target_loc))
			. = FALSE
			break

		if(!(ignore_flags & IGNORE_HAND) && user.get_active_held_item() != holding)
			. = FALSE
			break

		if(user.incapacitated())
			. = FALSE
			break

	if(P)
		qdel(P)

	LAZYDECREMENT(user.do_actions, target)


//some additional checks as a callback for for do_afters that want to break on losing health or on the mob taking action
/mob/proc/break_do_after_checks(list/checked_health, check_clicks, selected_zone_check)
	if(check_clicks && next_move > world.time)
		return FALSE
	if(selected_zone_check && zone_selected != selected_zone_check)
		return FALSE
	return TRUE


//pass a list in the format list("health" = mob's health var) to check health during this
/mob/living/break_do_after_checks(list/checked_health, check_clicks, selected_zone_check)
	if(islist(checked_health))
		if(health < checked_health["health"])
			return FALSE
		checked_health["health"] = health
	return ..()


/proc/do_after(mob/user, delay, needhand = TRUE, atom/target, user_display, target_display, prog_bar = PROGRESS_GENERIC, datum/callback/extra_checks, ignore_turf_checks = FALSE)
	if(!user)
		return FALSE

	var/atom/Tloc
	if(target && !isturf(target))
		Tloc = target.loc

	var/atom/Uloc = user.loc

	var/holding = user.get_active_held_item()
	delay *= user.do_after_coefficent()

	var/atom/progtarget = target
	if(!target || Tloc == user)
		progtarget = user
	var/datum/progressbar/P = prog_bar ? new prog_bar(user, delay, progtarget, user_display, target_display) : null

	LAZYINCREMENT(user.do_actions, target)
	var/endtime = world.time + delay
	var/starttime = world.time
	. = TRUE
	while (world.time < endtime)
		stoplag(1)
		P?.update(world.time - starttime)

		if(QDELETED(user) || user.incapacitated(TRUE) || (!ignore_turf_checks && user.loc != Uloc) || (extra_checks && !extra_checks.Invoke()))
			. = FALSE
			break

		if(!QDELETED(Tloc) && (QDELETED(target) || Tloc != target.loc))
			if((!ignore_turf_checks && Uloc != Tloc) || Tloc != user)
				. = FALSE
				break

		if(needhand && user.get_active_held_item() != holding)
			. = FALSE
			break
	if(P)
		qdel(P)
	LAZYDECREMENT(user.do_actions, target)


/mob/proc/do_after_coefficent() // This gets added to the delay on a do_after, default 1
	. = 1


/proc/random_unique_name(gender, attempts_to_find_unique_name = 10)
	for(var/i in 1 to attempts_to_find_unique_name)
		. = GLOB.namepool[/datum/namepool].get_random_name(gender)

		if(!findname(.))
			break


/proc/get_mob_by_ckey(key)
	if(!key)
		return
	var/list/mobs = sortmobs()
	for(var/mob/M in mobs)
		if(M.ckey == key)
			return M


/proc/living_player_count()
	. = 0
	for(var/i in GLOB.player_list)
		var/mob/M = i
		if(M.stat != DEAD)
			.++


/// Displays a message in deadchat, sent by source. Source is not linkified, message is, to avoid stuff like character names to be linkified.
/// Automatically gives the class deadsay to the whole message (message + source)
/proc/deadchat_broadcast(message, source = null, mob/follow_target = null, turf/turf_target = null, speaker_key = null, message_type = DEADCHAT_REGULAR)
	message = span_deadsay("[source][span_linkify("[message]")]")
	for(var/mob/M in GLOB.player_list)
		var/chat_toggles = TOGGLES_CHAT_DEFAULT
		var/deadchat_toggles = TOGGLES_DEADCHAT_DEFAULT
		if(M.client.prefs)
			var/datum/preferences/prefs = M.client.prefs
			chat_toggles = prefs.toggles_chat
			deadchat_toggles = prefs.toggles_deadchat


		var/override = FALSE
		if(check_other_rights(M.client, R_ADMIN, FALSE) && (chat_toggles & CHAT_DEAD))
			override = TRUE
		if(SSticker.current_state == GAME_STATE_FINISHED)
			override = TRUE
		if(isnewplayer(M) && !override)
			continue
		if(M.stat != DEAD && !override)
			continue

		switch(message_type)
			if(DEADCHAT_DEATHRATTLE)
				if(CHECK_BITFIELD(deadchat_toggles, DISABLE_DEATHRATTLE))
					continue
			if(DEADCHAT_ARRIVALRATTLE)
				if(CHECK_BITFIELD(deadchat_toggles, DISABLE_ARRIVALRATTLE))
					continue
			if(DEADCHAT_REGULAR)
				if(!CHECK_BITFIELD(chat_toggles, CHAT_DEAD))
					continue

		if(isobserver(M))
			var/rendered_message = message

			if(follow_target)
				var/F
				if(turf_target)
					F = FOLLOW_OR_TURF_LINK(M, follow_target, turf_target)
				else
					F = FOLLOW_LINK(M, follow_target)
				rendered_message = "[F] [message]"
			else if(turf_target)
				var/turf_link = TURF_LINK(M, turf_target)
				rendered_message = "[turf_link] [message]"

			to_chat(M, rendered_message, avoid_highlighting = speaker_key == M.key)
		else
			to_chat(M, message, avoid_highlighting = speaker_key == M.key)


/*Changing/updating a mob's client color matrices. These render over the map window and affect most things the player sees, except things like inventory,
text popups, HUD, and some fullscreens. Code based on atom filter code, since these have similar issues with application order - for ex. if you have
a desaturation and a recolor matrix, you'll get very different results if you desaturate before recoloring, or recolor before desaturating.

See matrices.dm for the matrix procs.

If you want to recolor a specific atom, you should probably do it as a color matrix filter instead since that code already exists.

Apparently color matrices are not the same sort of matrix used by matrix datums and can't be worked with using normal matrix procs.*/

///Adds a color matrix and updates the client. Priority is the order the matrices are applied, lowest first. Will replace an existing matrix of the same name, if one exists.
/mob/proc/add_client_color_matrix(name, priority, list/params, time, easing)
	LAZYINITLIST(client_color_matrices)

	//Package the matrices in another list that stores priority.
	client_color_matrices[name] = list("priority" = priority, "color_matrix" = params.Copy())

	update_client_color_matrices(time, easing)

/**Combines all color matrices and applies them to the client.
Also used on login to give a client its new body's color matrices.
Responsible for sorting the matrices.
Transition is animated but instant by default.**/
/mob/proc/update_client_color_matrices(time = 0 SECONDS, easing = LINEAR_EASING)
	if(!client)
		return

	if(!length(client_color_matrices))
		animate(client, color = null, time = time, easing = easing)
		UNSETEMPTY(client_color_matrices)
		SEND_SIGNAL(src, COMSIG_MOB_RECALCULATE_CLIENT_COLOR)
		return

	//Sort the matrix packages by priority.
	client_color_matrices = sortTim(client_color_matrices, GLOBAL_PROC_REF(cmp_filter_data_priority), TRUE)

	var/list/final_matrix

	for(var/package in client_color_matrices)
		var/list/current_matrix = client_color_matrices[package]["color_matrix"]
		if(!final_matrix)
			final_matrix = current_matrix
		else
			final_matrix = color_matrix_multiply(final_matrix, current_matrix)

	animate(client, color = final_matrix, time = time, easing = easing)
	SEND_SIGNAL(src, COMSIG_MOB_RECALCULATE_CLIENT_COLOR)

///Changes a matrix package's priority and updates client.
/mob/proc/change_client_color_matrix_priority(name, new_priority, time, easing)
	if(!client_color_matrices || !client_color_matrices[name])
		return

	client_color_matrices[name]["priority"] = new_priority

	update_client_color_matrices(time, easing)

///Returns the matrix of that name, if it exists.
/mob/proc/get_client_color_matrix(name)
	return client_color_matrices[name]["color_matrix"]

///Can take either a single name or a list of several. Attempts to remove target matrix packages and update client.
/mob/proc/remove_client_color_matrix(name_or_names, time, easing)
	if(!client_color_matrices)
		return

	var/found = FALSE
	var/list/names = islist(name_or_names) ? name_or_names : list(name_or_names)

	for(var/name in names)
		if(client_color_matrices[name])
			client_color_matrices -= name
			found = TRUE

	if(found)
		update_client_color_matrices(time, easing)

///Removes all matrices and updates client.
/mob/proc/clear_client_color_matrices(time, easing)
	client_color_matrices = null
	update_client_color_matrices(time, easing)
