// ***************************************
// *********** Hug
// ***************************************
/datum/action/xeno_action/activable/pounce_hugger
	name = "Pounce"
	action_icon_state = "pounce"
	desc = "Leap at your target and knock them down, if you jump close you will hug the target."
	ability_name = "pounce"
	cooldown_timer = 5 SECONDS
	plasma_cost = 25
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_POUNCE,
	)
	use_state_flags = XACT_USE_BUCKLED
	///How far can we leap.
	var/range = 6
	///How long is the windup before leap
	var/windup_time = 1 SECONDS
	///Where do we start the leap from
	var/start_point


/datum/action/xeno_action/activable/pounce_hugger/proc/pounce_complete()
	SIGNAL_HANDLER
	var/mob/living/carbon/xenomorph/caster = owner
	caster.icon_state = "[caster.xeno_caste.caste_name] Walking"
	UnregisterSignal(owner, list(COMSIG_XENO_OBJ_THROW_HIT, COMSIG_MOVABLE_POST_THROW, COMSIG_XENO_LIVING_THROW_HIT))


/datum/action/xeno_action/activable/pounce_hugger/proc/obj_hit(datum/source, obj/target, speed)
	SIGNAL_HANDLER

	pounce_complete()

/datum/action/xeno_action/activable/pounce_hugger/proc/mob_hit(datum/source, mob/living/M)
	SIGNAL_HANDLER
	if(M.stat || isxeno(M))
		return
	var/mob/living/carbon/xenomorph/facehugger/caster = owner

	caster.visible_message(span_danger("[caster] leaps on [M]!"),
					span_xenodanger("We leap on [M]!"), null, 5)
	playsound(caster.loc, 'sound/voice/alien_roar_larva3.ogg', 25, TRUE)

	check_shield(M)

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(get_dist(start_point, H) <= FACEHUGGER_HUG_RANGE) //Check whether we hugged the target or just knocked it down
			caster.try_attach(H)
		else
			H.Paralyze(FACEHUGGER_POST_JUMP_STUN_VICTIM)
			caster.Immobilize(FACEHUGGER_POST_JUMP_STUN_OWNER)

	pounce_complete()

/datum/action/xeno_action/activable/pounce_hugger/can_use_ability(atom/A, silent = FALSE, override_flags)
	. = ..()
	if(!.)
		return FALSE

	if(!A || A.layer >= FLY_LAYER)
		return FALSE

/datum/action/xeno_action/activable/pounce_hugger/proc/prepare_to_pounce()
	if(owner.layer == XENO_HIDING_LAYER) //Xeno is currently hiding, unhide him
		owner.layer = MOB_LAYER
	if(owner.buckled)
		owner.buckled.unbuckle_mob(owner)

/datum/action/xeno_action/activable/pounce_hugger/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/caster = owner

	prepare_to_pounce()
	if(!do_after(caster, windup_time, FALSE, caster, BUSY_ICON_DANGER, extra_checks = CALLBACK(src, .proc/can_use_ability, A, FALSE, XACT_USE_BUSY)))
		return fail_activate()

	caster.icon_state = "[caster.xeno_caste.caste_name] Thrown"

	caster.visible_message(span_xenowarning("\The [caster] leaps at [A]!"), \
	span_xenowarning("We leap at [A]!"))


	RegisterSignal(caster, COMSIG_XENO_OBJ_THROW_HIT, .proc/obj_hit)
	RegisterSignal(caster, COMSIG_XENO_LIVING_THROW_HIT, .proc/mob_hit)
	RegisterSignal(caster, COMSIG_MOVABLE_POST_THROW, .proc/pounce_complete)
	succeed_activate()
	add_cooldown()

	start_point = get_turf(caster)
	caster.throw_at(A, range, 2, caster) //Victim, distance, speed

	return TRUE

/datum/action/xeno_action/activable/pounce_hugger/proc/check_shield(mob/living/M)
	var/mob/living/carbon/xenomorph/caster = owner
	if(ishuman(M) && (M.dir in reverse_nearby_direction(owner.dir)))
		var/mob/living/carbon/human/H = M
		if(!H.check_shields(COMBAT_TOUCH_ATTACK, 30, "melee"))
			caster.Paralyze(10 SECONDS)
			caster.set_throwing(FALSE) //Reset throwing manually.
			return COMPONENT_KEEP_THROWING


