/datum/action/predator_action
	action_icon = 'icons/mob/actions.dmi'

/datum/action/predator_action/can_use_action()
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/human/human = owner
	if(!istype(human))
		return FALSE
	if(human.stat || (human.lying_angle && !human.resting && !human.IsSleeping()) || (human.IsParalyzed() || human.IsUnconscious()))
		return FALSE
	return TRUE

/datum/action/predator_action/mask/can_use_action()
	. = ..()
	if(!.)
		return FALSE
	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/mask/gas/yautja/mask = human.wear_mask
	if(!mask)
		return FALSE
	return TRUE

/datum/action/predator_action/mask/zoom
	name = "Toggle Mask Zoom"
	action_icon_state = "zoom"

/datum/action/predator_action/mask/zoom/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/mask/gas/yautja/mask = human.wear_mask
	mask.zoom(owner, 11, 12)

/datum/action/predator_action/mask/togglesight
	name = "Toggle Mask Visors"
	action_icon_state = "eye"

	var/current_mode = 0

/datum/action/predator_action/mask/togglesight/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/mask/gas/yautja/mask = human.wear_mask
	mask.togglesight(owner)
	current_mode = mask.current_goggles
	update_button_icon()

/datum/action/predator_action/mask/togglesight/update_button_icon()
	if(!button)
		return
	button.name = name
	button.desc = desc
	if(action_icon && action_icon_state)
		var/mutable_appearance/action_appearence = visual_references[VREF_MUTABLE_ACTION_STATE]
		if(action_appearence.icon != action_icon || action_appearence.icon_state != "[action_icon_state]_[current_mode]")
			button.cut_overlay(action_appearence)
			action_appearence.icon = action_icon
			// We need to update the reference since it becomes a new appearance for byond internally
			action_appearence.icon_state = "[action_icon_state]_[current_mode]"
			visual_references[VREF_MUTABLE_ACTION_STATE] = action_appearence
			button.add_overlay(action_appearence)
	if(background_icon_state != button.icon_state)
		button.icon_state = background_icon_state
	handle_button_status_visuals()
	return TRUE

/datum/action/predator_action/bracer
	var/power_to_drain = 0

/datum/action/predator_action/bracer/can_use_action()
	. = ..()
	if(!.)
		return FALSE
	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	if(!bracer)
		return FALSE
	if(bracer?.charge < power_to_drain)
		return FALSE
	return TRUE

/datum/action/predator_action/bracer/yank_combistick
	name = "Yank combi-stick"
	action_icon_state = "combistick"

/datum/action/predator_action/bracer/yank_combistick/can_use_action()
	. = ..()
	if(.)
		var/mob/living/carbon/human/human = owner
		var/obj/item/clothing/gloves/yautja/bracer = human.gloves
		if(bracer?.combistick)
			return TRUE
	return FALSE

/datum/action/predator_action/bracer/yank_combistick/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.call_combi_internal(owner)

/datum/action/predator_action/bracer/call_disc
	name = "Call Smart-Disc"
	action_icon_state = "disc"

/datum/action/predator_action/bracer/call_disc/can_use_action()
	. = ..()
	if(.)
		var/mob/living/carbon/human/human = owner
		var/obj/item/clothing/gloves/yautja/bracer = human.gloves
		if(length(bracer?.discs))
			return TRUE
	return FALSE

/datum/action/predator_action/bracer/call_disc/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.call_disc_internal(owner)

/datum/action/predator_action/bracer/translate
	name = "Translator"
	action_icon_state = "translator"

/datum/action/predator_action/bracer/translate/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.translate_internal(owner)

/datum/action/predator_action/bracer/injectors
	name = "Create Stabilising Crystal"
	action_icon_state = "crystal"
	power_to_drain = 1000

/datum/action/predator_action/bracer/injectors/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.injectors_internal(owner, power_to_drain = power_to_drain)

/datum/action/predator_action/bracer/healing_capsule
	name = "Create Healing Capsule"
	action_icon_state = "crystal"
	power_to_drain = 800

/datum/action/predator_action/bracer/healing_capsule/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.healing_capsule_internal(owner, power_to_drain = power_to_drain)

/datum/action/predator_action/bracer/wristblades
	name = "Use Wrist Blades"
	action_icon_state = "blades"
	action_type = ACTION_TOGGLE
	power_to_drain = 50

/datum/action/predator_action/bracer/wristblades/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.wristblades_internal(owner, power_to_drain = power_to_drain)

/datum/action/predator_action/bracer/caster
	name = "Use Plasma Caster"
	action_icon_state = "plasmacannon"
	action_type = ACTION_TOGGLE
	power_to_drain = 50

/datum/action/predator_action/bracer/caster/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.caster_internal(owner)

/datum/action/predator_action/bracer/cloaker
	name = "Toggle Cloaking Device"
	action_icon_state = "cloack"
	action_type = ACTION_TOGGLE

/datum/action/predator_action/bracer/cloaker/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.cloaker_internal(owner)

/datum/action/predator_action/bracer/activate_suicide
	name = "Final Countdown (!)"
	action_icon_state = "selfdestruct"

/datum/action/predator_action/bracer/activate_suicide/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.activate_suicide_internal(owner)

/datum/action/predator_action/bracer/activate_suicide/alternate_action_activate()
	set waitfor = FALSE

	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves

	//Syka blyat, fuck da checker for should not sleep...
	spawn()
		bracer.change_explosion_type(owner)
