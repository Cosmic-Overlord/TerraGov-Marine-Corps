/obj/machinery/vending/weaponsom
	name = "\improper SOM Automated Weapons Rack"
	desc = "A automated weapon rack hooked up to a colossal storage of standard-issue weapons."
	icon_state = "marinerequisitions"
	icon_vend = "marinerequisitions-vend"
	icon_deny = "marinerequisitions-deny"
	faction = FACTION_SOM
	wrenchable = FALSE
	product_ads = "If it moves, it's hostile!;How many enemies have you killed today?;Shoot first, perform autopsy later!;Your ammo is right here.;Guns!;Die, scumbag!;Don't shoot me bro!;Shoot them, bro.;Why not have a donut?"
	isshared = TRUE

	products = list(
		"Rifles" = list(
			/obj/item/weapon/gun/rifle/som = -1,
			/obj/item/ammo_magazine/rifle/som = -1,
			/obj/item/weapon/gun/rifle/mpi_km = -1,
			/obj/item/ammo_magazine/rifle/mpi_km = -1,
			/obj/item/ammo_magazine/rifle/mpi_km/extended = 10,
			/obj/item/weapon/gun/rifle/m16 = -1,
			/obj/item/ammo_magazine/rifle/m16 = -1,
			/obj/item/weapon/gun/rifle/type71 = -1,
			/obj/item/ammo_magazine/rifle/type71 = -1,
		),
		"Energy Weapons" = list(
			/obj/item/cell/lasgun/volkite = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/charger = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/caliver = -1,
			/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/serpenta = -1,
			/obj/item/cell/lasgun/volkite/small = -1,
		),
		"SMGs" = list(
			/obj/item/weapon/gun/smg/som = -1,
			/obj/item/ammo_magazine/smg/som = -1,
			/obj/item/weapon/gun/smg/ppsh = -1,
			/obj/item/ammo_magazine/smg/ppsh = -1,
			/obj/item/ammo_magazine/smg/ppsh/extended = 20,
			/obj/item/weapon/gun/smg/skorpion = -1,
			/obj/item/ammo_magazine/smg/skorpion = -1,
		),
		"Marksman" = list(
			/obj/item/weapon/gun/rifle/sniper/svd = 2,
			/obj/item/ammo_magazine/sniper/svd = -1,
			/obj/item/weapon/gun/shotgun/pump/bolt = -1,
			/obj/item/ammo_magazine/rifle/boltclip = -1,
			/obj/item/weapon/gun/shotgun/double/martini = -1,
			/obj/item/weapon/gun/shotgun/pump/lever/repeater = -1,
			/obj/item/weapon/gun/revolver/standard_revolver/coltrifle = -1,
			/obj/item/ammo_magazine/revolver/rifle = -1,
		),
		"Shotgun" = list(
			/obj/item/weapon/gun/shotgun/double = -1,
			/obj/item/weapon/gun/shotgun/double/sawn = 5,
			/obj/item/weapon/gun/shotgun/som = -1,
			/obj/item/weapon/gun/shotgun/som/burst = 2,
			/obj/item/weapon/gun/shotgun/pump/cmb = -1,
			/obj/item/ammo_magazine/shotgun = -1,
			/obj/item/ammo_magazine/shotgun/buckshot = -1,
			/obj/item/ammo_magazine/shotgun/flechette = -1,
		),
		"Machinegun" = list(
			/obj/item/weapon/gun/rifle/som_mg = -1,
			/obj/item/ammo_magazine/som_mg = -1,
			/obj/item/weapon/gun/rifle/standard_gpmg = -1,
			/obj/item/ammo_magazine/standard_gpmg = -1,
			/obj/item/weapon/gun/standard_mmg = 5,
			/obj/item/ammo_magazine/standard_mmg = -1,
		),
		"Melee" = list(
			/obj/item/weapon/combat_knife = -1,
			/obj/item/attachable/bayonetknife = -1,
			/obj/item/stack/throwing_knife = -1,
			/obj/item/storage/belt/knifepouch = -1,
			/obj/item/storage/holster/blade/machete/full = -1,
			/obj/item/weapon/twohanded/spear/tactical = -1,
			/obj/item/weapon/powerfist = -1,
			/obj/item/weapon/shield/riot/marine/som = 6,
			/obj/item/weapon/shield/riot/marine/deployable = 6,
		),
		"Sidearm" = list(
			/obj/item/weapon/gun/pistol/som = -1,
			/obj/item/ammo_magazine/pistol/som = -1,
			/obj/item/ammo_magazine/pistol/som/extended = 10,
			/obj/item/weapon/gun/pistol/heavy = -1,
			/obj/item/ammo_magazine/pistol/heavy = -1,
			/obj/item/weapon/gun/pistol/standard_pocketpistol = -1,
			/obj/item/ammo_magazine/pistol/standard_pocketpistol = -1,
			/obj/item/weapon/gun/revolver/single_action/m44 = -1,
			/obj/item/weapon/gun/revolver/upp = 5,
			/obj/item/ammo_magazine/revolver/upp = -1,
			/obj/item/weapon/gun/pistol/plasma_pistol = -1,
			/obj/item/ammo_magazine/pistol/plasma_pistol = -1,
		),
		"Grenades" = list(
			/obj/item/explosive/grenade/stick = 600,
			/obj/item/explosive/grenade/m15 = 30,
			/obj/item/explosive/grenade/incendiary/molotov = 50,
			/obj/item/explosive/grenade/smokebomb = 25,
			/obj/item/explosive/grenade/smokebomb/cloak = 25,
			/obj/item/storage/box/m94 = 200,
		),
		"Specialized" = list(
			/obj/item/weapon/gun/flamer/som = 4,
			/obj/item/ammo_magazine/flamer_tank/large/som = 10,
			/obj/item/ammo_magazine/flamer_tank/backtank = 4,
			/obj/item/jetpack_marine = 3,
		),
		"Attachments" = list(
			/obj/item/attachable/bayonet = -1,
			/obj/item/attachable/compensator = -1,
			/obj/item/attachable/extended_barrel = -1,
			/obj/item/attachable/suppressor = -1,
			/obj/item/attachable/heavy_barrel = -1,
			/obj/item/attachable/lace = -1,
			/obj/item/attachable/flashlight = -1,
			/obj/item/attachable/flashlight/under = -1,
			/obj/item/attachable/magnetic_harness = -1,
			/obj/item/attachable/reddot = -1,
			/obj/item/attachable/motiondetector = -1,
			/obj/item/attachable/scope/marine = -1,
			/obj/item/attachable/scope/mini = -1,
			/obj/item/attachable/angledgrip = -1,
			/obj/item/attachable/verticalgrip = -1,
			/obj/item/attachable/foldable/bipod = -1,
			/obj/item/attachable/gyro = -1,
			/obj/item/attachable/lasersight = -1,
			/obj/item/attachable/burstfire_assembly = -1,
			/obj/item/weapon/gun/shotgun/combat/masterkey = -1,
			/obj/item/weapon/gun/grenade_launcher/underslung = -1,
			/obj/item/weapon/gun/flamer/mini_flamer = -1,
			/obj/item/ammo_magazine/flamer_tank/mini = -1,
			/obj/item/attachable/flamer_nozzle = -1,
			/obj/item/attachable/flamer_nozzle/wide = -1,
			/obj/item/attachable/flamer_nozzle/long = -1,
		),
		"Boxes" = list(
			/obj/item/ammo_magazine/rifle/bolt = -1,
			/obj/item/ammo_magazine/packet/p9mm = -1,
			/obj/item/ammo_magazine/packet/p9mmap = -1,
			/obj/item/ammo_magazine/packet/long_special = -1,
			/obj/item/ammo_magazine/packet/magnum = -1,
			/obj/item/ammo_magazine/packet/p4570 = -1,
			/obj/item/ammo_magazine/packet/p10x20mm = -1,
			/obj/item/ammo_magazine/packet/p10x24mm = -1,
			/obj/item/ammo_magazine/packet/p10x26mm = -1,
			/obj/item/ammo_magazine/packet/p10x27mm = -1,
			/obj/item/ammo_magazine/rifle/martini = -1,
			/obj/item/storage/box/visual/magazine = -1,
			/obj/item/storage/box/visual/grenade = -1,
		),
		"Utility" = list(
			/obj/item/flashlight/combat = -1,
			/obj/item/weapon/gun/grenade_launcher/single_shot/flare/marine = -1,
			/obj/item/tool/shovel/etool = -1,
			/obj/item/tool/extinguisher = -1,
			/obj/item/tool/extinguisher/mini = -1,
			/obj/item/assembly/signaler = -1,
			/obj/item/binoculars = -1,
			/obj/item/compass = -1,
			/obj/item/tool/hand_labeler = -1,
		),
	)

