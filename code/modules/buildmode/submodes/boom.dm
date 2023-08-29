/datum/buildmode_mode/boom
	key = "boom"

	var/power = 0
	var/fallof = 0
	var/flame = 0


/datum/buildmode_mode/boom/show_help(client/c)
	to_chat(c, span_notice("***********************************************************"))
	to_chat(c, span_notice("Mouse Button on obj  = Kaboom"))
	to_chat(c, span_notice("NOTE: Using the \"Config/Launch Supplypod\" verb allows you to do this in an IC way (ie making a cruise missile come down from the sky and explode wherever you click!)"))
	to_chat(c, span_notice("***********************************************************"))


/datum/buildmode_mode/boom/change_settings(client/c)
	power = input(c, "Power.", text("Input")) as num|null
	fallof = input(c, "Fallof.", text("Input")) as num|null
	flame = input(c, "Flame.", text("Input")) as num|null


/datum/buildmode_mode/boom/handle_click(client/c, params, obj/object)
	var/list/pa = params2list(params)
	var/left_click = pa.Find("left")

	if(left_click)
		SScellauto.explode(object, power, fallof, flame_range = flame, silent = TRUE)
		to_chat(c, span_notice("Success."))
		log_admin("Build Mode: [key_name(c)] caused an explosion(p=[power], f=[fallof], flame=[flame]) at [AREACOORD(object)]")
