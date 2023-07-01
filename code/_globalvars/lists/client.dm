GLOBAL_LIST_EMPTY(classic_keybinding_list_by_key)
GLOBAL_LIST_EMPTY(hotkey_keybinding_list_by_key)
GLOBAL_LIST_EMPTY(keybindings_by_name)
GLOBAL_LIST_EMPTY(keybindings_by_signal)


GLOBAL_LIST_INIT(blacklisted_builds, list(
	"1428" = "bug causing right-click menus to show too many verbs that's been fixed in version 1429",
	"1407" = "bug preventing client display overrides from working leads to clients being able to see things/mobs they shouldn't be able to see",
	"1408" = "bug preventing client display overrides from working leads to clients being able to see things/mobs they shouldn't be able to see",
	"1548" = "ошибка, нарушающая \"альфа\" функциональность в игре, позволяющая клиентам видеть вещи/мобов, которых они не должны видеть",
	))
// This is a mapping from JS keys to Byond - ref: https://keycode.info/
GLOBAL_LIST_INIT(_kbMap, list(
	"UP" = "North",
	"RIGHT" = "East",
	"DOWN" = "South",
	"LEFT" = "West",
	"INSERT" = "Insert",
	"HOME" = "Northwest",
	"PAGEUP" = "Northeast",
	"DEL" = "Delete",
	"END" = "Southwest",
	"PAGEDOWN" = "Southeast",
	"SPACEBAR" = "Space",
	"ALT" = "Alt",
	"SHIFT" = "Shift",
	"CONTROL" = "Ctrl"
	))

GLOBAL_VAR_INIT(roles_whitelist, load_role_whitelist())

/proc/load_role_whitelist(filename = "config/role_whitelist.txt")
	var/L[] = file2list(filename)
	var/P[]
	var/W[] = new //We want a temporary whitelist list, in case we need to reload.

	var/i
	var/r
	var/ckey
	var/role
	for(i in L)
		if(!i) continue
		i = trim(i)
		if(!length(i)) continue
		else if(copytext(i, 1, 2) == "#") continue

		P = splittext(i, "+")
		if(!P.len) continue
		ckey = ckey(P[1]) //Converting their key to canonical form. ckey() does this by stripping all spaces, underscores and converting to lower case.

		role = NONE
		r = 1
		while(++r <= P.len)
			switch(ckey(P[r]))
				if("yautja")
					role |= WHITELIST_YAUTJA
				if("yautjalegacy")
					role |= WHITELIST_YAUTJA_LEGACY
				if("yautjacouncil")
					role |= WHITELIST_YAUTJA_COUNCIL
				if("yautjacouncillegacy")
					role |= WHITELIST_YAUTJA_COUNCIL_LEGACY
				if("yautjaleader")
					role |= WHITELIST_YAUTJA_LEADER

		W[ckey] = role

	return W