/obj/machinery/vending/armor_supply/som
	name = "\improper SOM Armor Equipment Vendor"
	desc = "Am automated equipment rack hooked up to a colossal storage of armor and accessories. Nanotrasen designed a new vendor that utilize bluespace technology to send surplus equipment from outer colonies' sweatshops to your hands! Be grateful."
	icon_state = "surplus_armor"
	icon_vend = "surplus-vend"
	icon_deny = "surplus_armor-deny"
	isshared = TRUE
	faction = FACTION_SOM
	product_ads = "If it moves, it's hostile!;How many enemies have you killed today?;Shoot first, perform autopsy later!;Your ammo is right here.;Guns!;Die, scumbag!;Don't shoot me bro!;Shoot them, bro.;Why not have a donut?"
	products = list(
		"Armors" = list(
			/obj/item/clothing/suit/modular/som/light = -1,
			/obj/item/clothing/suit/modular/som = -1,
			/obj/item/clothing/suit/modular/som/heavy = -1,
			/obj/item/clothing/head/modular/som = -1,
			/obj/item/clothing/suit/storage/marine/harness/cowboy = -1,
			/obj/item/clothing/suit/storage/marine/cowboy = -1,
			/obj/item/facepaint/green = -1,
			/obj/item/facepaint/brown = -1,
			/obj/item/facepaint/black = -1,
			/obj/item/facepaint/sniper = -1,
		),
		"Armor modules" = list(
			/obj/item/armor_module/storage/general = -1,
			/obj/item/armor_module/storage/engineering = -1,
			/obj/item/armor_module/storage/medical = -1,
			/obj/item/armor_module/storage/injector = -1,
			/obj/item/armor_module/storage/grenade = -1,
			/obj/item/armor_module/module/welding = -1,
			/obj/item/armor_module/module/binoculars = -1,
			/obj/item/armor_module/module/fire_proof/som = -1,
			/obj/item/armor_module/module/tyr_extra_armor/som = -1,
			/obj/item/armor_module/module/tyr_head/som = -1,
			/obj/item/armor_module/module/mimir_environment_protection/som = -1,
			/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/som = -1,
			/obj/item/armor_module/module/better_shoulder_lamp = -1,
			/obj/item/armor_module/module/eshield/som = -1,
		),

	)

	prices = list()