/datum/action/xeno_action/activable/pounce_hugger/ai_should_start_consider()
	return TRUE

/datum/action/xeno_action/activable/pounce_hugger/ai_should_use(atom/target)
	if(!ishuman(target))
		return FALSE
	if(!line_of_sight(owner, target, FACEHUGGER_HUG_RANGE))
		return FALSE
	if(!can_use_action(override_flags = XACT_IGNORE_SELECTED_ABILITY))
		return FALSE
	if(target.get_xeno_hivenumber() == owner.get_xeno_hivenumber())
		return FALSE
	action_activate()
	LAZYINCREMENT(owner.do_actions, target)
	addtimer(CALLBACK(src, .proc/decrease_do_action, target), windup_time)
	return TRUE

///Decrease the do_actions of the owner
/datum/action/xeno_action/activable/pounce_hugger/proc/decrease_do_action(atom/target)
	LAZYDECREMENT(owner.do_actions, target)


// ***************************************
// *********** Clawed Jump
// ***************************************

/datum/action/xeno_action/activable/pounce_hugger/clawed
	name = "Multiple Onslaught"
	action_icon_state = "pounce"
	desc = "Jump through your enemies, up to three times in a row, dealing increased damage."
	cooldown_timer = 0 SECONDS
	plasma_cost = 20
	windup_time = 0 SECONDS
	//How many uses remain, and the regeneration of those uses.
	var/jump_charges = 0
	var/time_to_charge
	var/jump_hit_mob

/datum/action/xeno_action/activable/pounce_hugger/clawed/can_use_ability(atom/A, silent, override_flags)
	. = ..()
	var/mob/living/carbon/xenomorph/caster = owner
	if(caster.usedPounce) //preventing jump mid-air
		caster.balloon_alert(caster, "We're in a jump")
		return FALSE
	if(jump_charges < 1)
		caster.balloon_alert(caster, "No charges left")
		return FALSE

/datum/action/xeno_action/activable/pounce_hugger/clawed/use_ability(atom/A)
	var/mob/living/carbon/xenomorph/caster = owner
	caster.usedPounce = TRUE
	jump_charges -= 1
	time_to_charge = addtimer(CALLBACK(src, .proc/increase_stacks), 5 SECONDS, TIMER_UNIQUE)
	update_button_icon()
	return ..()


/datum/action/xeno_action/activable/pounce_hugger/clawed/mob_hit(datum/source, mob/living/M)
	if(M.stat || isxeno(M))
		return

	check_shield(M)
	M.attack_alien_harm(owner, 10)

	return COMPONENT_KEEP_THROWING

/datum/action/xeno_action/activable/pounce_hugger/clawed/pounce_complete()
	. = ..()
	var/mob/living/carbon/xenomorph/caster = owner
	caster.usedPounce = FALSE

/datum/action/xeno_action/activable/pounce_hugger/clawed/proc/increase_stacks()
	jump_charges += 1
	update_button_icon()
	//if we aren't full, loop until we are.
	if(jump_charges < FACEHUGGER_CHAIN_JUMP_CHARGES)
		time_to_charge = addtimer(CALLBACK(src, .proc/increase_stacks), 5 SECONDS, TIMER_UNIQUE)

/datum/action/xeno_action/activable/pounce_hugger/clawed/give_action(mob/living/L)
	. = ..()
	time_to_charge = addtimer(CALLBACK(src, .proc/increase_stacks), 5 SECONDS, TIMER_UNIQUE)

/datum/action/xeno_action/activable/pounce_hugger/clawed/update_button_icon()
	action_icon_state = "clawed_pounce_[jump_charges]"
	return ..()


// ***************************************
// *********** Neuro Jump
// ***************************************

/datum/action/xeno_action/activable/pounce_hugger/neuro
	name = "Neurotoxin Jump"
	action_icon_state = "pounce"
	desc = "Pounce on the target and poison them with neurotox."
	range = 4
	cooldown_timer = 3 SECONDS
	plasma_cost = 30
	windup_time = 0 SECONDS

