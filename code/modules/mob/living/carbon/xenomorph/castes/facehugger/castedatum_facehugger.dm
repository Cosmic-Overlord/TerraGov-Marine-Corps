/datum/xeno_caste/facehugger
	caste_name = "Facehugger"
	display_name = "Facehugger"
	upgrade_name = "Larval"
	caste_desc = "A fast, flexible creature that wants to hug your head."
	wound_type = ""
	job_type = /datum/job/xenomorph/facehugger
	caste_type_path = /mob/living/carbon/xenomorph/facehugger

	tier = XENO_TIER_MINION
	upgrade = XENO_UPGRADE_BASETYPE

	// *** Melee Attacks *** //
	melee_damage = 5

	// *** Speed *** //
	speed = -1.6

	// *** Plasma *** //
	plasma_max = 100
	plasma_gain = 5

	// *** Health *** //
	max_health = 50
	crit_health = -25
	regen_ramp_amount = 0.01

	// *** Flags *** //
	caste_flags = CASTE_NOT_IN_BIOSCAN|CASTE_DO_NOT_ANNOUNCE_DEATH|CASTE_DO_NOT_ALERT_LOW_LIFE
	can_flags = CASTE_CAN_VENT_CRAWL

	// *** Defense *** //
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)

	// *** Minimap Icon *** //
	minimap_icon = "facehugger"

	//*** Ranged Attack *** //
	charge_type = CHARGE_TYPE_SMALL

	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/xenohide,
		/datum/action/xeno_action/activable/pounce_hugger,
	)

	// *** Vent Crawl Parameters *** //
	vent_enter_speed = LARVA_VENT_CRAWL_TIME
	vent_exit_speed = LARVA_VENT_CRAWL_TIME
	silent_vent_crawl = TRUE

	// *** Caste Overrides *** //
	water_slowdown = 1.6
	snow_slowdown = 0.5


/datum/xeno_caste/facehugger/clawed
	upgrade_name = "Clawed"
	caste_desc = "Covered with thorns, it grew a sharp claw on the tip of his tail"
	upgrade = XENO_UPGRADE_ONE

	// *** Melee Attacks *** //
	attack_delay = 6

	// *** Speed *** //
	speed = -1.8

	// *** Health *** //
	max_health = 40

	// *** Defense *** //
	soft_armor = list(MELEE = 35, BULLET = 5, LASER = 5, ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 0, ACID = 0)

	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/xenohide,
		/datum/action/xeno_action/activable/pounce_hugger/clawed,
	)


/datum/xeno_caste/facehugger/neuro
	upgrade_name = "Neuro"
	caste_desc = "Unhealthy color, it has a single protruding sharp proboscis."
	upgrade = XENO_UPGRADE_TWO


	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/xenohide,
		/datum/action/xeno_action/activable/pounce_hugger/neuro,
	)

/datum/xeno_caste/facehugger/acid
	upgrade_name = "Acid"
	caste_desc = "A barely visible toxic smoke emanates from greenish boils visible all over the body."
	upgrade = XENO_UPGRADE_THREE

	// *** Melee Attacks *** //
	melee_damage = 7.5

	// *** Flags *** //
	caste_flags = CASTE_NOT_IN_BIOSCAN|CASTE_DO_NOT_ANNOUNCE_DEATH|CASTE_DO_NOT_ALERT_LOW_LIFE|CASTE_ACID_BLOOD

	// *** Defense *** //
	soft_armor = list(MELEE = 0, BULLET = 0, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 0, FIRE = 50, ACID = 0)

	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/xenohide,
		/datum/action/xeno_action/activable/pounce_hugger/acid,
	)

/datum/xeno_caste/facehugger/resin
	upgrade_name = "Resin"
	caste_desc = "Abandoning speed, it covered himself with a layer of rubber armor."
	upgrade = XENO_UPGRADE_FOUR

	// *** Speed *** //
	speed = -1.4

	// *** Health *** //
	max_health = 65

	soft_armor = list(MELEE = 20, BULLET = 20, LASER = 10, ENERGY = 10, BOMB = 5, BIO = 0, FIRE = 50, ACID = 0)

	actions = list(
		/datum/action/xeno_action/xeno_resting,
		/datum/action/xeno_action/watch_xeno,
		/datum/action/xeno_action/xenohide,
		/datum/action/xeno_action/activable/pounce_hugger/resin,
	)