/obj/machinery/marine_selector/clothes/som
	name = "BLUR Automated Closet"
	desc = "An automated closet hooked up to a colossal storage unit of standard-issue uniform and armor."
	icon_state = "marineuniform"
	icon_vend = "marineuniform-vend"
	icon_deny = "marineuniform-deny"
	faction = FACTION_SOM
	vendor_role = /datum/job/som/squad/standard
	use_points = TRUE
	categories = list(
		CAT_STD = 1,
		CAT_GLA = 1,
		CAT_HEL = 1,
		CAT_AMR = 1,
		CAT_BAK = 1,
		CAT_WEB = 1,
		CAT_BEL = 1,
		CAT_POU = 2,
		CAT_SOMMOD = 1,
		CAT_SOMARMMOD = 1,
		CAT_MAS = 1,
	)

/obj/machinery/marine_selector/clothes/som/Initialize()
	. = ..()
	listed_products = GLOB.som_marine_clothes_listed_products

GLOBAL_LIST_INIT(som_marine_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_som = list(CAT_STD, "Standard Kit", 0, "white"),
		/obj/effect/vendor_bundle/som_light = list(CAT_AMR, "SOM scout armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_medium = list(CAT_AMR, "SOM light armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_heavy = list(CAT_AMR, "SOM heavy armor kit", 0, "orange"),
		/obj/item/storage/backpack/satchel/som = list(CAT_BAK, "Satchel", 0, "orange"),
		/obj/item/storage/backpack/marine/standard/som = list(CAT_BAK, "Backpack", 0, "black"),
		/obj/item/armor_module/storage/uniform/black_vest = list(CAT_WEB, "Tactical black vest", 0, "orange"),
		/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Tactical Webbing", 0, "black"),
		/obj/item/armor_module/storage/uniform/holster = list(CAT_WEB, "Shoulder handgun holster", 0, "black"),
		/obj/item/storage/belt/sparepouch/som = list(CAT_BEL, "Utility belt", 0, "black"),
		/obj/item/storage/belt/marine/som = list(CAT_BEL, "Standard ammo belt", 0, "orange"),
		/obj/item/storage/belt/shotgun/som = list(CAT_BEL, "Shotgun ammo belt", 0, "orange"),
		/obj/item/storage/belt/gun/pistol/m4a3/som = list(CAT_BEL, "Pistol belt", 0, "black"),
		/obj/item/storage/belt/gun/revolver/standard_revolver/som = list(CAT_BEL, "Revolver belt", 0, "black"),
		/obj/item/belt_harness = list(CAT_BEL, "Sling harness", 0, "black"),
		/obj/item/armor_module/module/welding = list(CAT_HEL, "Armor welding module", 0, "orange"),
		/obj/item/armor_module/module/binoculars =  list(CAT_HEL, "Armor binoculars module", 0, "orange"),
		/obj/item/armor_module/storage/medical = list(CAT_SOMMOD, "Medical Storage Module", 0, "black"),
		/obj/item/armor_module/storage/injector = list(CAT_SOMMOD, "Injector Storage Module", 0, "black"),
		/obj/item/armor_module/storage/general = list(CAT_SOMMOD, "General Purpose Storage Module", 0, "black"),
		/obj/item/armor_module/storage/engineering = list(CAT_SOMMOD, "Engineering Storage Module", 0, "black"),
		/obj/item/armor_module/storage/grenade = list(CAT_SOMMOD, "Grenade Storage Module", 0, "black"),
		/obj/item/storage/pouch/shotgun/som = list(CAT_POU, "Shotgun shell pouch", 0, "black"),
		/obj/item/storage/pouch/magazine/large/som = list(CAT_POU, "Magazine pouch", 0, "black"),
		/obj/item/storage/pouch/flare/som/full = list(CAT_POU, "Flare pouch", 0, "orange"),
		/obj/item/storage/pouch/medkit/som/firstaid = list(CAT_POU, "First aid pouch", 0,"orange"),
		/obj/item/storage/pouch/medical_injectors/som/firstaid = list(CAT_POU, "Combat injector pouch", 0,"orange"),
		/obj/item/storage/pouch/tools/som/full = list(CAT_POU, "Tool pouch (tools included)", 0,"black"),
		/obj/item/storage/pouch/grenade/som/slightlyfull = list(CAT_POU, "Grenade pouch (grenades included)", 0,"black"),
		/obj/item/storage/pouch/construction/som/full = list(CAT_POU, "Construction pouch (materials included)", 0,"black"),
		/obj/item/storage/pouch/magazine/pistol/large/som = list(CAT_POU, "Pistol magazine pouch", 0,"black"),
		/obj/item/storage/pouch/pistol/som = list(CAT_POU, "Sidearm pouch", 0,"black"),
		/obj/effect/vendor_bundle/mimir/som = list(CAT_SOMARMMOD, "Mithridatius Bio Armor set", 0,"black"),
		/obj/effect/vendor_bundle/tyr/som = list(CAT_SOMARMMOD, "Lorica Armor Reinforcement set", 0,"black"),
		/obj/item/armor_module/module/better_shoulder_lamp = list(CAT_SOMARMMOD, "Baldur light armor module", 0,"black"),
		/obj/item/armor_module/module/eshield/som = list(CAT_SOMARMMOD, "Aegis Energy Dispersion Module", 0 , "black"),
		/obj/item/clothing/mask/gas = list(CAT_MAS, "Transparent gas mask", 0,"black"),
		/obj/item/clothing/mask/breath = list(CAT_MAS, "Breath mask", 0, "black"),
		/obj/item/clothing/mask/rebreather/scarf = list(CAT_MAS, "Heat absorbent coif", 0, "black"),
		/obj/item/clothing/mask/rebreather = list(CAT_MAS, "Rebreather", 0, "black"),
		/obj/item/clothing/mask/bandanna/black = list(CAT_MAS, "Black bandanna", 0,"black"),
		/obj/item/clothing/mask/bandanna/skull = list(CAT_MAS, "Skull bandanna", 0,"black"),
	))


