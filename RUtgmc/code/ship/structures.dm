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

//=====================//
// SEMIOTIC STANDARD  //
//===================//

/obj/structure/sign/alt/safety
	name = "sign"
	icon = 'RUtgmc/icons/objects/semiotic_standard.dmi'
	desc = "A sign denoting Semiotic Standard. The Interstellar Commerce Commission requires that these symbols be placed pretty much everywhere for your safety."
	anchored = TRUE
	opacity = FALSE
	density = FALSE
	directional = FALSE

/obj/structure/sign/alt/safety/Initialize()
	. = ..()
	icon = 'RUtgmc/icons/objects/semiotic_standard.dmi'

/obj/structure/sign/alt/safety/airlock
	name = "airlock semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an airlock."
	icon_state = "airlock"

/obj/structure/sign/alt/safety/ammunition
	name = "ammunition storage semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an ammunition storage."
	icon_state = "ammo"

/obj/structure/sign/alt/safety/analysis_lab
	name = "analysis laboratory semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an analysis laboratory."
	icon_state = "analysislab"

/obj/structure/sign/alt/safety/autodoc
	name = "autodoc semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an autodoc."
	icon_state = "autodoc"

/obj/structure/sign/alt/safety/autoopenclose
	name = "automatic opener/closer semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an automatic shutoff valve."
	icon_state = "autoopenclose"

/obj/structure/sign/alt/safety/bathmens
	name = "men's bathroom semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a men's bathroom."
	icon_state = "bathmens"

/obj/structure/sign/alt/safety/bathunisex
	name = "unisex bathroom semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a unisex bathroom."
	icon_state = "bathunisex"

/obj/structure/sign/alt/safety/bathwomens
	name = "women's bathroom semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a women's bathroom."
	icon_state = "bathwomens"

/obj/structure/sign/alt/safety/biohazard
	name = "biohazard semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a biohazard."
	icon_state = "biohazard"

/obj/structure/sign/alt/safety/biolab
	name = "biological laboratory semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a biological laboratory."
	icon_state = "biolab"

/obj/structure/sign/alt/safety/bridge
	name = "bridge semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a starship's bridge."
	icon_state = "bridge"

/obj/structure/sign/alt/safety/bulkhead_door
	name = "bulkhead door semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a bulkhead door."
	icon_state = "bulkheaddoor"

/obj/structure/sign/alt/safety/chem_lab
	name = "chemical laboratory semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a chemical laboratory."
	icon_state = "chemlab"

/obj/structure/sign/alt/safety/coffee
	name = "coffee semiotic"
	desc = "Semiotic Standard denoting the nearby presence of coffee: the lifeblood of any starship crew."
	icon_state = "coffee"

/obj/structure/sign/alt/safety/commline_connection
	name = "point of connection for a communication line semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a comm line connection."
	icon_state = "commlineconnection"

/obj/structure/sign/alt/safety/conference_room
	name = "conference room semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a conference room."
	icon_state = "confroom"

/obj/structure/sign/alt/safety/cryo
	name = "cryogenic vault semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a cryogenics vault."
	icon_state = "cryo"

/obj/structure/sign/alt/safety/debark_lounge
	name = "debarkation lounge semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a debarkation lounge."
	icon_state = "debarkationlounge"

/obj/structure/sign/alt/safety/distribution_pipes
	name = "distribution pipes semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a distribution pipeline."
	icon_state = "distpipe"

/obj/structure/sign/alt/safety/east
	name = "\improper East semiotic"
	desc = "Semiotic Standard denoting the nearby presence of something to the East."
	icon_state = "east"

/obj/structure/sign/alt/safety/electronics
	name = "astronic systems semiotic"
	desc = "Semiotic Standard denoting the nearby presence of astronic systems. That's a fancy way of saying electrical systems."
	icon_state = "astronics"

/obj/structure/sign/alt/safety/elevator
	name = "elevator semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an elevator."
	icon_state = "elevator"

