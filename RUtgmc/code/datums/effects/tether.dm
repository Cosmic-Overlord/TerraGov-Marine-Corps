/datum/status_effect/tethering
	id = "tethering"
	duration = -1
	status_type = STATUS_EFFECT_MULTIPLE
	var/range = 0
	var/datum/status_effect/tethered/tethered
	var/tether_icon // The icon used for the Beam proc for the tether
	var/datum/beam/tether_beam

/datum/status_effect/tethering/on_creation(atom/A, range, icon)
	. = ..()
	src.range = range
	tether_icon = icon

/datum/status_effect/tethering/on_apply()
	RegisterSignal(owner, COMSIG_MOVABLE_MOVED, PROC_REF(moved))

/datum/status_effect/tethering/Destroy()
	if(tethered)
		tethered.tether = null
		qdel(tethered)
		tethered = null
	if(owner)
		QDEL_NULL(tether_beam)
		UnregisterSignal(owner, COMSIG_MOVABLE_MOVED)
	. = ..()

/datum/status_effect/tethering/proc/moved()
	SIGNAL_HANDLER

	if(isnull(tethered))
		return

	if(isstructure(tethered.owner))//we are attached to a structure, shouldnt move it (too heavy)
		var/obj/structure/anchored_object = tethered.owner
		if(anchored_object.anchored)
			return

	var/atom/movable/A = tethered.owner
	if(get_dist(owner, A) <= range)
		return

	var/turf/T
	var/dir_away = get_dir(owner, A)
	for(var/dir in GLOB.alldirs)
		if(dir & dir_away)
			continue
		T = get_step(A, dir)
		if(get_dist(T, owner) <= range && A.Move(T))
			return

	// Integrity of tether is compromised (cannot maintain range), so delete it
	qdel(src)

/datum/status_effect/tethering/proc/set_tethered(datum/status_effect/tethered/T)
	tethered = T
	T.tether = src
	tether_beam = owner.beam(T.owner, tether_icon, time = INFINITY, maxdistance = range+1)

/datum/status_effect/tethered
	id = "tethered"
	duration = -1
	status_type = STATUS_EFFECT_MULTIPLE
	var/datum/status_effect/tethering/tether
	var/resistable = FALSE
	var/resist_time = 15 SECONDS

/datum/status_effect/tethered/on_creation(atom/A, resistable)
	. = ..()
	src.resistable = resistable

/datum/status_effect/tethered/on_apply()
	RegisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE, PROC_REF(check_move))
	if(resistable)
		RegisterSignal(owner, COMSIG_LIVING_DO_RESIST, PROC_REF(resist_callback))

// affected is always going to be the same as owner
/datum/status_effect/tethered/proc/check_move(dummy, turf/target)
	SIGNAL_HANDLER

	if(isnull(tether))
		return

	var/atom/A = tether.owner

	// If the target turf is out of range, can't move
	if(get_dist(target, A) > tether.range)
		to_chat(owner, span_warning("Your tether to \the [A] prevents you from moving any further!"))
		return COMPONENT_MOVABLE_BLOCK_PRE_MOVE

/datum/status_effect/tethered/Destroy()
	if(tether)
		tether.tethered = null
		qdel(tether)
		tether = null
	if(owner)
		UnregisterSignal(owner, COMSIG_MOVABLE_PRE_MOVE)
		if(resistable)
			UnregisterSignal(owner, COMSIG_LIVING_DO_RESIST)
	. = ..()

/datum/status_effect/tethered/proc/resist_callback()
	SIGNAL_HANDLER

	if(isnull(tether))
		return

	INVOKE_ASYNC(src, PROC_REF(resisted))

/datum/status_effect/tethered/proc/resisted()
	to_chat(owner, span_danger("You attempt to break out of your tether to [tether.owner]. (This will take around [resist_time/10] seconds and you need to stand still)"))
	if(!do_after(owner, resist_time, FALSE, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		return
	to_chat(owner, span_warning("You have broken out of your tether to [tether.owner]!"))
	qdel(src)

// Tethers the tethered atom to the tetherer
// If you want both atoms to be tethered to each other, pass in TRUE to the two_way arg
/proc/apply_tether(atom/tetherer, atom/tethered, two_way = FALSE, range = 1, resistable = FALSE, icon = "chain")
	var/list/ret_list = list()

	var/datum/status_effect/tethering/TR = new /datum/status_effect/tethering(tetherer, range, icon)
	var/datum/status_effect/tethered/TD = new /datum/status_effect/tethered(tethered, resistable)
	TR.set_tethered(TD)

	ret_list["tetherer_tether"] = TR
	ret_list["tethered_tethered"] = TD

	if(two_way)
		TR = new /datum/status_effect/tethering(tethered, icon)
		TD = new /datum/status_effect/tethered(tetherer, resistable)
		TR.set_tethered(TD)
		ret_list["tetherer_tethered"] = TD
		ret_list["tethered_tether"] = TR

	return ret_list