/obj/effect/vendor_bundle/basic_som
	gear_to_spawn = list(
		/obj/item/clothing/under/som,
		/obj/item/clothing/shoes/marine/som/knife,
		/obj/item/storage/box/MRE/som,
	)

/obj/effect/vendor_bundle/som_light
	desc = "A set of light SOM armor, including an armor suit and helmet."
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/som,
		/obj/item/clothing/suit/modular/som/light,
	)

/obj/effect/vendor_bundle/som_medium
	desc = "A set of medium SOM armor, including an armor suit and helmet."
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/som,
		/obj/item/clothing/suit/modular/som,
	)

/obj/effect/vendor_bundle/som_heavy
	desc = "A set of heavy SOM armor, including an armor suit and helmet."
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/som,
		/obj/item/clothing/suit/modular/som,
	)

/obj/machinery/marine_selector/gear/veteran
	name = "BLUR Automated Veteran Equipment Rack"
	desc = "An automated smartgunner equipment rack hooked up to a colossal storage unit."
	icon_state = "smartgunner"
	icon_vend = "smartgunner-vend"
	icon_deny = "smartgunner-deny"
	vendor_role = /datum/job/som/squad/veteran
	req_access = list(ACCESS_SOM_VETPREP)

/obj/machinery/marine_selector/gear/veteran/Initialize()
	. = ..()
	listed_products = GLOB.veteran_gear_listed_products

