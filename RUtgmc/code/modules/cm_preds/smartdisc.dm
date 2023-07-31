/obj/item/explosive/grenade/spawnergrenade/smartdisc
	name = "smart-disc"
	spawner_type = /mob/living/simple_animal/hostile/smartdisc
	deliveryamt = 1
	desc = "A strange piece of alien technology. It has many jagged, whirring blades and bizarre writing."
	flags_item = ITEM_PREDATOR
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	item_icons = list(
		slot_back_str = 'icons/mob/hunter/pred_gear.dmi',
		slot_l_hand_str = 'icons/mob/hunter/items_lefthand.dmi',
		slot_r_hand_str = 'icons/mob/hunter/items_righthand.dmi'
	)
	icon_state = "disc"
	item_state = "pred_disc"
	w_class = WEIGHT_CLASS_TINY
	det_time = 30
	resistance_flags = UNACIDABLE
	embedding = list("embed_chance" = 0, "embedded_fall_chance" = 0)

	force = 15
	throwforce = 25

	var/mob/living/simple_animal/hostile/smartdisc/spawned_item

/obj/item/explosive/grenade/spawnergrenade/smartdisc/throw_at(atom/target, range, speed, thrower, spin, flying)
	..()
	var/mob/user = usr
	if(!active && isyautja(user) && (icon_state == initial(icon_state)))
		boomerang(user)

/obj/item/explosive/grenade/spawnergrenade/smartdisc/proc/boomerang(mob/user)
	var/mob/living/L = find_target(user)
	icon_state = initial(icon_state) + "_active"
	if(L)
		throw_at(L.loc, 4, 6.67, usr)
	throw_at(usr, 12, 4, usr)
	addtimer(CALLBACK(src, PROC_REF(clear_boomerang)), 3 SECONDS)

/obj/item/explosive/grenade/spawnergrenade/smartdisc/proc/clear_boomerang()
	icon_state = initial(icon_state)

/obj/item/explosive/grenade/spawnergrenade/smartdisc/proc/find_target(mob/user)
	var/atom/T = null
	for(var/mob/living/A in listtargets(4))
		if(A == src)
			continue
		if(isliving(A))
			var/mob/living/L = A
			if(L.faction == user.faction)
				continue
			else if(isyautja(L))
				continue
			else if (L.stat == DEAD)
				continue
			else
				T = L
				break
	return T

/obj/item/explosive/grenade/spawnergrenade/smartdisc/proc/listtargets(dist = 3)
	var/list/L = hearers(src, dist)
	return L

/obj/item/explosive/grenade/spawnergrenade/smartdisc/attack_self(mob/user)
	..()

	if(active)
		return

	if(!isyautja(user))
		if(prob(75))
			to_chat(user, span_warning("You fiddle with the disc, but nothing happens. Try again maybe?"))
			return
	to_chat(user, span_warning("You activate the smart-disc and it whirrs to life!"))
	activate(user)
	add_fingerprint(user)
	var/mob/living/carbon/C = user
	if(istype(C) && !C.in_throw_mode)
		C.throw_mode_on()

/obj/item/explosive/grenade/spawnergrenade/smartdisc/activate(mob/user)
	if(active)
		return

	if(user)
		log_attack("[key_name(user)] primed \a [src] in [get_area(user)] ([user.loc.x],[user.loc.y],[user.loc.z]).", user.loc.x, user.loc.y, user.loc.z)

	icon_state = initial(icon_state) + "_active"
	active = 1
	playsound(loc, 'sound/items/countdown.ogg', 25, 1)
	update_icon()
	spawn(det_time)
		prime()
		return

/obj/item/explosive/grenade/spawnergrenade/smartdisc/prime()
	if(spawner_type && deliveryamt)
		// Make a quick flash
		var/turf/T = get_turf(src)
		var/mob/living/simple_animal/hostile/smartdisc/x = new spawner_type
		x.forceMove(T)
		spawned_item = x
		x.spawner_item = src
	return