/obj/structure/sign/alt/safety/escapepod
	name = "escape pod semiotic"
	desc = "Semiotic Standard denoting an escape pod."
	icon_state = "escapepod"

/obj/structure/sign/alt/safety/exhaust
	name = "exhaust semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an engine or generator exhaust."
	icon_state = "exhaust"

/obj/structure/sign/alt/safety/fire_haz
	name = "fire hazard semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a fire hazard."
	icon_state = "firehaz"

/obj/structure/sign/alt/safety/firingrange
	name = "firing range semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a live ammunition firing range."
	icon_state = "firingrange"

/obj/structure/sign/alt/safety/food_storage
	name = "organic storage (foodstuffs) semiotic"
	desc = "Semiotic Standard denoting the nearby presence of unrefrigerated food storage."
	icon_state = "foodstorage"

/obj/structure/sign/alt/safety/galley
	name = "galley semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a galley."
	icon_state = "galley"

/obj/structure/sign/alt/safety/hazard
	name = "hazard semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a hazard. Watch out!"
	icon_state = "hazard"

/obj/structure/sign/alt/safety/high_rad
	name = "high radioactivity semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a highly radioactive area."
	icon_state = "highrad"

/obj/structure/sign/alt/safety/high_voltage
	name = "high voltage semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a high voltage electrical current."
	icon_state = "highvoltage"

/obj/structure/sign/alt/safety/hvac
	name = "\improper HVAC semiotic"
	desc = "Semiotic Standard denoting the nearby presence of...an HVAC system. This sign must have been updated to the new standard."
	icon_state = "hvac"

/obj/structure/sign/alt/safety/hvac_old
	name = "\improper HVAC semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an HVAC system. This sign is still using the old standard."
	icon_state = "hvacold"

/obj/structure/sign/alt/safety/intercom
	name = "intercom semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an intercom."
	icon_state = "comm"

/obj/structure/sign/alt/safety/ladder
	name = "ladder semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a ladder."
	icon_state = "ladder"

/obj/structure/sign/alt/safety/laser
	name = "laser semiotic"
	desc = "Semiotic Standard denoting the nearby presence of lasers. It's usually not as cool as it sounds."
	icon_state = "laser"

/obj/structure/sign/alt/safety/life_support
	name = "life support system semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a life support system."
	icon_state = "lifesupport"

/obj/structure/sign/alt/safety/maint
	name = "maintenace semiotic"
	desc = "Semiotic Standard denoting the nearby presence of maintenance access."
	icon_state = "maint"

/obj/structure/sign/alt/safety/manualopenclose
	name = "manual opener/closer semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a manual shutoff valve."
	icon_state = "manualopenclose"

/obj/structure/sign/alt/safety/med_cryo
	name = "medical cryostasis vault semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a medical cryostasis vault."
	icon_state = "medcryo"

/obj/structure/sign/alt/safety/med_life_support
	name = "medical life support semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a life support system for a medbay."
	icon_state = "medlifesupport"

/obj/structure/sign/alt/safety/medical
	name = "medical semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a medbay."
	icon_state = "medical"

/obj/structure/sign/alt/safety/nonpress
	name = "non-pressurized area beyond semiotic"
	desc = "Semiotic Standard denoting that the area beyond isn't pressurized."
	icon_state = "nonpressarea"

/obj/structure/sign/alt/safety/nonpress_ag
	name = "artificial gravity area, non-pressurized, suit required semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an area with artificial gravity lacking in pressurization."
	icon_state = "nonpressag"

/obj/structure/sign/alt/safety/nonpress_0g
	name = "non-pressurized area, no gravity, suit required semiotic"
	desc = "Semiotic Standard denoting that the area beyond isn't pressurized and has no artificial gravity."
	icon_state = "nonpresszerog"

/obj/structure/sign/alt/safety/north
	name = "\improper North semiotic"
	desc = "Semiotic Standard denoting the nearby presence of something to the North."
	icon_state = "north"

