// ***************************************
// *********** Pouncey
// ***************************************
/datum/action/xeno_action/activable/pounce/predalien
	name = "Leap"

	range = 5
	victim_paralyze_time = FALSE // Do we slash upon reception?
	freeze_on_hit_time = FALSE // Should we freeze ourselves after the lunge?

/datum/action/xeno_action/activable/pounce/predalien/prepare_to_pounce()
	. = ..()
	playsound(owner, 'sound/voice/predalien_pounce.ogg', 75, 0)

// ***************************************
// *********** Roar
// ***************************************

/datum/action/xeno_action/activable/predalien_roar
	name = "Roar"
	action_icon_state = "screech"
	ability_name = "roar"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_ROAR,
	)
	cooldown_timer = 25 SECONDS
	plasma_cost = 50

	var/predalien_roar = list("sound/voice/predalien_roar.ogg")
	var/bonus_damage_scale = 2.5
	var/bonus_speed_scale = 0.05

/datum/action/xeno_action/activable/predalien_roar/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/predalien/xeno = owner

	if(!action_cooldown_check())
		return

	if(!xeno.check_state())
		return

	if(!succeed_activate())
		return

	playsound(xeno.loc, pick(predalien_roar), 75, 0)
	xeno.visible_message(span_xenohighdanger("[xeno] emits a guttural roar!"))
	xeno.create_shriekwave(color = "#FF0000")

	for(var/mob/living/carbon/carbon in view(7, xeno))
		if(ishuman(target) || isdroid(target))
			var/mob/living/carbon/human/human = carbon
			human.disable_special_items()

			var/obj/item/clothing/gloves/yautja/hunter/YG = locate(/obj/item/clothing/gloves/yautja/hunter) in human
			if(isyautja(human) && YG)
				if(YG.cloaked)
					YG.decloak(human)

				YG.cloak_timer = cooldown_timer * 0.1
		else if(isxeno(carbon))
			if(carbon.stat == DEAD)
				continue
			new /datum/status_effect/xeno_buff(carbon, xeno, ttl = (0.25 SECONDS * xeno.kills + 3 SECONDS), bonus_damage = bonus_damage_scale * xeno.kills, bonus_speed = (bonus_speed_scale * xeno.kills))


	for(var/mob/M in view(xeno))
		if(M && M.client)
			shake_camera(M, 10, 1)

	add_cooldown()
	return ..()

// ***************************************
// *********** Smash
// ***************************************

/datum/action/xeno_action/activable/smash
	name = "Smash"
	action_icon_state = "stomp"
	ability_name = "smash"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_SMASH,
	)
	cooldown_timer = 20 SECONDS
	plasma_cost = 80

	var/freeze_duration = 1.5 SECONDS

	var/activation_delay = 1 SECONDS
	var/smash_sounds = list('sound/effects/alien_footstep_charge1.ogg', 'sound/effects/alien_footstep_charge2.ogg', 'sound/effects/alien_footstep_charge3.ogg')

/datum/action/xeno_action/activable/smash/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/predalien/xeno = owner

	if(!action_cooldown_check())
		return

	if(!xeno.check_state())
		return

	if(!xeno.plasma_stored < plasma_cost)
		return

	if(!do_after(xeno, activation_delay, TRUE, target, BUSY_ICON_GENERIC, BUSY_ICON_GENERIC))
		to_chat(xeno, "Keep still whilst trying to smash into the ground")

		var/real_cooldown = cooldown_timer

		cooldown_timer = 3 SECONDS
		add_cooldown()
		cooldown_timer = real_cooldown
		return

	if(!succeed_activate())
		return

	playsound(xeno.loc, pick(smash_sounds), 50, 0)
	xeno.visible_message(span_xenohighdanger("[xeno] smashes into the ground!"))

	xeno.create_stomp()

	for(var/mob/living/carbon/human/human in oview(round(xeno.kills * 0.5 + 2), xeno))
		if(human.stat != DEAD)
			human.SetImmobilized(freeze_duration)

	for(var/mob/M in view(xeno))
		if(M && M.client)
			shake_camera(M, 0.2 SECONDS, 1)

	add_cooldown()
	return ..()

// ***************************************
// *********** Devastate
// ***************************************

/datum/action/xeno_action/activable/devastate
	name = "Devastate"
	action_icon_state = "gut"
	ability_name = "devastate"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_XENOABILITY_DEVASTATE,
	)
	cooldown_timer = 20 SECONDS
	plasma_cost = 110

	var/activation_delay = 1 SECONDS

	var/base_damage = 25
	var/damage_scale = 10 // How much it scales by every kill

/datum/action/xeno_action/activable/devastate/use_ability(atom/target)
	var/mob/living/carbon/xenomorph/predalien/xeno = owner

	if(!action_cooldown_check())
		return

	if(!xeno.check_state())
		return

	if(!ishuman(target) && !isdroid(target))
		to_chat(xeno, span_xenowarning("You must target a hostile!"))
		return

	if(get_dist(target, xeno) > 2)
		to_chat(xeno, span_xenowarning("[target] is too far away!"))
		return

	var/mob/living/carbon/carbon = target

	if(carbon.stat == DEAD)
		to_chat(xeno, span_xenowarning("[carbon] is dead, why would you want to touch them?"))
		return

	if(!succeed_activate())
		return

	carbon.SetImmobilized(30 SECONDS)

	add_cooldown()

	xeno.anchored = TRUE
	xeno.SetImmobilized(30 SECONDS)

	if(do_after(xeno, activation_delay, TRUE, carbon, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		xeno.visible_message(span_xenohighdanger("[xeno] rips open the guts of [carbon]!"), span_xenohighdanger("You rip open the guts of [carbon]!"))
		carbon.spawn_gibs()
		playsound(get_turf(carbon), 'sound/effects/gibbed.ogg', 75, 1)
		carbon.apply_effect(0.5, WEAKEN)
		carbon.apply_damage(base_damage + damage_scale * xeno.kills, ARMOR_MELEE, BRUTE, "chest", 20)

		xeno.do_attack_animation(carbon, ATTACK_EFFECT_CLAW)
		spawn()
			for(var/x in 1 to 4)
				sleep(1)
				xeno.setDir(turn(xeno.dir, 90))
		xeno.do_attack_animation(carbon, ATTACK_EFFECT_BITE)

	playsound(owner, 'sound/voice/predalien_growl.ogg', 75, 0)

	xeno.anchored = FALSE
	xeno.SetImmobilized(0)

	carbon.SetImmobilized(0)

	xeno.visible_message(span_xenodanger("[xeno] rapidly slices into [carbon]!"))

	return ..()
