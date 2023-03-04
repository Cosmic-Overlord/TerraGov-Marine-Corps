/obj/machinery/vending/weaponsom
	name = "\improper SOM Automated Weapons Rack"
	desc = "A automated weapon rack hooked up to a colossal storage of standard-issue weapons."
	icon = 'RUtgmc/icons/object/vending.dmi'
	icon_state = "somarmory"
	icon_vend = "somarmory-vend"
	icon_deny = "somarmory-deny"
	faction = FACTION_SOM
	wrenchable = FALSE
	product_ads = "If it moves, it's hostile!;How many enemies have you killed today?;Shoot first, perform autopsy later!;Your ammo is right here.;Guns!;Die, scumbag!;Don't shoot me bro!;Shoot them, bro.;Why not have a donut?"
	isshared = TRUE

	products = list(
		"Rifles" = list(
			/obj/item/weapon/gun/rifle/som = -1,
			/obj/item/ammo_magazine/rifle/som = -1,
			/obj/item/weapon/gun/rifle/mpi_km = -1,
			/obj/item/weapon/gun/rifle/som_carbine = -1,
			/obj/item/ammo_magazine/rifle/mpi_km/carbine = -1,
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
			/obj/item/weapon/gun/shotgun/pump/lever/repeater/raven = -1,
			/obj/item/weapon/gun/revolver/standard_revolver/coltrifle = -1,
			/obj/item/ammo_magazine/revolver/rifle = -1,
			/obj/item/weapon/gun/rifle/garand = -1,
			/obj/item/ammo_magazine/rifle/garand = -1,
		),
		"Shotgun" = list(
			/obj/item/weapon/gun/shotgun/double = -1,
			/obj/item/weapon/gun/shotgun/double/sawn = 5,
			/obj/item/weapon/gun/shotgun/som = -1,
			/obj/item/weapon/gun/shotgun/som/burst = 2,
			/obj/item/weapon/gun/shotgun/pump/trenchgun = -1,
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
			/obj/item/explosive/grenade/som = 600,
			/obj/item/explosive/grenade/m15 = 30,
			/obj/item/explosive/grenade/incendiary/som = 50,
			/obj/item/explosive/grenade/smokebomb = 25,
			/obj/item/explosive/grenade/smokebomb/cloak = 25,
			/obj/item/storage/box/m94 = 200,
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
		),
		"Boxes" = list(
			/obj/item/ammo_magazine/rifle/bolt = -1,
			/obj/item/ammo_magazine/packet/akm = -1,
			/obj/item/ammo_magazine/packet/ppsh = -1,
			/obj/item/ammo_magazine/packet/m16 = -1,
			/obj/item/ammo_magazine/packet/p9mm = -1,
			/obj/item/ammo_magazine/packet/p9mmap = -1,
			/obj/item/ammo_magazine/packet/long_special = -1,
			/obj/item/ammo_magazine/packet/magnum = -1,
			/obj/item/ammo_magazine/packet/p4570 = -1,
			/obj/item/ammo_magazine/packet/deagle = -1,
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

/obj/machinery/vending/MarineMed/som
	icon = 'RUtgmc/icons/object/vending.dmi'
	name = "SoldierMed"
	icon_state = "sommed"
	icon_vend = "sommed-vend"
	icon_deny = "sommed-deny"

/obj/machinery/vending/MarineMed/Blood/som
	name = "MosquitoSting Blood Dispenser"
	desc = "MosquitoSting brand Blood Pack dispensery."
	icon = 'RUtgmc/icons/object/vending.dmi'
	icon_state = "sombloodvendor"
	icon_vend = "sombloodvendor-vend"
	icon_deny = "sombloodvendor-deny"

/obj/machinery/vending/medical/som
	name = "Vey-Med Deluxe"
	desc = "Medical Pharmaceutical dispenser.  Provided by Vey-Medical (TM)."
	icon = 'RUtgmc/icons/object/vending.dmi'
	icon_state = "sombigmed"
	icon_vend = "sombigmed-vend"
	icon_deny = "sombigmed-deny"

/obj/machinery/vending/sovietsoda/som
	icon = 'RUtgmc/icons/object/vending.dmi'
	icon_state = "somsoda"
	icon_deny = "somsoda-deny"

/obj/machinery/vending/armor_supply/som
	name = "\improper SOM Armor Equipment Vendor"
	desc = "Am automated equipment rack hooked up to a colossal storage of armor and accessories. Nanotrasen designed a new vendor that utilize bluespace technology to send surplus equipment from outer colonies' sweatshops to your hands! Be grateful."
	icon = 'RUtgmc/icons/object/vending.dmi'
	faction = FACTION_SOM
	products = list(
		"Standard" = list(
			/obj/item/clothing/under/som = -1,
			/obj/item/clothing/gloves/marine/som = -1,
			/obj/item/clothing/shoes/marine/som/knife = -1,
			/obj/item/armor_module/armor/badge = -1,
			/obj/item/armor_module/armor/cape = -1,
			/obj/item/armor_module/armor/cape/half = -1,
			/obj/item/armor_module/armor/cape/scarf = -1,
			/obj/item/armor_module/armor/cape/short = -1,
		),
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
		"Webbings" = list(
			/obj/item/armor_module/storage/uniform/black_vest = -1,
			/obj/item/armor_module/storage/uniform/brown_vest = -1,
			/obj/item/armor_module/storage/uniform/white_vest = -1,
			/obj/item/armor_module/storage/uniform/webbing = -1,
			/obj/item/armor_module/storage/uniform/holster = -1,
		),
		"Belts" = list(
			/obj/item/storage/belt/marine/som = -1,
			/obj/item/storage/belt/shotgun/som = -1,
			/obj/item/storage/belt/shotgun/martini = -1,
			/obj/item/storage/belt/grenade/som = -1,
			/obj/item/belt_harness = -1,
			/obj/item/storage/belt/sparepouch/som = -1,
			/obj/item/storage/belt/gun/pistol/m4a3/som = -1,
			/obj/item/storage/belt/gun/revolver/standard_revolver/som = -1,
			/obj/item/storage/belt/utility/som/full =-1,
		),
		"Pouches" = list(
			/obj/item/storage/pouch/pistol/som = -1,
			/obj/item/storage/pouch/magazine/large/som = -1,
			/obj/item/storage/pouch/magazine/pistol/large/som = -1,
			/obj/item/storage/pouch/shotgun/som = -1,
			/obj/item/storage/pouch/flare/som/full = -1,
			/obj/item/storage/pouch/grenade/som = -1,
			/obj/item/storage/pouch/medkit/som = -1,
			/obj/item/storage/pouch/medical_injectors/som = -1,
			/obj/item/storage/pouch/construction/som = -1,
			/obj/item/storage/pouch/electronics/som = -1,
			/obj/item/storage/pouch/tools/som/full = -1,
			/obj/item/storage/pouch/general/large/som = -1,
		),
		"Masks" = list(
			/obj/item/clothing/mask/rebreather/scarf = -1,
			/obj/item/clothing/mask/rebreather = -1,
			/obj/item/clothing/mask/breath = -1,
			/obj/item/clothing/mask/gas = -1,
			/obj/item/clothing/mask/breath = -1,
		),
		"Backpacks" = list(
			/obj/item/storage/backpack/marine/standard/som = -1,
			/obj/item/storage/backpack/satchel/som = -1,
		),
		"Instruments" = list(
			/obj/item/instrument/violin = -1,
			/obj/item/instrument/piano_synth = -1,
			/obj/item/instrument/banjo = -1,
			/obj/item/instrument/guitar = -1,
			/obj/item/instrument/glockenspiel = -1,
			/obj/item/instrument/accordion = -1,
			/obj/item/instrument/trumpet = -1,
			/obj/item/instrument/saxophone = -1,
			/obj/item/instrument/trombone = -1,
			/obj/item/instrument/recorder = -1,
			/obj/item/instrument/harmonica = -1,
		),
	)

	prices = list()


/obj/machinery/marine_selector/clothes/som
	name = "NDRP Automated Closet"
	desc = "An automated closet hooked up to a colossal storage unit of standard-issue uniform and armor."
	icon = 'RUtgmc/icons/object/vending.dmi'
	icon_state = "marineuniform"
	icon_vend = "marineuniform-vend"
	icon_deny = "marineuniform-deny"
	faction = FACTION_SOM
	vendor_role = /datum/job/som/squad/standard
	req_access = list(ACCESS_SOM_PREP)
	use_points = TRUE
	categories = list(
		CAT_SOMSTD = 1,
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
	listed_products = GLOB.som_marine_clothes_listed_products + GLOB.som_marine_gear_listed_products

GLOBAL_LIST_INIT(som_marine_gear_listed_products, list())

GLOBAL_LIST_INIT(som_marine_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_som = list(CAT_SOMSTD, "Standard Kit", 0, "white"),
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
	faction = FACTION_SOM
	vendor_role = /datum/job/som/squad/veteran

/obj/machinery/marine_selector/gear/veteran/Initialize()
	. = ..()
	listed_products = GLOB.veteran_gear_listed_products

GLOBAL_LIST_INIT(veteran_gear_listed_products, list(
	/obj/effect/supply_drop/somvet = list(CAT_ESS, "Veteran essential kit", 0, "white"),
	/obj/item/weapon/gun/flamer/som = list(CAT_VETSUP, "V-62 incinerator", 20, "orange"),
	/obj/item/ammo_magazine/flamer_tank/large/som = list(CAT_VETSUP, "flamerthrower tank", 2, "black"),
	/obj/item/ammo_magazine/flamer_tank/backtank = list(CAT_VETSUP, "back fuel tank", 11, "black"),
	/obj/item/ammo_magazine/flamer_tank/backtank/X = list(CAT_VETSUP, "back napalm fuel tank", 15, "black"),
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
	name = "NDRP Automated Veteran Closet"
	req_access = list(ACCESS_SOM_VETPREP)
	vendor_role = /datum/job/som/squad/veteran
	gives_webbing = FALSE
	faction = FACTION_SOM

/obj/machinery/marine_selector/clothes/som/veteran/Initialize()
	. = ..()
	listed_products = GLOB.veteran_clothes_listed_products

GLOBAL_LIST_INIT(veteran_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_veteran = list(CAT_SOMSTD, "Standard kit", 0, "white"),
		/obj/effect/vendor_bundle/som_light = list(CAT_AMR, "SOM scout armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_medium = list(CAT_AMR, "SOM light armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_heavy = list(CAT_AMR, "SOM heavy armor kit", 0, "orange"),
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

/obj/effect/vendor_bundle/basic_veteran
	gear_to_spawn = list(
		/obj/item/clothing/under/som/veteran,
		/obj/item/clothing/shoes/marine/som/knife,
		/obj/item/storage/box/MRE/som,
	)
/obj/machinery/marine_selector/clothes/som/medic
	name = "NDRP Automated Medic Closet"
	req_access = list(ACCESS_SOM_MEDPREP)
	vendor_role = /datum/job/som/squad/medic
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/som/medic/Initialize()
	. = ..()
	listed_products = GLOB.som_medic_clothes_listed_products

GLOBAL_LIST_INIT(som_medic_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_som_medic = list(CAT_SOMSTD, "Standard kit", 0, "white"),
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
	req_access = list(ACCESS_SOM_MEDPREP)
	vendor_role = /datum/job/som/squad/medic
	faction = FACTION_SOM

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

/obj/machinery/marine_selector/gear/engi/som
	name = "BLUR Automated Engineer Equipment Rack"
	desc = "An automated engineer equipment rack hooked up to a colossal storage unit."
	icon_state = "engineer"
	icon_vend = "engineer-vend"
	icon_deny = "engineer-deny"
	req_access = list(ACCESS_SOM_ENGPREP)
	faction = FACTION_SOM
	vendor_role = /datum/job/som/squad/engineer

/obj/machinery/marine_selector/gear/engi/som/Initialize()
	. = ..()
	listed_products = GLOB.som_engineer_gear_listed_products

GLOBAL_LIST_INIT(som_engineer_gear_listed_products, list(
		/obj/effect/vendor_bundle/engi/som = list(CAT_ESS, "Essential Engineer Set", 0, "white"),
		/obj/item/stack/sheet/metal/small_stack = list(CAT_ENGSUP, "Metal x10", METAL_PRICE_IN_GEAR_VENDOR, "orange"),
		/obj/item/stack/sheet/plasteel/small_stack = list(CAT_ENGSUP, "Plasteel x10", PLASTEEL_PRICE_IN_GEAR_VENDOR, "orange"),
		/obj/item/stack/sandbags_empty/half = list(CAT_ENGSUP, "Sandbags x25", SANDBAG_PRICE_IN_GEAR_VENDOR, "orange"),
		/obj/item/weapon/shield/riot/marine/deployable = list(CAT_ENGSUP, "TL-182 deployable shield", 3, "orange"),
		/obj/item/tool/weldingtool/hugetank = list(CAT_ENGSUP, "High-capacity industrial blowtorch", 5, "black"),
		/obj/item/clothing/glasses/welding/superior = list(CAT_ENGSUP, "Superior welding goggles", 2, "black"),
		/obj/item/armor_module/module/welding/superior = list(CAT_ENGSUP, "Superior welding module", 2, "black"),
		/obj/item/tool/pickaxe/plasmacutter = list(CAT_ENGSUP, "Plasma cutter", 20, "black"),
		/obj/item/explosive/plastique = list(CAT_ENGSUP, "Plastique explosive", 2, "black"),
		/obj/item/detpack = list(CAT_ENGSUP, "Detonation pack", 5, "black"),
		/obj/item/weapon/gun/energy/lasgun/lasrifle/volkite/cope = list(CAT_ENGSUP, "COPE point defense sentry kit", 40, "black"),
		/obj/structure/closet/crate/uav_crate = list(CAT_ENGSUP, "Iguana Unmanned Vehicle", 50, "black"),
		/obj/item/attachable/buildasentry = list(CAT_ENGSUP, "Build-A-Sentry Attachment", 30, "black"),
		/obj/item/binoculars/tactical/range = list(CAT_ENGSUP, "Range Finder", 10, "black"),
		/obj/item/ai_target_beacon = list(CAT_ENGSUP, "AI remote targeting module", 10, "black"),
		/obj/item/tool/handheld_charger = list(CAT_ENGSUP, "Hand-held cell charger", 3, "black"),
		/obj/item/cell/high = list(CAT_ENGSUP, "High capacity powercell", 1, "black"),
		/obj/item/cell/rtg/small = list(CAT_ENGSUP, "Recharger powercell", 5, "black"),
		/obj/item/cell/rtg/large = list(CAT_ENGSUP, "Large recharger powercell", 15, "black"),
		/obj/effect/teleporter_linker = list(CAT_ENGSUP, "Teleporters", 25, "black"),
		/obj/item/storage/box/explosive_mines = list(CAT_ENGSUP, "M20 mine box", 18, "black"),
		/obj/item/storage/box/explosive_mines/large = list(CAT_ENGSUP, "Large M20 mine box", 35, "black"),
		/obj/item/minelayer = list(CAT_ENGSUP, "M21 APRDS \"Minelayer\"", 5, "black"),
		/obj/item/minerupgrade/overclock = list(CAT_ENGSUP, "Mining well overclock upgrade", 4, "black"),
		/obj/item/minerupgrade/reinforcement = list(CAT_ENGSUP, "Mining well reinforcement upgrade", 4, "black"),
		/obj/item/storage/pouch/explosive/razorburn = list(CAT_ENGSUP, "Pack of Razorburn grenades", 11, "orange"),
		/obj/item/explosive/grenade/chem_grenade/razorburn_large = list(CAT_ENGSUP, "Razorburn canister", 7, "black"),
		/obj/item/explosive/grenade/chem_grenade/razorburn_smol = list(CAT_ENGSUP, "Razorburn grenade", 3, "black"),
	))

/obj/effect/vendor_bundle/engi/som
	gear_to_spawn = list(
		/obj/item/explosive/plastique,
		/obj/item/explosive/grenade/chem_grenade/razorburn_smol,
		/obj/item/clothing/gloves/marine/som/insulated,
		/obj/item/cell/high,
		/obj/item/lightreplacer,
		/obj/item/circuitboard/apc,
	)

/obj/machinery/marine_selector/clothes/som/engi
	name = "NDRP Automated Engineer Closet"
	vendor_role = /datum/job/som/squad/engineer
	req_access = list(ACCESS_SOM_ENGPREP)
	gives_webbing = FALSE

/obj/machinery/marine_selector/clothes/som/engi/Initialize()
	. = ..()
	listed_products = GLOB.som_engineer_clothes_listed_products

GLOBAL_LIST_INIT(som_engineer_clothes_listed_products, list(
		/obj/effect/vendor_bundle/basic_som = list(CAT_SOMSTD, "Standard kit", 0, "white"),
		/obj/item/clothing/glasses/welding = list(CAT_GLA, "Welding Goggles", 0, "white"),
		/obj/item/clothing/glasses/meson = list(CAT_GLA, "Optical Meson Scanner", 0, "white"),
		/obj/effect/vendor_bundle/som_light = list(CAT_AMR, "SOM scout armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_medium = list(CAT_AMR, "SOM light armor kit", 0, "orange"),
		/obj/effect/vendor_bundle/som_heavy = list(CAT_AMR, "SOM heavy armor kit", 0, "orange"),
		/obj/item/storage/backpack/satchel/som = list(CAT_BAK, "Satchel", 0, "orange"),
		/obj/item/storage/backpack/marine/standard/som = list(CAT_BAK, "Backpack", 0, "black"),
		/obj/item/storage/holster/blade/machete/full = list(CAT_BAK, "Machete scabbard", 0, "black"),
		/obj/item/storage/backpack/dispenser = list(CAT_BAK, "Dispenser", 0, "black"),
		/obj/item/armor_module/storage/uniform/brown_vest = list(CAT_WEB, "Tactical brown vest", 0, "orange"),
		/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Tactical webbing", 0, "black"),
		/obj/item/armor_module/storage/uniform/holster = list(CAT_WEB, "Shoulder handgun holster", 0, "black"),
		/obj/item/storage/belt/utility/som/full = list(CAT_BEL, "Tool belt", 0, "white"),
		/obj/item/armor_module/module/welding = list(CAT_HEL, "Armor welding module", 0, "orange"),
		/obj/item/armor_module/module/binoculars =  list(CAT_HEL, "Armor binoculars module", 0, "orange"),
		/obj/item/armor_module/storage/medical = list(CAT_SOMMOD, "Medical Storage Module", 0, "black"),
		/obj/item/armor_module/storage/injector = list(CAT_SOMMOD, "Injector Storage Module", 0, "black"),
		/obj/item/armor_module/storage/general = list(CAT_SOMMOD, "General Purpose Storage Module", 0, "black"),
		/obj/item/armor_module/storage/engineering = list(CAT_SOMMOD, "Engineering Storage Module", 0, "black"),
		/obj/item/armor_module/storage/grenade = list(CAT_SOMMOD, "Grenade Storage Module", 0, "black"),
		/obj/item/storage/pouch/shotgun/som = list(CAT_POU, "Shotgun shell pouch", 0, "black"),
		/obj/item/storage/pouch/construction/som = list(CAT_POU, "Construction pouch", 0, "orange"),
		/obj/item/storage/pouch/explosive/som = list(CAT_POU, "Explosive pouch", 0, "black"),
		/obj/item/storage/pouch/tools/som/full = list(CAT_POU, "Tools pouch", 0, "black"),
		/obj/item/storage/pouch/grenade/som/slightlyfull = list(CAT_POU, "Grenade pouch (grenades included)", 0,"black"),
		/obj/item/storage/pouch/electronics/som/full = list(CAT_POU, "Electronics pouch", 0, "black"),
		/obj/item/storage/pouch/magazine/large/som = list(CAT_POU, "Magazine pouch", 0, "black"),
		/obj/item/storage/pouch/general/large/som = list(CAT_POU, "Large general pouch", 0, "black"),
		/obj/item/storage/pouch/flare/som/full = list(CAT_POU, "Flare pouch", 0, "black"),
		/obj/item/storage/pouch/medkit/som/firstaid = list(CAT_POU, "First aid pouch", 0, "orange"),
		/obj/item/storage/pouch/medical_injectors/som/firstaid = list(CAT_POU, "Combat injector pouch", 0, "orange"),
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

/obj/machinery/marine_selector/gear/leader/som
	name = "BLUR Automated Squad Leader Equipment Rack"
	desc = "An automated squad leader equipment rack hooked up to a colossal storage unit."
	icon_state = "squadleader"
	icon_vend = "squadleader-vend"
	icon_deny = "squadleader-deny"
	req_access = list(ACCESS_SOM_LEADER)
	vendor_role = /datum/job/som/squad/leader

/obj/machinery/marine_selector/gear/leader/som/Initialize()
	. = ..()
	listed_products = GLOB.som_leader_gear_listed_products

GLOBAL_LIST_INIT(som_leader_gear_listed_products, list(
		/obj/effect/vendor_bundle/leader/som = list(CAT_ESS, "SL Set + Gordon pattern armot kit", 0, "white"),
		/obj/item/whistle = list(CAT_LEDSUP, "Whistle", 5, "black"),
		/obj/item/deployable_camera = list(CAT_LEDSUP, "Deployable Overwatch Camera", 2, "orange"),
		/obj/item/stack/sandbags_empty/half = list(CAT_LEDSUP, "Sandbags x25", SANDBAG_PRICE_IN_GEAR_VENDOR, "black"),
		/obj/item/explosive/plastique = list(CAT_LEDSUP, "Plastique explosive", 2, "black"),
		/obj/item/detpack = list(CAT_LEDSUP, "Detonation pack", 5, "black"),
		/obj/item/assembly/signaler = list(CAT_LEDSUP, "Signaler (for detpacks)", 1, "black"),
		/obj/structure/closet/bodybag/tarp = list(CAT_LEDSUP, "V1 thermal-dampening tarp", 5, "black"),
		/obj/item/explosive/grenade/smokebomb/cloak = list(CAT_LEDSUP, "Cloak grenade", 7, "black"),
		/obj/item/explosive/grenade/incendiary = list(CAT_LEDSUP, "M40 HIDP incendiary grenade", 3, "black"),
		/obj/item/storage/pouch/explosive/razorburn = list(CAT_LEDSUP, "Pack of Razorburn grenades", 24, "orange"),
		/obj/item/explosive/grenade/chem_grenade/razorburn_large = list(CAT_LEDSUP, "Razorburn canister", 21, "black"),
		/obj/item/explosive/grenade/chem_grenade/razorburn_smol = list(CAT_LEDSUP, "Razorburn grenade", 6, "black"),
		/obj/item/storage/firstaid/adv = list(CAT_LEDSUP, "Advanced firstaid kit", 10, "orange"),
		/obj/item/reagent_containers/hypospray/autoinjector/synaptizine = list(CAT_LEDSUP, "Injector (Synaptizine)", 10, "black"),
		/obj/item/reagent_containers/hypospray/autoinjector/combat_advanced = list(CAT_LEDSUP, "Injector (Advanced)", 15, "orange"),
	))

/obj/effect/vendor_bundle/leader/som
	gear_to_spawn = list(
		/obj/item/clothing/head/modular/som/leader,
		/obj/item/clothing/suit/modular/som/heavy/leader/valkalt,
		/obj/item/explosive/plastique,
		/obj/item/compass,
		/obj/item/binoculars/tactical,
		/obj/item/pinpointer,
		/obj/item/clothing/glasses/hud/health,
	)

/obj/machinery/marine_selector/clothes/som/leader
	req_access = list(ACCESS_SOM_LEADER)

/obj/machinery/marine_selector/clothes/synth/som
	name = "R700 Droid Equipper"
	desc = "An automated synthetic equipment vendor hooked up to a modest storage unit."
	icon_state = "synth"
	icon_vend = "synth-vend"
	icon_deny = "synth-deny"
	vendor_role = /datum/job/som/silicon/droid
	lock_flags = JOB_LOCK

/obj/machinery/marine_selector/clothes/synth/Initialize()
	. = ..()
	listed_products = GLOB.som_droid_clothes_listed_products

GLOBAL_LIST_INIT(synthetic_clothes_listed_products, list(
		/obj/effect/vendor_bundle/synth = list(CAT_ESS, "Essential droid set", 0, "white"),
		/obj/item/clothing/glasses/meson = list(CAT_GLA, "Optical Meson Scanner", 0, "white"),
		/obj/item/clothing/under/marine = list(CAT_STD, "TGMC marine uniform", 0, "black"),
		/obj/item/clothing/under/rank/medical/blue = list(CAT_STD, "Medical scrubs (blue)", 0, "black"),
		/obj/item/clothing/under/rank/medical/green = list(CAT_STD, "Medical scrubs (green)", 0, "black"),
		/obj/item/clothing/under/rank/medical/purple = list(CAT_STD, "Medical scrubs (purple)", 0, "black"),
		/obj/item/clothing/under/marine/officer/engi = list(CAT_STD, "Engineering uniform", 0, "black"),
		/obj/item/clothing/under/marine/officer/logistics = list(CAT_STD, "Officer uniform", 0, "black"),
		/obj/item/clothing/under/whites = list(CAT_STD, "TGMC dress uniform", 0, "black"),
		/obj/item/clothing/under/marine/officer/pilot = list(CAT_STD, "Pilot bodysuit", 0, "black"),
		/obj/item/clothing/under/marine/mp = list(CAT_STD, "Military police uniform", 0, "black"),
		/obj/item/clothing/under/marine/officer/warden = list(CAT_STD, "Marine Officer uniform", 0, "black"),
		/obj/item/clothing/under/marine/officer/researcher = list(CAT_STD, "Researcher outfit", 0, "black"),
		/obj/item/clothing/under/rank/chef = list(CAT_STD, "Chef uniform", 0, "black"),
		/obj/item/clothing/under/rank/bartender = list(CAT_STD, "Bartender uniform", 0, "black"),
		/obj/item/clothing/under/rank/chef/altchef = list(CAT_STD, "Red Chef uniform", 0, "black"),
		/obj/item/clothing/under/rank/vice = list(CAT_STD, "Vice Officer's uniform", 0, "black"),
		/obj/item/clothing/under/rank/janitor = list(CAT_STD, "Janitor uniform", 0, "black"),
		/obj/item/clothing/under/rank/det = list(CAT_STD, "Detective uniform", 0, "black"),
		/obj/item/clothing/under/rank/dispatch = list(CAT_STD, "Dispatch uniform", 0, "black"),
		/obj/item/clothing/under/overalls = list(CAT_STD, "Overalls", 0, "black"),
		/obj/item/clothing/under/CM_uniform = list(CAT_STD, "Colonial Marshal uniform", 0, "black"),
		/obj/item/clothing/under/gentlesuit = list(CAT_STD, "Gentleman's Suit", 0, "black"),
		/obj/item/clothing/under/maiddress = list(CAT_STD, "Maid dress", 0, "black"),
		/obj/item/clothing/under/maiduniform = list(CAT_STD, "Maid uniform", 0, "black"),
		/obj/item/clothing/under/sl_suit = list(CAT_STD, "Amish Suit", 0, "black"),
		/obj/item/clothing/under/kilt = list(CAT_STD, "Kilt", 0, "black"),
		/obj/item/clothing/under/waiter = list(CAT_STD, "Waiter's uniform", 0, "black"),
		/obj/item/clothing/suit/modular/xenonauten/pilot = list(CAT_SMR, "M70 flak jacket", 0, "synth-rcmarmstorage"),
		/obj/item/clothing/suit/armor/bulletproof = list(CAT_SMR, "Bulletproof Vest", 0, "synth-armor"),
		/obj/item/clothing/suit/surgical = list(CAT_SMR, "Surgical apron", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/labcoat = list(CAT_SMR, "Labcoat", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/labcoat/researcher = list(CAT_SMR, "Researcher's labcoat", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/hazardvest = list(CAT_SMR, "Orange reflective safety vest", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/hazardvest/lime = list(CAT_SMR, "Lime reflective safety vest", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/hazardvest/blue = list(CAT_SMR, "Blue reflective safety vest", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/CMB = list(CAT_SMR, "CMB Jacket", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/RO = list(CAT_SMR, "TGMC RO Jacket", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/lawyer/bluejacket = list(CAT_SMR, "Blue Jacket", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/lawyer/purpjacket = list(CAT_SMR, "Purple Jacket", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/storage/snow_suit = list(CAT_SMR, "Snowsuit", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/chef = list(CAT_SMR, "Chef's apron", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/wcoat = list(CAT_SMR, "Waistcoat", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/wizrobe/gentlecoat = list(CAT_SMR, "Gentleman's Coat", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/bomber = list(CAT_SMR, "Bomber Jacket", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/security/navyhos = list(CAT_SMR, "Navy HoS Jacket", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/chef/classic = list(CAT_SMR, "Classic Chef vest", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/ianshirt = list(CAT_SMR, "Ian Shirt", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/suspenders = list(CAT_SMR, "Suspenders", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/apron = list(CAT_SMR, "Apron", 0, "synth-cosmetic"),
		/obj/item/clothing/suit/apron/overalls = list(CAT_SMR, "Overalls", 0, "synth-cosmetic"),
		/obj/item/storage/backpack/marine/satchel = list(CAT_BAK, "Satchel", 0, "black"),
		/obj/item/storage/backpack/marine = list(CAT_BAK, "Lightweight IMP backpack", 0, "black"),
		/obj/item/storage/backpack/industrial = list(CAT_BAK, "Industrial backpack", 0, "black"),
		/obj/item/storage/backpack/marine/corpsman = list(CAT_BAK, "TGMC corpsman backpack", 0, "black"),
		/obj/item/storage/backpack/marine/tech = list(CAT_BAK, "TGMC technician backpack", 0, "black"),
		/obj/item/storage/backpack/marine/engineerpack = list(CAT_BAK, "TGMC technician welderpack", 0, "black"),
		/obj/item/storage/backpack/marine/radiopack = list(CAT_BAK, "Radio Pack", 0, "black"),
		/obj/item/storage/backpack/lightpack = list(CAT_BAK, "Lightweight combat pack", 0, "black"),
		/obj/item/storage/backpack/marine/satchel/officer_cloak = list(CAT_BAK, "Officer cloak", 0, "black"),
		/obj/item/storage/backpack/marine/satchel/officer_cloak_blue = list(CAT_BAK, "Officer cloak, blue", 0, "black"),
		/obj/item/armor_module/storage/uniform/webbing = list(CAT_WEB, "Webbing", 0, "black"),
		/obj/item/armor_module/storage/uniform/black_vest = list(CAT_WEB, "Tactical Black Vest", 0, "black"),
		/obj/item/armor_module/storage/uniform/white_vest = list(CAT_WEB, "White medical vest", 0, "black"),
		/obj/item/armor_module/storage/uniform/surgery_webbing = list(CAT_WEB, "White surgical webbing", 0, "black"),
		/obj/item/storage/belt/lifesaver/som/full = list(CAT_BEL, "Lifesaver belt", 0, "orange"),
		/obj/item/storage/belt/rig/medical/som = list(CAT_BEL, "Rig belt", 0, "black"),
		/obj/item/storage/belt/hypospraybelt/som = list(CAT_BEL, "Hypospray belt", 0, "black"),
		/obj/item/storage/belt/sparepouch/som = list(CAT_BEL, "G8 general utility pouch", 0, "synth-attachable"),
		/obj/item/storage/pouch/general/large/som = list(CAT_POU, "General pouch", 0, "black"),
		/obj/item/storage/pouch/tools/som/full = list(CAT_POU, "Tool pouch", 0, "black"),
		/obj/item/storage/pouch/construction/som/full = list(CAT_POU, "Construction pouch", 0, "black"),
		/obj/item/storage/pouch/electronics/som/full = list(CAT_POU, "Electronics pouch", 0, "black"),
		/obj/item/storage/pouch/medkit/som/medic = list(CAT_POU, "Medkit pouch", 0, "black"),
		/obj/item/storage/pouch/surgery = list(CAT_WEB, "White surgical pouch", 0, "black"),
		/obj/item/storage/pouch/flare/som/full = list(CAT_POU, "Flare pouch", 0, "black"),
		/obj/item/storage/pouch/radio = list(CAT_POU, "Radio pouch", 0, "black"),
		/obj/item/clothing/head/welding = list(CAT_SHN, "Welding helmet", 0, "black"),
		/obj/item/clothing/head/surgery/green = list(CAT_SHN, "Surgical cap", 0, "black"),
		/obj/item/clothing/head/boonie = list(CAT_SHN, "Boonie hat", 0, "black"),
		/obj/item/clothing/head/tgmcberet/red = list(CAT_SHN, "MP beret", 0, "black"),
		/obj/item/clothing/head/beret/eng = list(CAT_SHN, "Engineering beret", 0, "black"),
		/obj/item/clothing/head/ushanka = list(CAT_SHN, "Ushanka", 0, "black"),
		/obj/item/clothing/head/beret = list(CAT_SHN, "Beret", 0, "black"),
		/obj/item/clothing/head/beanie = list(CAT_SHN, "Beanie", 0, "black"),
		/obj/item/clothing/head/beret/jan = list(CAT_SHN, "Purple Beret", 0, "black"),
		/obj/item/clothing/head/fez = list(CAT_SHN, "Fez", 0, "black"),
	))

/obj/effect/vendor_bundle/somdroid
	gear_to_spawn = list(
		/obj/item/stack/sheet/plasteel/medium_stack,
		/obj/item/stack/sheet/metal/large_stack,
		/obj/item/tool/weldingtool/hugetank,
		/obj/item/lightreplacer,
		/obj/item/healthanalyzer,
		/obj/item/tool/handheld_charger,
		/obj/item/defibrillator,
		/obj/item/medevac_beacon,
		/obj/item/roller/medevac,
		/obj/item/roller,
		/obj/item/bodybag/cryobag,
		/obj/item/reagent_containers/hypospray/advanced/oxycodone,
		/obj/item/tweezers,
	)