/obj/structure/sign/alt/safety/opens_up
	name = "opens upwards semiotic"
	desc = "Semiotic Standard denoting the nearby door opens upwards."
	icon_state = "opensup"

/obj/structure/sign/alt/safety/outpatient
	name = "outpatient clinic semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an outpatient clinic."
	icon_state = "outpatient"

/obj/structure/sign/alt/safety/fibre_optics
	name = "photonics systems (fibre optics) semiotic"
	desc = "Semiotic Standard denoting the nearby presence of fibre optics lines."
	icon_state = "fibreoptic"

/obj/structure/sign/alt/safety/press_area_ag
	name = "pressurized with artificial gravity semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a pressurized area without artificial gravity."
	icon_state = "pressareaag"

/obj/structure/sign/alt/safety/press_area
	name = "pressurized area semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a pressurized area."
	icon_state = "pressarea"

/obj/structure/sign/alt/safety/rad_haz
	name = "radiation hazard semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a radiation hazard."
	icon_state = "radhaz"

/obj/structure/sign/alt/safety/rad_shield
	name = "area shielded from radiation semiotic"
	desc = "Semiotic Standard denoting the nearby presence of an area shielded from radiation."
	icon_state = "radshield"

/obj/structure/sign/alt/safety/radio_rad
	name = "radiation of radio waves semiotic"
	desc = "Semiotic Standard denoting the nearby presence of radiation from a radio tower."
	icon_state = "radiorad"

/obj/structure/sign/alt/safety/reception
	name = "reception semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a reception area."
	icon_state = "reception"

/obj/structure/sign/alt/safety/reduction
	name = "reduction dilation of area semiotic"
	desc = "Semiotic Standard denoting that the area gets smaller ahead."
	icon_state = "reduction"

/obj/structure/sign/alt/safety/ref_bio_storage
	name = "refrigerated biological storage semiotic"
	desc = "Semiotic Standard denoting the nearby presence of refrigerated biological storage."
	icon_state = "refbiostorage"

/obj/structure/sign/alt/safety/ref_chem_storage
	name = "refrigerated chemical storage semiotic"
	desc = "Semiotic Standard denoting the nearby presence of refrigerated chemical storage."
	icon_state = "refchemstorage"

/obj/structure/sign/alt/safety/restrictedarea
	name = "restricted area semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a restricted area."
	icon_state = "restrictedarea"

/obj/structure/sign/alt/safety/fridge
	name = "refrigerated storage (organic foodstuffs) semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a fridge."
	icon_state = "fridge"

/obj/structure/sign/alt/safety/refridgeration
	name = "refrigeration semiotic"
	desc = "Semiotic Standard denoting the nearby presence of non-food refrigeration."
	icon_state = "refridgeration"

/obj/structure/sign/alt/safety/rewire
	name = "rewire system semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a rewire system."
	icon_state = "rewire"

/obj/structure/sign/alt/safety/security
	name = "security semiotic"
	desc = "Semiotic Standard denoting the nearby presence of law enforcement or a security force."
	icon_state = "security"

/obj/structure/sign/alt/safety/south
	name = "\improper South semiotic"
	desc = "Semiotic Standard denoting the nearby presence of something to the South."
	icon_state = "south"

/obj/structure/sign/alt/safety/stairs
	name = "stairs semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a staircase."
	icon_state = "stairs"

/obj/structure/sign/alt/safety/storage
	name = "storage semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a general dry storage room."
	icon_state = "storage"

/obj/structure/sign/alt/safety/suit_storage
	name = "pressure suit locker semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a pressure suit storage locker."
	icon_state = "suitstorage"

/obj/structure/sign/alt/safety/synth_storage
	name = "synthetic storage semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a synthetic unit storage room."
	icon_state = "synthstorage"

/obj/structure/sign/alt/safety/terminal
	name = "computer terminal semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a computer terminal."
	icon_state = "terminal"

