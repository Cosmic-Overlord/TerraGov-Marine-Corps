/datum/action/predator_action
	action_icon = 'icons/mob/actions.dmi'
	background_icon_state = "template_pred"

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

/datum/action/predator_action/pred_buy
	name = "Claim Equipment"
	action_icon_state = "equipment_selection"

/datum/action/predator_action/pred_buy/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	human.pred_buy()

/datum/action/predator_action/mark_for_hunt
	name = "Mark for Hunt"
	action_icon_state = "prey_choice"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_MARK_HUNT,
	)

/datum/action/predator_action/mark_for_hunt/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	human.mark_for_hunt()

/datum/action/predator_action/mark_panel
	name = "Mark Panel"
	action_icon_state = "prey_hunt"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_MARK_PANEL,
	)

/datum/action/predator_action/mark_panel/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	human.mark_panel()

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
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_ZOOM,
	)

/datum/action/predator_action/mask/zoom/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/mask/gas/yautja/mask = human.wear_mask
	mask.zoom(owner, 11, 12)

/datum/action/predator_action/mask/togglesight
	name = "Toggle Mask Visors"
	action_icon_state = "eye"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_TOGGLESIGHT,
	)

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

/datum/action/predator_action/bracer/buy_thrall_gear
	name = "Claim Equipment"
	action_icon_state = "equipment_selection"

/datum/action/predator_action/bracer/buy_thrall_gear/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.buy_thrall_gear(owner)

/datum/action/predator_action/bracer/yank_combistick
	name = "Yank combi-stick"
	action_icon_state = "combistick"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_COMBISTICK,
	)

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
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_SMART_DISC,
	)

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
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_TRANSLATOR,
	)

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
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_CRYSTAL,
	)

/datum/action/predator_action/bracer/injectors/can_use_action()
	. = ..()
	if(.)
		var/mob/living/carbon/human/human = owner
		var/obj/item/clothing/gloves/yautja/bracer = human.gloves
		if(!bracer?.inject_timer)
			return TRUE
	return FALSE

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
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_CAPSULE,
	)

/datum/action/predator_action/bracer/healing_capsulecode/can_use_action()
	. = ..()
	if(.)
		var/mob/living/carbon/human/human = owner
		var/obj/item/clothing/gloves/yautja/bracer = human.gloves
		if(!bracer?.healing_capsule_timer)
			return TRUE
	return FALSE

/datum/action/predator_action/bracer/healing_capsule/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.healing_capsule_internal(owner, power_to_drain = power_to_drain)

/datum/action/predator_action/bracer/wristblades
	name = "Use Wrist Blades"
	action_icon_state = "blades"
	action_type = ACTION_SELECT
	power_to_drain = 50
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_WRISTBLADES,
	)

/datum/action/predator_action/bracer/wristblades/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.wristblades_internal(owner, power_to_drain = power_to_drain)
	set_toggle(bracer.wristblades_deployed)

/datum/action/predator_action/bracer/caster
	name = "Use Plasma Caster"
	action_icon_state = "plasmacannon"
	action_type = ACTION_SELECT
	power_to_drain = 50
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_CASTER,
	)

/datum/action/predator_action/bracer/caster/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.caster_internal(owner)
	set_toggle(bracer.caster_deployed)

/datum/action/predator_action/bracer/cloaker
	name = "Toggle Cloaking Device"
	action_icon_state = "cloack"
	action_type = ACTION_SELECT
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_CLOACK,
	)

/datum/action/predator_action/bracer/cloaker/action_activate()
	if(!can_use_action())
		return FALSE

	var/mob/living/carbon/human/human = owner
	var/obj/item/clothing/gloves/yautja/bracer = human.gloves
	bracer.cloaker_internal(owner)
	set_toggle(bracer.cloaked)

/datum/action/predator_action/bracer/activate_suicide
	name = "Final Countdown (!)"
	action_icon_state = "selfdestruct"
	keybinding_signals = list(
		KEYBINDING_NORMAL = COMSIG_PRED_SD,
		KEYBINDING_ALTERNATE = COMSIG_PRED_SD_MODE,
	)

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

	INVOKE_ASYNC(bracer, TYPE_PROC_REF(/obj/item/clothing/gloves/yautja, change_explosion_type), owner)
