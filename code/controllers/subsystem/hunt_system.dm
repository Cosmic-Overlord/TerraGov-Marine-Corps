SUBSYSTEM_DEF(hunting)
	name = "hunting"
	wait = 10 MINUTES
	flags = SS_NO_INIT

	var/list/hunter_datas = list()

/datum/controller/subsystem/hunting/fire(resumed, init_tick_checks)
	for(var/datum/huntdata/data in hunter_datas)
		if(data.dishonored || data.thralled)
			continue
		if(ishuman(data.owner))
			if(isyautja(data.owner))
				continue
			if(istype(data.owner.job,  /datum/job/fallen))
				continue
		else if(isxeno(data.owner))
			var/mob/living/carbon/xenomorph/xeno = data.owner
			if(xeno.hive == XENO_HIVE_FALLEN)
				continue
			var/number_tier = GLOB.tier_as_number[xeno.tier]
			if(number_tier <= 0 || isxenodrone(xeno))
				continue
		else
			continue
		if(data.owner.stat || (!data.honored && data.owner.life_kills_total < 4 && data.owner.life_value > 1)) // Don't make zero kills xeno as target for additional honor or stunned/dead
			continue
		if(!prob(20)) // nah
			continue

		for(var/mob/living/carbon/pred in GLOB.yautja_mob_list)
			if(pred.stat || !pred.hunter_data)
				continue
			if(length(pred.hunter_data.targets) > 4)
				continue
			data.automatic_target = TRUE
			data.targeted = pred
			pred.hunter_data.targets += data
			hunter_datas -= data
			break

/datum/controller/subsystem/hunting/Recover()
	hunter_datas = SShunting.hunter_datas
	return ..()
