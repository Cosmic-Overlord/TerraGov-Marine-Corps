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
