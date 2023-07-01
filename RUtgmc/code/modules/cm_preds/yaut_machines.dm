/obj/structure/machinery/prop/almayer/CICmap/yautja
	name = "hunter globe"
	desc = "A globe designed by the hunters to show them the location of prey across the hunting grounds."
	icon = 'icons/obj/machines/yautja_machines.dmi'
	icon_state = "globe"

/obj/structure/machinery/autolathe/yautja
	name = "yautja autolathe"
	desc = "It produces items using metal and glass."
	icon = 'icons/obj/machines/yautja_machines.dmi'

/obj/structure/machinery/prop/yautja/bubbler
	name = "yautja cauldron"
	desc = "A large, black machine emitting an ominous hum with an attached pot of boiling fluid. Bits of what appears to be leftover lard and balls of hair can be seen floating inside of it."
	icon = 'icons/obj/machines/yautja_machines.dmi'
	icon_state = "vat"
	density = TRUE

/obj/structure/machinery/prop/yautja/bubbler/examine(mob/living/user)
	. = ..()
	if(HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		. += span_notice("You can use this machine to clean the skin off limbs, and turn them into bones for your armor.")
		. += span_notice("You first need to find a limb. Then you use a ceremonial dagger to prepare it.")
		. += span_notice("After preparing the limb, you put it into the cauldron, removing the flesh, leaving you with a bone.")
		. += span_notice("You will then clean and polish the resulting bones with a polishing rag, making it ready to be attached to your armor.")

/obj/structure/machinery/prop/yautja/bubbler/attackby(obj/potential_limb, mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_YAUTJA_TECH))
		to_chat(user, span_notice("You have no idea what this does, and you figure it is not time to find out."))
		return

	if(!istype(potential_limb, /obj/item/limb))
		to_chat(user, span_notice("You cannot put this in [src]."))
		return
	var/obj/item/limb/current_limb = potential_limb

	if(!current_limb.flayed)
		to_chat(user, span_notice("This limb is not ready."))
		return
	icon_state = "vat_boiling"
	to_chat(user, span_warning("You place [current_limb] in and start the cauldron."))
	if(!do_after(user, 15 SECONDS, FALSE, current_limb, BUSY_ICON_HOSTILE, BUSY_ICON_HOSTILE))
		to_chat(user, span_notice("You pull [current_limb] back out of the cauldron."))
		icon_state = initial(icon_state)
		return
	icon_state = initial(icon_state)

	var/obj/item/armor_module/limb/skeleton/new_bone = new current_limb.bone_type(get_turf(src))
	if(istype(new_bone, /obj/item/armor_module/limb/skeleton/head))
		new_bone.desc = span_notice("This skull used to be [current_limb.name].")
	qdel(current_limb)
