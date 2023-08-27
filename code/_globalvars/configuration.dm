GLOBAL_REAL(config, /datum/controller/configuration)

GLOBAL_DATUM(revdata, /datum/getrev)

GLOBAL_VAR(host)
GLOBAL_VAR_INIT(game_version, "TGMC")
GLOBAL_VAR_INIT(changelog_hash, "")
GLOBAL_VAR_INIT(hub_visibility, FALSE)


//This was a define, but I changed it to a variable so it can be changed in-game.(kept the all-caps definition because... code...) -Errorage
//Protecting these because the proper way to edit them is with the config/secrets
GLOBAL_VAR_INIT(MAX_EX_DEVESTATION_RANGE, 3)
GLOBAL_PROTECT(MAX_EX_DEVESTATION_RANGE)
GLOBAL_VAR_INIT(MAX_EX_HEAVY_RANGE, 7)
GLOBAL_PROTECT(MAX_EX_HEAVY_RANGE)
GLOBAL_VAR_INIT(MAX_EX_LIGHT_RANGE, 14)
GLOBAL_PROTECT(MAX_EX_LIGHT_RANGE)
GLOBAL_VAR_INIT(MAX_EX_FLASH_RANGE, 14)
GLOBAL_PROTECT(MAX_EX_FLASH_RANGE)
GLOBAL_VAR_INIT(MAX_EX_FLAME_RANGE, 14)
GLOBAL_PROTECT(MAX_EX_FLAME_RANGE)
GLOBAL_VAR_INIT(DYN_EX_SCALE, 0.5)

// What kind of function to use for Explosions falling off.

#define EXPLOSION_FALLOFF_SHAPE_LINEAR   0
#define EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL  1
#define EXPLOSION_FALLOFF_SHAPE_EXPONENTIAL_HALF 2

#define EXPLOSION_MAX_POWER 5000

/// how much it takes to gib a mob
#define EXPLOSION_THRESHOLD_GIB 200
/// prone mobs receive less damage from explosions
#define EXPLOSION_PRONE_MULTIPLIER 0.5

//Explosion damage multipliers for different objects
#define EXPLOSION_DAMAGE_MULTIPLIER_DOOR 15
#define EXPLOSION_DAMAGE_MULTIPLIER_WALL 15
#define EXPLOSION_DAMAGE_MULTIPLIER_WINDOW 10

//Additional explosion damage modifier for open doors
#define EXPLOSION_DAMAGE_MODIFIER_DOOR_OPEN 0.5

//Melee weapons and xenos do more damage to resin structures
#define RESIN_EXPLOSIVE_MULTIPLIER 0.85
