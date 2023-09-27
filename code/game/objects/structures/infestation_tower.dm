
/obj/structure/sensor_tower_infestation
	name = "sensor tower"
	desc = "A tall tower with a sensor array at the top and a control box at the bottom. Has a lengthy activation process."
	icon = 'icons/obj/structures/sensor.dmi'  //TODO:  change icons
	icon_state = "sensor"
	obj_flags = NONE
	density = TRUE
	layer = BELOW_OBJ_LAYER
	resistance_flags = RESIST_ALL
	///The timer for when the sensor tower activates
	var/current_timer
	///Time it takes for the sensor tower to fully activate
	var/generate_time = 180 SECONDS
	///Time it takes to start the activation
	var/activate_time = 4 SECONDS
	///Time it takes to stop the activation
	var/deactivate_time = 4 SECONDS
	///Count amount of sensor towers existing
	var/static/id = 1
	///The id for the tower when it initializes, used for minimap icon
	var/towerid
	///True if the sensor tower has finished activation, used for minimap icon and preventing deactivation
	var/activated = FALSE

	//point generation

	///Tracks how many ticks have passed since we last added a sheet of material
	var/add_tick = 0
	///How many times we neeed to tick for a resource to be created, in this case this is 2* the specified amount
	var/required_ticks = 60
	///The amount of profit, less useful than phoron miners
	var/points_income = 80
	///Applies the actual bonus points for the dropship for each sale, even much more than miners
	var/dropship_bonus = 20

/obj/structure/sensor_tower_infestation/Initialize()
	. = ..()
	name += " " + num2text(id)
	towerid = id
	id++
	update_icon()

/obj/structure/sensor_tower_infestation/update_icon_state()
	icon_state = initial(icon_state)
	if(current_timer || activated)
		icon_state += "_loyalist"

/obj/structure/sensor_tower_infestation/attack_hand(mob/living/user)
	if(!ishuman(user))
		return
	if(user.do_actions)
		user.balloon_alert(user, "You are already doing something!")
		return
	interaction(user)

///Handles xeno interactions with the tower
/obj/structure/sensor_tower_infestation/attack_alien(mob/living/carbon/xenomorph/X, damage_amount = X.xeno_caste.melee_damage, damage_type = BRUTE, damage_flag = "", effects = TRUE, armor_penetration = 0, isrightclick = FALSE)
	if(X.status_flags & INCORPOREAL)
		return FALSE

	if(attack_alien_state_check(X))
		return

	balloon_alert(X, "You begin to deativate sensor tower!")
	if(!do_after(X, 5 SECONDS, TRUE, src, BUSY_ICON_DANGER, BUSY_ICON_HOSTILE))
		return

	if(attack_alien_state_check(X))
		return
	balloon_alert(X, "You deactivate sensor tower!")
	deactivate()

/obj/structure/sensor_tower_infestation/proc/attack_alien_state_check(mob/living/user)
	if(activated)
		return FALSE
	if(current_timer)
		return FALSE
	balloon_alert(user, "This sensor tower is not activated yet, don't let it be activated!")
	return TRUE

///Handles attacker interactions with the tower
/obj/structure/sensor_tower_infestation/proc/interaction(mob/living/user)
	if(!attacker_state_check(user))
		return
	balloon_alert_to_viewers("Activating sensor tower...")
	if(!do_after(user, activate_time, TRUE, src))
		return
	if(!attacker_state_check(user))
		return
	balloon_alert_to_viewers("Sensor tower activated!")
	begin_activation()

///Checks whether an attack can currently activate this tower
/obj/structure/sensor_tower_infestation/proc/attacker_state_check(mob/living/user)
	if(activated)
		balloon_alert(user, "This sensor tower is already fully activated!")
		return FALSE
	if(current_timer)
		balloon_alert(user, "This sensor tower is currently activating!")
		return FALSE
	return TRUE

///Starts timer and sends an alert
/obj/structure/sensor_tower_infestation/proc/begin_activation()
	current_timer = addtimer(CALLBACK(src, PROC_REF(finish_activation)), generate_time, TIMER_STOPPABLE)
	update_icon()

///When timer ends add a point to the point pool in sensor capture, increase game timer, and send an alert
/obj/structure/sensor_tower_infestation/proc/finish_activation()
	if(!current_timer)
		return
	if(activated)
		return

	current_timer = null
	activated = TRUE
	update_icon()

	START_PROCESSING(SSobj, src)

	var/datum/game_mode/infestation/distress/sensor_defence/mode = SSticker.mode
	mode.sensors_activated += 1

	playsound(src, 'sound/machines/ping.ogg', 25, 1)
	balloon_alert_to_viewers("[src] has finished activation!")

///Stops timer if activating and sends an alert
/obj/structure/sensor_tower_infestation/proc/deactivate()
	if(activated)
		STOP_PROCESSING(SSobj, src)
		var/datum/game_mode/infestation/distress/sensor_defence/mode = SSticker.mode
		mode.sensors_activated -= 1
	activated = FALSE
	current_timer = null

	update_icon()

/obj/structure/sensor_tower_infestation/update_icon()
	. = ..()
	update_control_minimap_icon()

///Update minimap icon of tower if its deactivated, activated , and fully activated
/obj/structure/sensor_tower_infestation/proc/update_control_minimap_icon()
	SSminimaps.remove_marker(src)
	if(activated)
		SSminimaps.add_marker(src, z, MINIMAP_FLAG_ALL, "relay_1_on_full") //TODO: change icons
	else
		SSminimaps.add_marker(src, z, MINIMAP_FLAG_ALL, "relay_1[current_timer ? "_on" : "_off"]") //TODO: change icons

/obj/structure/sensor_tower_infestation/process()
	if(add_tick >= required_ticks)
		SSpoints.supply_points[FACTION_TERRAGOV] += points_income
		SSpoints.dropship_points += dropship_bonus
		//GLOB.round_statistics.points_from_mining += mineral_value // TODO: make statistic
		do_sparks(5, TRUE, src)
		say("Scientific data has been sold for [points_income] points.")
		add_tick = 0
		return
	else
		add_tick += 1

//Should be in landmarks.dm, but still ok

/obj/effect/landmark/sensor_tower_infestation
	name = "Sensor tower"
	icon = 'icons/obj/structures/sensor.dmi'
	icon_state = "sensor_loyalist"

/obj/effect/landmark/sensor_tower_infestation/Initialize()
	..()
	GLOB.sensor_towers_infestation += loc
	return INITIALIZE_HINT_QDEL