GLOBAL_LIST_INIT(veteran_gear_listed_products, list(
	/obj/effect/supply_drop/somvet = list(CAT_ESS, "Veteran essential kit", 0, "white"),
	/obj/item/weapon/gun/flamer/som = list(CAT_VETSUP, "V-62 incinerator", 20, "orange"),
	/obj/item/ammo_magazine/flamer_tank/large/som = list(CAT_VETSUP, "flamerthrower tank", 2, "black"),
	/obj/item/ammo_magazine/flamer_tank/backtank = list(CAT_VETSUP, "back fuel tank", 12, "black"),
	/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/culverin = list(CAT_VETSUP, "VX-42 Culverin", 30, "orange"),
	/obj/item/cell/lasgun/volkite/powerpack	= list(CAT_VETSUP, "M-70 Culverin powerpack", 15, "black"),
	/obj/effect/supply_drop/blink_kit = list(CAT_VETSUP, "Blink drive & energy sword kit", 45, "orange"),
	/obj/effect/supply_drop/rpgkit = list(CAT_VETSUP, "V-71 rocket launcher kit", 30, "orange"),
	/obj/item/ammo_magazine/rocket/som/thermobaric = list(CAT_VETSUP, "84mm thermobaric rocket", 3, "black"),
	/obj/item/ammo_magazine/rocket/som = list(CAT_VETSUP, "84mm high-explosive rocket", 2, "black"),
	/obj/item/ammo_magazine/rocket/som/heat = list(CAT_VETSUP, "84mm HEAT rocket", 2, "black"),
	/obj/item/ammo_magazine/rocket/som/light = list(CAT_VETSUP, "84mm light-explosive rocket", 1, "black"),
	/obj/item/ammo_magazine/rocket/som/incendiary = list(CAT_VETSUP, "84mm incendiary rocket", 1, "black"),
	))

/obj/machinery/marine_selector/clothes/som/veteran
	name = "BLUR Automated Veteran Closet"
	req_access = list(ACCESS_SOM_VETPREP)
	vendor_role = /datum/job/som/squad/veteran
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/som/veteran/Initialize()
	. = ..()
	listed_products = GLOB.veteran_clothes_listed_products

