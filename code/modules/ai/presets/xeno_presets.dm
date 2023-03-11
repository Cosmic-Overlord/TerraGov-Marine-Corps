/mob/living/carbon/xenomorph/beetle/ai

/mob/living/carbon/xenomorph/beetle/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/crusher/ai

/mob/living/carbon/xenomorph/crusher/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/defender/ai

/mob/living/carbon/xenomorph/defender/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/drone/ai

/mob/living/carbon/xenomorph/drone/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/facehugger/ai

/mob/living/carbon/xenomorph/facehugger/ai/Initialize()
	. = ..()
	GLOB.hive_datums[hivenumber].facehuggers -= src
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/facehugger)

/mob/living/carbon/xenomorph/facehugger/clawed/ai

/mob/living/carbon/xenomorph/facehugger/clawed/ai/Initialize()
	. = ..()
	GLOB.hive_datums[hivenumber].facehuggers -= src
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/facehugger)

/mob/living/carbon/xenomorph/facehugger/neuro/ai

/mob/living/carbon/xenomorph/facehugger/neuro/ai/Initialize()
	. = ..()
	GLOB.hive_datums[hivenumber].facehuggers -= src
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/facehugger)

/mob/living/carbon/xenomorph/facehugger/acid/ai

/mob/living/carbon/xenomorph/facehugger/acid/ai/Initialize()
	. = ..()
	GLOB.hive_datums[hivenumber].facehuggers -= src
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/facehugger)

/mob/living/carbon/xenomorph/facehugger/resin/ai

/mob/living/carbon/xenomorph/facehugger/resin/ai/Initialize()
	. = ..()
	GLOB.hive_datums[hivenumber].facehuggers -= src
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/facehugger)

/mob/living/carbon/xenomorph/hivelord/ai

/mob/living/carbon/xenomorph/hivelord/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/hunter/ai

/mob/living/carbon/xenomorph/hunter/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/praetorian/ai

/mob/living/carbon/xenomorph/praetorian/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/queen/ai

/mob/living/carbon/xenomorph/queen/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/mantis/ai

/mob/living/carbon/xenomorph/mantis/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/ravager/ai

/mob/living/carbon/xenomorph/ravager/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/runner/ai

/mob/living/carbon/xenomorph/runner/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/scorpion/ai

/mob/living/carbon/xenomorph/scorpion/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/sentinel/ai

/mob/living/carbon/xenomorph/sentinel/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/spitter/ai

/mob/living/carbon/xenomorph/spitter/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno/ranged)

/mob/living/carbon/xenomorph/warrior/ai

/mob/living/carbon/xenomorph/warrior/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

/mob/living/carbon/xenomorph/boiler/ai

/mob/living/carbon/xenomorph/boiler/ai/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_controller, /datum/ai_behavior/xeno)