/obj/structure/sign/alt/safety/tram
	name = "tram line semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a tram line."
	icon_state = "tramline"

/obj/structure/sign/alt/safety/twilight_zone_terminator
	name = "twilight zone terminator semiotic"
	desc = "Semiotic Standard denoting the nearby presence of a twilight zone terminator. It's way less cool than it sounds."
	icon_state = "twilightzoneterminator"

/obj/structure/sign/alt/safety/water
	name = "water semiotic"
	desc = "Semiotic Standard denoting the nearby presence of water."
	icon_state = "water"

/obj/structure/sign/alt/safety/waterhazard
	name = "water hazard semiotic"
	desc = "Semiotic Standard denoting a water hazard. Keep electronics away."
	icon_state = "waterhaz"

/obj/structure/sign/alt/safety/west
	name = "\improper West semiotic"
	desc = "Semiotic Standard denoting the nearby presence of something to the West."
	icon_state = "west"

/obj/structure/sign/alt/safety/zero_g
	name = "artificial gravity absent semiotic"
	desc = "Semiotic Standard denoting the nearby lack of artificial gravity."
	icon_state = "zerog"

/obj/structure/sign/alt/safety/flightcontrol
	name = "\improper flight control semiotic"
	desc = "Semiotic Standard denoting an area used by or for flight control systems."
	icon_state = "flightcontrol"

/obj/structure/sign/alt/safety/airtraffictower
	name = "\improper air traffic tower semiotic"
	desc = "Semiotic Standard denoting an air traffic tower nearby."
	icon_state = "airtraffictower"

/obj/structure/sign/alt/safety/luggageclaim
	name = "\improper luggage claim semiotic"
	desc = "Semiotic Standard denoting the presecense of a luggage claim area nearby."
	icon_state = "luggageclaim"

/obj/structure/sign/alt/safety/landingzone
	name = "\improper landing zone semiotic"
	desc = "Semiotic Standard denoting the presecense of a landing zone nearby."
	icon_state = "landingzone"

/obj/structure/sign/alt/safety/zero
	name = "zero semiotic"
	desc = "Semiotic Standard denoting the number zero."
	icon_state = "0"

/obj/structure/sign/alt/safety/one
	name = "one semiotic"
	desc = "Semiotic Standard denoting the number one."
	icon_state = "1"

/obj/structure/sign/alt/safety/two
	name = "two semiotic"
	desc = "Semiotic Standard denoting the number two."
	icon_state = "2"

/obj/structure/sign/alt/safety/three
	name = "three semiotic"
	desc = "Semiotic Standard denoting the number three."
	icon_state = "3"

/obj/structure/sign/alt/safety/four
	name = "four semiotic"
	desc = "Semiotic Standard denoting the number four."
	icon_state = "4"

/obj/structure/sign/alt/safety/five
	name = "five semiotic"
	desc = "Semiotic Standard denoting the number five."
	icon_state = "5"

/obj/structure/sign/alt/safety/six
	name = "six semiotic"
	desc = "Semiotic Standard denoting the number six."
	icon_state = "6"

/obj/structure/sign/alt/safety/seven
	name = "seven semiotic"
	desc = "Semiotic Standard denoting the number seven."
	icon_state = "7"

/obj/structure/sign/alt/safety/eight
	name = "eight semiotic"
	desc = "Semiotic Standard denoting the number eight."
	icon_state = "8"

/obj/structure/sign/alt/safety/nine
	name = "nine semiotic"
	desc = "Semiotic Standard denoting the number nine."
	icon_state = "9"

/obj/machinery/light/mainship/floor
	icon = 'RUtgmc/icons/objects/lighting.dmi'
	name = "floor light fixture"
	base_state = "floortube"
	icon_state = "floortube1"
	layer = 2.5
	fitting = "tube"
	brightness = 6
	directional = FALSE
	plane = FLOOR_PLANE
	desc = "A small lighting fixture."
	light_type = /obj/item/light_bulb/tube