/obj/item/explosive/grenade/spawnergrenade/smartdisc/throw_impact(atom/hit_atom)
	if(isyautja(hit_atom))
		var/mob/living/carbon/human/H = hit_atom
		if(H.put_in_hands(src))
			hit_atom.visible_message("[hit_atom] expertly catches [src] out of the air.","You catch [src] easily.")
			throwing = FALSE
		return
	..()

/mob/living/simple_animal/hostile/smartdisc
	name = "smart-disc"
	desc = "A furious, whirling array of blades and alien technology."
	icon = 'icons/obj/items/hunter/pred_gear.dmi'
	icon_state = "disc_active"
	icon_living = "disc_active"
	icon_dead = "disc"
	icon_gib = "disc"
	speak_chance = 0
	turns_per_move = 1
	response_help = "stares at the"
	response_disarm = "bats aside the"
	response_harm = "hits the"
	speed = -2
	maxHealth = 60
	health = 60
	attack_same = 0
	density = FALSE
	mob_size = MOB_SIZE_SMALL

	obj_damage = 50
	melee_damage = 15
	harm_intent_damage = 10
	attacktext = "slices"
	attack_sound = 'sound/weapons/bladeslice.ogg'


	faction = FACTION_YAUTJA

	var/obj/item/explosive/grenade/spawnergrenade/smartdisc/spawner_item

	var/lifetime = 8 //About 15 seconds.
	var/time_idle = 0


/mob/living/simple_animal/hostile/smartdisc/Process_Spacemove(check_drift = 0)
	return 1


/mob/living/simple_animal/hostile/smartdisc/bullet_act(obj/projectile/proj)
	. = ..()

	if(prob(60 - proj.damage))
		return 0

	if(!proj || proj.damage <= 0)
		return 0

	apply_damage(proj.damage, BRUTE)
	return 1

/mob/living/simple_animal/hostile/smartdisc/Life()
	. = ..()
	lifetime--
	if(lifetime <= 0 || time_idle > 3)
		visible_message("\The [src] stops whirring and spins out onto the floor.")
		drop_real_disc()
		qdel(src)
		return

/mob/living/simple_animal/hostile/smartdisc/death()
	visible_message("\The [src] stops whirring and spins out onto the floor.")
	drop_real_disc()
	..()
	spawn(1)
		if(src)
			qdel(src)

/mob/living/simple_animal/hostile/smartdisc/proc/drop_real_disc()
	spawner_item.forceMove(loc)
	// don't make GC cry
	spawner_item.spawned_item = null
	spawner_item = null

/mob/living/simple_animal/hostile/smartdisc/gib()
	visible_message("\The [src] explodes!")
	..()
	spawn(1)
		if(src)
			qdel(src)

/mob/living/simple_animal/hostile/smartdisc/FindTarget()
	var/atom/T = null
	stop_automated_movement = 0

	for(var/atom/A in ListTargets(5))
		if(A == src)
			continue

		if(isliving(A))
			var/mob/living/L = A
			if(L.faction == faction)
				continue
			else if(L in friends)
				continue
			else if(isyautja(L))
				continue
			else if (L.stat == DEAD)
				continue
			else
				if(!L.stat)
					T = L
					break
	GiveTarget(T)
	return T

/mob/living/simple_animal/hostile/smartdisc/ListTargets(dist = 7)
	var/list/L = hearers(src, dist)
	return L

/mob/living/simple_animal/hostile/smartdisc/AttackingTarget()
	if(QDELETED(target))  return
	if(!Adjacent(target))  return
	if(isliving(target))
		var/mob/living/L = target
		L.attack_animal(src)
		if(prob(5))
			L.apply_effect(3, WEAKEN)
			L.visible_message(span_danger("\The [src] viciously slashes at \the [L]!"))
			log_attack("[key_name(L)] was knocked down by [src]")
		log_attack("[key_name(L)] was attacked by [src]")
		return L