GLOBAL_LIST_INIT(veteran_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_smartgunner = list(CAT_STD, "Standard kit", 0, "white"),
		/obj/effect/vendor_bundle/xenonauten_light = list(CAT_AMR, "Xenonauten light armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/xenonauten_medium = list(CAT_AMR, "Xenonauten medium armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/xenonauten_heavy = list(CAT_AMR, "Xenonauten heavy armor kit", 0, "orange"),
		/obj/item/armor_module/storage/uniform/black_vest = list(CAT_WEB, "Tactical black vest", 0, "orange"),
		/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Tactical webbing", 0, "black"),
		/obj/item/armor_module/storage/uniform/holster = list(CAT_WEB, "Shoulder handgun holster", 0, "black"),
		/obj/item/storage/belt/marine/som = list(CAT_BEL, "Standard ammo belt", 0, "orange"),
		/obj/item/storage/belt/shotgun/som = list(CAT_BEL, "Shotgun ammo belt", 0, "orange"),
		/obj/item/storage/belt/gun/pistol/m4a3/som = list(CAT_BEL, "Pistol belt", 0, "black"),
		/obj/item/storage/belt/gun/revolver/standard_revolver/som = list(CAT_BEL, "Revolver belt", 0, "black"),
		/obj/item/storage/belt/sparepouch/som = list(CAT_BEL, "General utility belt", 0, "orange"),
		/obj/item/armor_module/module/welding = list(CAT_HEL, "Jaeger welding module", 0, "orange"),
		/obj/item/armor_module/module/binoculars =  list(CAT_HEL, "Jaeger binoculars module", 0, "orange"),
		/obj/item/armor_module/module/antenna = list(CAT_HEL, "Jaeger Antenna module", 0, "orange"),
		/obj/item/armor_module/storage/medical = list(CAT_SOMMOD, "Medical Storage Module", 0, "black"),
		/obj/item/armor_module/storage/injector = list(CAT_SOMMOD, "Injector Storage Module", 0, "black"),
		/obj/item/armor_module/storage/general = list(CAT_SOMMOD, "General Purpose Storage Module", 0, "black"),
		/obj/item/armor_module/storage/engineering = list(CAT_SOMMOD, "Engineering Storage Module", 0, "black"),
		/obj/item/armor_module/storage/grenade = list(CAT_SOMMOD, "Grenade Storage Module", 0, "black"),
		/obj/item/storage/pouch/shotgun/som = list(CAT_POU, "Shotgun shell pouch", 0, "black"),
		/obj/item/storage/pouch/grenade/som/slightlyfull  = list(CAT_POU, "Grenade pouch (grenades included)", 0,"black"),
		/obj/item/storage/pouch/magazine/large/som = list(CAT_POU, "Magazine pouch", 0, "black"),
		/obj/item/storage/pouch/general/som = list(CAT_POU, "General pouch", 0, "black"),
		/obj/item/storage/pouch/flare/som/full = list(CAT_POU, "Flare pouch", 0, "orange"),
		/obj/item/storage/pouch/medkit/som/firstaid = list(CAT_POU, "First aid pouch", 0,"orange"),
		/obj/item/storage/pouch/medical_injectors/som/firstaid = list(CAT_POU, "Combat injector pouch", 0,"orange"),
		/obj/item/storage/pouch/magazine/pistol/large/som = list(CAT_POU, "Pistol magazine pouch", 0, "black"),
		/obj/item/storage/pouch/pistol/som = list(CAT_POU, "Sidearm pouch", 0, "black"),
		/obj/effect/vendor_bundle/mimir/som = list(CAT_SOMARMMOD, "Mithridatius Bio Armor set", 0,"black"),
		/obj/effect/vendor_bundle/tyr/som = list(CAT_SOMARMMOD, "Lorica Armor Reinforcement set", 0,"black"),
		/obj/item/armor_module/module/better_shoulder_lamp = list(CAT_SOMARMMOD, "Baldur light armor module", 0,"black"),
		/obj/item/armor_module/module/eshield/som = list(CAT_SOMARMMOD, "Aegis Energy Dispersion Module", 0 , "black"),
		/obj/item/clothing/mask/gas = list(CAT_MAS, "Transparent gas mask", 0,"black"),
		/obj/item/clothing/mask/breath = list(CAT_MAS, "Breath mask", 0, "black"),
		/obj/item/clothing/mask/rebreather/scarf = list(CAT_MAS, "Heat absorbent coif", 0, "black"),
		/obj/item/clothing/mask/rebreather = list(CAT_MAS, "Rebreather", 0, "black"),
	))

