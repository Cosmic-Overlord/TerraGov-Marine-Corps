SUBSYSTEM_DEF(hunting)
	name = "hunting"
	wait = 10 MINUTES
	flags = SS_NO_INIT

	var/list/hunter_datas = list()

	var/list/chosen_hunter_datas = list()

/datum/controller/subsystem/hunting/fire(resumed, init_tick_checks)
	for(var/datum/huntdata/data in hunter_datas)
		if(data.dishonored || data.thralled)
			continue
		if((data.owner.stat) || !data.honored && data.owner.life_kills_total < 2 && data.owner.life_value > 1) // Don't make zero kills xeno as target for additional honor or stunned/dead
			continue
		if(!prob(20)) // nah
			continue
		// Not best system, but no UI, and that good!
		yautja_announcement("[data.name] has chosen to be hunted for 10 minutes, additional honor given.")
		data.owner.life_value += 3 // Good opinion, one small skill issue
		hunter_datas -= data
		chosen_hunter_datas += data

	for(var/datum/huntdata/data in chosen_hunter_datas)
		if(!data.owner.stat)
			yautja_announcement("[data.name] additional bonuses losed.")
		else
			yautja_announcement("[data.hunter.real_name] get [data.name], bonus provided.")
		data.owner.life_value -= 3
		hunter_datas += data
		chosen_hunter_datas -= data

/datum/controller/subsystem/hunting/Recover()
	hunter_datas = SShunting.hunter_datas
	chosen_hunter_datas = SShunting.chosen_hunter_datas
	return ..()
