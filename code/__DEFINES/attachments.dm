//Defines to be used as the keys in the attachment_data assoc lists in the attachment_handler component and the attachment element.
#define SLOT "slot"
#define OVERLAY_ICON "overlay_icon"
#define ON_ATTACH "on_attach"
#define ON_DETACH "on_detach"
#define ON_ACTIVATE "on_activate"
#define CAN_ATTACH "can_attach"
#define PIXEL_SHIFT_X "pixel_shift_x"
#define PIXEL_SHIFT_Y "pixel_shift_y"
#define FLAGS_ATTACH_FEATURES "flags_attach_features"
#define ATTACH_DELAY "attach_delay"
#define DETACH_DELAY "detach_delay"
#define ATTACH_SKILL "attach_skill"
#define ATTACH_SKILL_UPPER_THRESHOLD "attach_skill_upper_threshold"
#define ATTACH_SOUND "attach_sound"
#define EXTRA_VARS "extra_vars"
#define MOB_OVERLAY_ICON "mob_overlay_icon"
#define MOB_PIXEL_SHIFT_X "mob_pixel_shift_x"
#define MOB_PIXEL_SHIFT_Y "mob_pixel_shift_y"
#define ATTACHMENT_LAYER "attachment_layer"

//flags_attach_features
#define ATTACH_REMOVABLE (1<<0)
#define ATTACH_ACTIVATION (1<<1)
#define ATTACH_SAME_ICON (1<<2)
#define ATTACH_APPLY_ON_MOB (1<<3)
#define ATTACH_SEPERATE_MOB_OVERLAY (1<<4)
#define ATTACH_NO_HANDS (1<<5)
#define ATTACH_BYPASS_ALLOWED_LIST (1<<6)

//gun attachment slot defines
#define ATTACHMENT_SLOT_RAIL "rail"
#define ATTACHMENT_SLOT_UNDER "under"
#define ATTACHMENT_SLOT_MUZZLE "muzzle"
#define ATTACHMENT_SLOT_STOCK "stock"
#define ATTACHMENT_BARREL_MOD "barrel_mod"
//note: not an attachment but uses the same overlay updating system
#define ATTACHMENT_SLOT_MAGAZINE "mag"

#define ATTACHMENT_SLOT_FLAMER_NOZZLE "flamer_nozzle"

//Jaeger attachment slot defines
#define ATTACHMENT_SLOT_CHESTPLATE "chestplate"
#define ATTACHMENT_SLOT_SHOULDER "shoulder"
#define ATTACHMENT_SLOT_KNEE "knee"
#define ATTACHMENT_SLOT_MODULE "module"
#define ATTACHMENT_SLOT_STORAGE "storage"
#define ATTACHMENT_SLOT_BELT "belt"

//Jaeger helmet slot defines
#define ATTACHMENT_SLOT_HEAD_MODULE "head_module"
#define ATTACHMENT_SLOT_VISOR "visor"


#define ATTACHMENT_SLOT_UNIFORM "uniform"
#define ATTACHMENT_SLOT_UNIFORM_TIE "tie"

#define ACCESSORY_SLOT_ARMOR_C "chest_armor"

#define ACCESSORY_SLOT_ARMOR_A "arm_armor"
#define ACCESSORY_SLOT_ARMOR_L "leg_armor"
#define ACCESSORY_SLOT_ARMOR_S "armor_storage"
#define ACCESSORY_SLOT_ARMOR_M "misc_armor"

#define ATTACHMENT_SLOT_BADGE "badge"
#define ATTACHMENT_SLOT_CAPE "cape"
#define ATTACHMENT_SLOT_CAPE_HIGHLIGHT "cape_highlight"

#define ACCESSORY_SLOT_ARMOR_Y_C "chest_bones"
#define ACCESSORY_SLOT_ARMOR_Y_S "spine_bones"
#define ACCESSORY_SLOT_ARMOR_Y_H "head_bones"
#define ACCESSORY_SLOT_ARMOR_Y_RL "right_leg_bones"
#define ACCESSORY_SLOT_ARMOR_Y_LL "left_leg_bones"
#define ACCESSORY_SLOT_ARMOR_Y_RH "right_hand_bones"
#define ACCESSORY_SLOT_ARMOR_Y_LH "left_hand_bones"