/obj/machinery/marine_selector/clothes/som/medic
	name = "BLUR Automated Medic Closet"
	req_access = list(ACCESS_SOM_MEDPREP)
	vendor_role = /datum/job/som/squad/medic
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/som/medic/Initialize()
	. = ..()
	listed_products = GLOB.som_medic_clothes_listed_products

GLOBAL_LIST_INIT(som_medic_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_som_medic = list(CAT_STD, "Standard kit", 0, "white"),
		/obj/effect/vendor_bundle/som_light = list(CAT_AMR, "SOM scout armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_medium = list(CAT_AMR, "SOM light armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_heavy = list(CAT_AMR, "SOM heavy armor kit", 0, "orange"),
		/obj/item/storage/backpack/satchel/som = list(CAT_BAK, "Satchel", 0, "orange"),
		/obj/item/storage/backpack/marine/standard/som = list(CAT_BAK, "Backpack", 0, "black"),
		/obj/item/armor_module/storage/uniform/brown_vest = list(CAT_WEB, "Tactical brown vest", 0, "orange"),
		/obj/item/armor_module/storage/uniform/white_vest = list(CAT_WEB, "Medic white vest", 0, "black"),
		/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Tactical webbing", 0, "black"),
		/obj/item/armor_module/storage/uniform/holster = list(CAT_WEB, "Shoulder handgun holster", 0, "black"),
		/obj/item/storage/belt/lifesaver/som/full = list(CAT_BEL, "Lifesaver belt", 0, "orange"),
		/obj/item/storage/belt/rig/medical/som/full = list(CAT_BEL, "Rig belt", 0, "black"),
		/obj/item/storage/belt/hypospraybelt/som/full = list(CAT_BEL, "Hypospray belt", 0, "black"),
		/obj/item/armor_module/module/welding = list(CAT_HEL, "Armor welding module", 0, "orange"),
		/obj/item/armor_module/module/binoculars =  list(CAT_HEL, "Armor binoculars module", 0, "orange"),
		/obj/item/armor_module/storage/medical = list(CAT_SOMMOD, "Medical Storage Module", 0, "black"),
		/obj/item/armor_module/storage/injector = list(CAT_SOMMOD, "Injector Storage Module", 0, "black"),
		/obj/item/armor_module/storage/general = list(CAT_SOMMOD, "General Purpose Storage Module", 0, "black"),
		/obj/item/armor_module/storage/engineering = list(CAT_SOMMOD, "Engineering Storage Module", 0, "black"),
		/obj/item/armor_module/storage/grenade = list(CAT_SOMMOD, "Grenade Storage Module", 0, "black"),
		/obj/item/storage/pouch/medical_injectors/som/medic = list(CAT_POU, "Advanced Autoinjector pouch", 0, "orange"),
		/obj/item/storage/pouch/medkit/som/medic = list(CAT_POU, "Medkit pouch", 0, "orange"),
		/obj/effect/vendor_bundle/mimir/som = list(CAT_SOMARMMOD, "Mithridatius Bio Armor set", 0,"black"),
		/obj/effect/vendor_bundle/tyr/som = list(CAT_SOMARMMOD, "Lorica Armor Reinforcement set", 0,"black"),
		/obj/item/armor_module/module/better_shoulder_lamp = list(CAT_SOMARMMOD, "Baldur light armor module", 0,"black"),
		/obj/item/armor_module/module/eshield/som = list(CAT_SOMARMMOD, "Aegis Energy Dispersion Module", 0 , "black"),
		/obj/item/clothing/mask/gas = list(CAT_MAS, "Transparent gas mask", 0,"black"),
		/obj/item/clothing/mask/breath = list(CAT_MAS, "Breath mask", 0, "black"),
		/obj/item/clothing/mask/rebreather/scarf = list(CAT_MAS, "Heat absorbent coif", 0, "black"),
		/obj/item/clothing/mask/rebreather = list(CAT_MAS, "Rebreather", 0, "black"),
	))

/obj/effect/vendor_bundle/basic_som_medic
	gear_to_spawn = list(
		/obj/item/clothing/under/som/medic,
		/obj/item/clothing/shoes/marine/som/knife,
		/obj/item/storage/box/MRE/som,
	)

