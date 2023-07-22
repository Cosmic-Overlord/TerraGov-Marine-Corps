/datum/reagent/thwei //OP yautja chem
	name = "Thwei"
	description = "A strange, alien liquid."
	reagent_state = LIQUID
	taste_description = "cherry milkshake"
	color = "#C8A5DC" // rgb: 200, 165, 220
	purge_list = list(/datum/reagent/medicine, /datum/reagent/toxin, /datum/reagent/zombium)
	trait_flags = TACHYCARDIC
/*
	properties = list(
		PROPERTY_CROSSMETABOLIZING = 1,
		PROPERTY_ANTITOXIC = 1,
		PROPERTY_YAUTJA_HEMOGENIC = 9,
		PROPERTY_OXYGENATING = 6,
		PROPERTY_ANTICARCINOGENIC = 6,
		PROPERTY_BONEMENDING = 6,
		PROPERTY_AIDING = 1,
		PROPERTY_ANTIHALLUCINOGENIC = 2,
		PROPERTY_FOCUSING = 6,
		PROPERTY_CURING = 4,
	)*/

/datum/reagent/thwei/on_mob_add(mob/living/L, metabolism)
	to_chat(L, span_userdanger("You feel revitalized!"))

/datum/reagent/thwei/on_mob_life(mob/living/L, metabolism)
	. = ..()
	if(!isyautja(L))
		return
	L.blood_volume += 3
	L.hallucination = 0
	L.dizziness = 0
	L.adjustToxLoss(-3)
	L.adjustOxyLoss(-3)
	L.adjustCloneLoss(-3)
	L.adjustBrainLoss(-3)
	L.adjustDrowsyness(-10)
	L.AdjustUnconscious(-40)
	L.AdjustStun(-40)
	L.AdjustParalyzed(-40)
	var/mob/living/carbon/human/yautja/Y = L
	for(var/datum/limb/X in Y.limbs)
		for(var/datum/wound/internal_bleeding/W in X.wounds)
			W.damage = max(0, W.damage - (effect_str))
		if(X.limb_status & (LIMB_BROKEN | LIMB_SPLINTED))
			X.add_limb_flags(LIMB_STABILIZED)
	return ..()

/datum/reagent/thwei/on_mob_delete(mob/living/L, metabolism)
	to_chat(L, span_userdanger("You feel thwei powers wearing off!"))
