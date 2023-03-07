/obj/structure/bed/chair/comfy/alpha
	icon = 'RUtgmc/icons/objects/furniture.dmi'
	icon_state = "comfychair_alpha"
	name = "Alpha squad chair"
	desc = "A simple chair permanently attached to the floor. Covered with a squeaky and way too hard faux-leather, unevenly painted in Alpha squad red. Only for the bravest and freshest USCM recruits."

/obj/structure/bed/chair/comfy/bravo
	icon = 'RUtgmc/icons/objects/furniture.dmi'
	icon_state = "comfychair_bravo"
	name = "Bravo squad chair"
	desc = "A simple chair permanently attached to the floor. Covered with a squeaky and way too hard faux-leather, unevenly painted in Bravo squad brown. Certified fortified on all sides from enemy incursion."

/obj/structure/bed/chair/comfy/charlie
	icon = 'RUtgmc/icons/objects/furniture.dmi'
	icon_state = "comfychair_charlie"
	name = "Charlie squad chair"
	desc = "A simple chair permanently attached to the floor. Covered with a squeaky and way too hard faux-leather, unevenly painted in Charlie squad purple. Feels out of place without a full breakfast to accompany it."

/obj/structure/bed/chair/comfy/delta
	icon = 'RUtgmc/icons/objects/furniture.dmi'
	icon_state = "comfychair_delta"
	name = "Delta squad chair"
	desc = "A simple chair permanently attached to the floor. Covered with a squeaky and way too hard faux-leather, unevenly painted in Delta squad blue. This chair is most likely to be the first to fight and first to die."

/obj/machinery/camera/alt
	icon = 'RUtgmc/icons/objects/furniture.dmi'

/obj/machinery/camera/alt/autoname
	var/number = 0 //camera number in area

/obj/machinery/camera/alt/Initialize(mapload, newDir)
	. = ..()
	icon_state = "camera"

	if(newDir)
		setDir(newDir)

	switch(dir)
		if(NORTH)
			pixel_y = 0
		if(SOUTH)
			pixel_y = 18
		if(EAST)
			pixel_x = -9
			pixel_y = -5
		if(WEST)
			pixel_x = 9
			pixel_y = -5

	for(var/i in network)
		network -= i
		network += lowertext(i)

	GLOB.cameranet.cameras += src
	GLOB.cameranet.addCamera(src)

	myarea = get_area(src)
	if(myarea)
		LAZYADD(myarea.cameras, src)

	update_icon()

//This camera type automatically sets it's name to whatever the area that it's in is called.
/obj/machinery/camera/alt/autoname/Initialize()
	. =  ..()
	var/static/list/id_by_area = list()
	var/area/A = get_area(src)
	c_tag = "[A.name] #[++id_by_area[A]]"

/obj/machinery/iv_drip/alt
	icon = 'RUtgmc/icons/objects/iv_drip.dmi'

/obj/machinery/iv_drip/alt/update_icon()
	if(src.attached)
		icon_state = "hooked"
	else
		icon_state = ""

	overlays = null

	if(beaker)
		var/datum/reagents/reagents = beaker.reagents
		if(reagents.total_volume)
			var/image/filling = image('RUtgmc/icons/objects/iv_drip.dmi', src, "reagent")

			var/percent = round((reagents.total_volume / beaker.volume) * 100)
			switch(percent)
				if(0 to 9)		filling.icon_state = "reagent0"
				if(10 to 24) 	filling.icon_state = "reagent10"
				if(25 to 49)	filling.icon_state = "reagent25"
				if(50 to 74)	filling.icon_state = "reagent50"
				if(75 to 79)	filling.icon_state = "reagent75"
				if(80 to 90)	filling.icon_state = "reagent80"
				if(91 to INFINITY)	filling.icon_state = "reagent100"

			filling.color = mix_color_from_reagents(reagents.reagent_list)
			overlays += filling

/obj/machinery/optable/alt
	icon = 'RUtgmc/icons/objects/surgery.dmi'

/obj/machinery/sleeper/alt
	icon = 'RUtgmc/icons/objects/Cryogenics2.dmi'

/obj/machinery/bodyscanner/alt
	icon = 'RUtgmc/icons/objects/Cryogenics2.dmi'

/obj/machinery/atmospherics/components/unary/cryo_cell/alt
	icon = 'RUtgmc/icons/objects/cryogenics.dmi'

/obj/machinery/sleep_console/alt
	icon = 'RUtgmc/icons/objects/Cryogenics2.dmi'

/obj/machinery/sleep_console/alt
	icon = 'RUtgmc/icons/objects/Cryogenics2.dmi'

/obj/machinery/body_scanconsole/alt
	icon = 'RUtgmc/icons/objects/Cryogenics2.dmi'

/obj/machinery/bioprinter/alt
	icon = 'RUtgmc/icons/objects/surgery.dmi'

/obj/machinery/bioprinter/alt/stocked
	stored_metal = 1000
	stored_matter = 1000

/obj/item/storage/surgical_tray/alt
	icon = 'RUtgmc/icons/objects/surgery.dmi'

/obj/structure/sink/bathroom/Initialize()
	. = ..()
	switch(dir)
		if(WEST)
			pixel_x = 11
		if(NORTH)
			pixel_y = -9
		if(EAST)
			pixel_x = -11
		if(SOUTH)
			pixel_y = 25

/obj/effect/landmark/start/job/leader/alpha