/obj/effect/vendor_bundle/tyr/som
	gear_to_spawn = list(
		/obj/item/armor_module/module/tyr_extra_armor/som,
		/obj/item/armor_module/module/tyr_head/som,
	)

/obj/effect/vendor_bundle/mimir/som
	gear_to_spawn = list(
		/obj/item/armor_module/module/mimir_environment_protection/som,
		/obj/item/armor_module/module/mimir_environment_protection/mimir_helmet/som,
	)

/obj/machinery/marine_selector/gear/medic/som
	name = "BLUR Automated Medical Equipment Rack"
	desc = "An automated medic equipment rack hooked up to a colossal storage unit."
	icon_state = "medic"
	icon_vend = "medic-vend"
	icon_deny = "medic-deny"
	vendor_role = /datum/job/som/squad/medic
	req_access = list(ACCESS_SOM_MEDPREP)

/obj/machinery/marine_selector/gear/medic/som/Initialize()
	. = ..()
	listed_products = GLOB.som_medic_gear_listed_products

GLOBAL_LIST_INIT(som_medic_gear_listed_products, list(
		/obj/effect/vendor_bundle/medic = list(CAT_ESS, "Essential Medic Set", 0, "white"),
		/obj/item/storage/pill_bottle/meralyne = list(CAT_MEDSUP, "Meralyne pills", 16, "orange"),
		/obj/item/storage/pill_bottle/dermaline = list(CAT_MEDSUP, "Dermaline pills", 16, "orange"),
		/obj/item/storage/pill_bottle/paracetamol = list(CAT_MEDSUP, "Paracetamol pills", 8, "black"),
		/obj/item/storage/syringe_case/meralyne = list(CAT_MEDSUP, "syringe Case (120u Meralyne)", 16, "black"),
		/obj/item/reagent_containers/hypospray/advanced/meralyne = list(CAT_MEDSUP, "hypospray (60u Meralyne)", 8, "black"), //half the units of the mera case half the price
		/obj/item/storage/syringe_case/dermaline = list(CAT_MEDSUP, "syringe Case (120u Dermaline)", 16, "black"),
		/obj/item/reagent_containers/hypospray/advanced/dermaline = list(CAT_MEDSUP, "hypospray (60u dermaline)", 8, "black"), //half the units of the derm case half the price
		/obj/item/storage/syringe_case/meraderm = list(CAT_MEDSUP, "syringe Case (120u Meraderm)", 16, "orange"),
		/obj/item/reagent_containers/hypospray/advanced/meraderm = list(CAT_MEDSUP, "hypospray (60u Meraderm)", 8, "black"), //half the units of the meraderm case half the price
		/obj/item/storage/syringe_case/nanoblood = list(CAT_MEDSUP, "syringe Case (120u Nanoblood)", 5, "black"),
		/obj/item/reagent_containers/hypospray/advanced/nanoblood = list(CAT_MEDSUP, "hypospray (60u Nanoblood)", 3, "orange"), //bit more than half of the nanoblood case
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = list(CAT_MEDSUP, "Injector (Advanced)", 5, "black"),
		/obj/item/reagent_containers/hypospray/autoinjector/quickclotplus = list(CAT_MEDSUP, "Injector (QuickclotPlus)", 1, "orange"),
		/obj/item/reagent_containers/hypospray/autoinjector/peridaxon_plus = list(CAT_MEDSUP, "Injector (Peridaxon Plus)", 1, "orange"),
		/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = list(CAT_MEDSUP, "Injector (Synaptizine)", 4, "orange"),
		/obj/item/reagent_containers/hypospray/autoinjector/neuraline = list(CAT_MEDSUP, "Injector (Neuraline)", 14, "orange"),
		/obj/item/reagent_containers/hypospray/advanced = list(CAT_MEDSUP, "Hypospray", 2, "orange"),
		/obj/item/reagent_containers/hypospray/advanced/big = list(CAT_MEDSUP, "Big hypospray", 10, "orange"),
		/obj/item/clothing/glasses/hud/medsunglasses = list(CAT_MEDSUP, "Medical HUD sunglasses", 2, "black"),
	))

/obj/machinery/marine_selector/gear/engi

/obj/machinery/marine_selector/clothes/engi

/obj/machinery/marine_selector/gear/leader

/obj/machinery/marine_selector/clothes/leader