/datum/action/xeno_action/activable/pounce_hugger/neuro/mob_hit(datum/source, mob/living/M)
	if(M.stat || isxeno(M))
		return
	if(!ishuman(M))
		return

	var/mob/living/carbon/xenomorph/caster = owner
	var/mob/living/carbon/human/victim = M
	caster.visible_message(span_danger("[caster] leaps on [victim]!"),
					span_xenodanger("We leap on [victim]!"), null, 5)

	check_shield(M)

	if(victim.can_sting())
		victim.adjustStaminaLoss(50)
		victim.adjust_stagger(3, capped = 6)
		victim.add_slowdown(5, 10)

		victim.reagents.add_reagent(/datum/reagent/toxin/xeno_neurotoxin, FACEHUGGER_NEURO_AMOUNT_INJECT, no_overdose = TRUE)

		playsound(M, 'sound/effects/spray3.ogg', 25, 1)
		victim.visible_message(span_danger("[caster] penetrates [victim] with its sharp probscius!"),span_danger("[caster] penetrates you with a sharp probscius!"))
	else
		victim.Paralyze(FACEHUGGER_POST_JUMP_STUN_VICTIM)
		caster.visible_message(span_danger("[caster] smashed into [victim]!"),
					span_xenodanger("We smashed into [victim]!"), null, 5)

	pounce_complete()


// ***************************************
// *********** Acid Jump
// ***************************************

/datum/action/xeno_action/activable/pounce_hugger/acid
	name = "Suicide: Acid"
	action_icon_state = "pounce"
	desc = "Jump and explode with a cloud of acid when landing."
	windup_time = 0.5 SECONDS

/datum/action/xeno_action/activable/pounce_hugger/acid/mob_hit(datum/source, mob/living/M)
	if(M.stat || isxeno(M))
		return

	pounce_complete()

/datum/action/xeno_action/activable/pounce_hugger/acid/pounce_complete()
	. = ..()

	owner.visible_message(span_danger("[owner] explodes into a smoking splatter of acid!"))
	playsound(owner.loc, 'sound/bullets/acid_impact1.ogg', 50, 1)

	for(var/turf/acid_tile AS in RANGE_TURFS(1, owner.loc))
		new /obj/effect/temp_visual/acid_splatter(acid_tile) //SFX
		if(!locate(/obj/effect/xenomorph/spray) in acid_tile.contents)
			new /obj/effect/xenomorph/spray(acid_tile, 6 SECONDS, 16)

	var/datum/effect_system/smoke_spread/xeno/acid/light/smoke = new(get_turf(owner)) //Spawn acid smoke
	smoke.set_up(1, owner.loc)
	smoke.start()

	owner.death(TRUE)


// ***************************************
// *********** Resin Jump
// ***************************************

/datum/action/xeno_action/activable/pounce_hugger/resin
	name = "Suicide: Resin"
	action_icon_state = "pounce"
	desc = "Jump and explode with a cloud of resin when landing."
	windup_time = 0.5 SECONDS

/datum/action/xeno_action/activable/pounce_hugger/resin/mob_hit(datum/source, mob/living/M)
	if(M.stat || isxeno(M))
		return

	pounce_complete()

/datum/action/xeno_action/activable/pounce_hugger/resin/pounce_complete()
	. = ..()

	owner.visible_message(span_danger("[owner] explodes into a mess of viscous resin!"))
	playsound(owner.loc, get_sfx("alien_resin_build"), 50, 1)

	for(var/turf/sticky_tile AS in RANGE_TURFS(1, owner.loc))
		if(!locate(/obj/effect/xenomorph/spray) in sticky_tile.contents)
			new /obj/alien/resin/sticky/thin(sticky_tile)

	for(var/mob/living/target in range(1, owner.loc))
		if(isxeno(target)) //Xenos aren't affected by sticky resin
			continue

		target.adjust_stagger(3)
		target.add_slowdown(15)
		target.adjustStaminaLoss(50)

	owner.death(TRUE)
