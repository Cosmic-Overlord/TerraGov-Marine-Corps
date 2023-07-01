/client
	var/datum/db_query/clan_info

/client/proc/load_player_predator_info()
	set waitfor = FALSE
	if(GLOB.roles_whitelist[ckey] & WHITELIST_PREDATOR)
		clan_info = SSdbcore.NewQuery("SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey", list("byond_ckey" = ckey))
		clan_info.Execute()
		if(!clan_info.NextRow())
			clan_info.sql = "INSERT INTO [format_table_name("clan_player")] (byond_ckey, clan_rank, permissions, clan_id, honor) VALUES (:byond_ckey, 0, 0, 0, 0)"
			clan_info.arguments = list("byond_ckey" = ckey)
			clan_info.Execute()

			clan_info.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey"
			clan_info.arguments = list("byond_ckey" = ckey)
			clan_info.Execute()
			clan_info.NextRow()

		if(GLOB.roles_whitelist[ckey] & WHITELIST_YAUTJA_LEADER)
			clan_info.item[2] = clan_ranks_ordered[CLAN_RANK_ADMIN]
			clan_info.item[3] |= CLAN_PERMISSION_ALL
		else
			clan_info.item[3] &= ~CLAN_PERMISSION_ADMIN_MANAGER // Only the leader can manage the ancients

		clan_info.sql = "UPDATE [format_table_name("clan_player")] clan_rank = :clan_rank, permissions = :permissions WHERE id = :byond_ckey"
		clan_info.arguments = list("byond_ckey" = ckey, "clan_rank" = clan_info.item[2], "permissions" = clan_info.item[3])
		clan_info.Execute()

		clan_info.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey"
		clan_info.arguments = list("byond_ckey" = ckey)
		clan_info.Execute()
		clan_info.NextRow()

/client/proc/usr_create_new_clan()
	set name = "Create New Clan"
	set category = "Debug"

	if(!SSdbcore.IsConnected())
		return

	if(!clan_info)
		return

	if(!(clan_info.item[3] & CLAN_PERMISSION_ADMIN_MANAGER))
		return

	var/input = tgui_input_text(src, "Set name to clan", "Clan Name")

	if(!input)
		return

	to_chat(src, span_notice("Made a new clan called: [input]"))

	create_new_clan(input)

/client/verb/view_clan_info()
	set name = "View Clan Info"
	set category = "OOC.Records"

	INVOKE_ASYNC(src, PROC_REF(usr_view_clan_info))

/client/proc/usr_view_clan_info(clan_id, force_clan_id = FALSE)
	var/clan_to_get

	if(!has_clan_permission(CLAN_PERMISSION_VIEW))
		return

	if(!clan_id && !force_clan_id)
		if(!clan_info)
			to_chat(src, span_warning("You don't have a yautja whitelist!"))
			return

		if(clan_info.item[3] & CLAN_PERMISSION_ADMIN_VIEW)
			var/datum/db_query/db_clans = SSdbcore.NewQuery("SELECT id, name, description, honor, color FROM [format_table_name("clan")]")
			db_clans.Execute()
			var/list/clans = list()
			while(db_clans.NextRow())
				clans += list("[db_clans.item[2]]" = db_clans.item[1])

			qdel(db_clans)

			clans += list("People without clans" = null)

			var/input = tgui_input_list(src, "Choose the clan to view", "View clan", clans)

			if(!input)
				to_chat(src, span_warning("Couldn't find any clans for you to view!"))
				return

			clan_to_get = clans[input]
		else if(clan_info.item[4])

			var/options = list(
				"Your clan" = clan_info.item[4],
				"People without clans" = null
			)

			var/input = tgui_input_list(src, "Choose the clan to view", "View clan", options)

			if(!input)
				return

			clan_to_get = options[input]
		else
			clan_to_get = null
	else
		clan_to_get = clan_id

	var/datum/db_query/clan
	var/datum/db_query/clan_players

	if(clan_to_get)
		clan = SSdbcore.NewQuery("SELECT id, name, description, honor, color FROM [format_table_name("clan")] WHERE id = :clan_id", list("clan_id" = clan_to_get))
		clan.Execute()
		if(!clan.NextRow())
			qdel(clan)

	if(clan)
		clan_players = SSdbcore.NewQuery("SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE clan_id = :clan_id", list("clan_id" = clan.item[1]))
	else
		clan_players = SSdbcore.NewQuery("SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE clan_id IS NULL")

	clan_players.Execute()

	var/list/data

	var/player_rank = clan_info.item[2]

	if(clan_info.item[3] & CLAN_PERMISSION_ADMIN_MANAGER)
		player_rank = 999 // Target anyone except other managers

	if(clan)
		data = list(
			clan_id = clan.item[1],
			clan_name = html_encode(clan.item[2]),
			clan_description = html_encode(clan.item[3]),
			clan_honor = clan.item[4],
			clan_keys = list(),

			player_rank_pos = player_rank,

			player_delete_clan = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MANAGER),
			player_sethonor_clan = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MANAGER),
			player_setcolor_clan = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MODIFY),

			player_rename_clan = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MODIFY),
			player_setdesc_clan = (clan_info.item[3] & CLAN_PERMISSION_MODIFY),
			player_modify_ranks = (clan_info.item[3] & CLAN_PERMISSION_MODIFY),

			player_purge = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MANAGER),
			player_move_clans = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MOVE)
		)
	else
		data = list(
			clan_id = null,
			clan_name = "Players without a clan",
			clan_description = "This is a list of players without a clan",
			clan_honor = null,
			clan_keys = list(),

			player_rank_pos = player_rank,

			player_delete_clan = FALSE,
			player_sethonor_clan = FALSE,
			player_rename_clan = FALSE,
			player_setdesc_clan = FALSE,
			player_modify_ranks = FALSE,

			player_purge = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MANAGER),
			player_move_clans = (clan_info.item[3] & CLAN_PERMISSION_ADMIN_MOVE)
		)

	var/list/clan_members[clan_players.rows.len]

	var/index = 1
	while(clan_players.NextRow())
		var/list/player = list(
			name = clan_players.item[1],
			rank = clan_ranks[clan_players.item[2]], // rank not used here, because we need to get their visual rank, not their position
			rank_pos = clan_players.item[3] & CLAN_PERMISSION_ADMIN_MANAGER ? 999 : clan_players.item[2],
			honor = clan_players.item[5]
		)

		clan_members[index++] = player

	data["clan_keys"] = clan_members

	qdel(clan)
	qdel(clan_players)
/* ПОРТ ЭТОГО ДЕРЬМА В TGUI БЛЯТЬ
	var/datum/nanoui/ui = nanomanager.try_update_ui(mob, mob, "clan_status_ui", null, data)
	if(!ui)
		ui = new(mob, mob, "clan_status_ui", "clan_menu.tmpl", "Clan Menu", 550, 500)
		ui.set_initial_data(data)
		ui.set_auto_update(FALSE)
		ui.open()
*/
/client/proc/has_clan_permission(permission_flag, clan_id, warn)
	if(!clan_info)
		if(warn)
			to_chat(src, "You do not have a yautja whitelist!")
		return FALSE

	if(clan_id)
		if(clan_id != clan_info.item[2])
			if(warn)
				to_chat(src, "You do not have permission to perform actions on this clan!")
			return FALSE


	if(!(clan_info.item[3] & permission_flag))
		if(warn)
			to_chat(src, "You do not have the necessary permissions to perform this action!")
		return FALSE

	return TRUE

/client/proc/add_honor(number)
	if(!clan_info)
		return FALSE

	clan_info.sql = "UPDATE [format_table_name("clan_player")] SET honor += :honor WHERE byond_ckey = :byond_ckey"
	clan_info.arguments = list("byond_ckey" = ckey, "honor" = number)
	clan_info.Execute()

	clan_info.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey"
	clan_info.arguments = list("byond_ckey" = ckey)
	clan_info.Execute()
	clan_info.NextRow()

	if(clan_info.item[2])
		var/datum/db_query/target_clan = SSdbcore.NewQuery("UPDATE [format_table_name("clan")] SET honor += :honor WHERE id = :clan_id", list("clan_id" = clan_info.item[4], "honor" = number))
		target_clan.Execute()
		qdel(target_clan)

	return TRUE

/client/proc/clan_topic(href, href_list)
	set waitfor = FALSE

	if(usr.client != src)
		return

	if(!clan_info)
		return

	clan_info.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey"
	clan_info.arguments = list("byond_ckey" = ckey)
	clan_info.Execute()
	clan_info.NextRow()

	var/datum/db_query/db_query = SSdbcore.NewQuery()
	var/clan_id
	if(href_list[CLAN_HREF])
		db_query.sql = "SELECT id, name, description, honor, color FROM [format_table_name("clan")] WHERE id = :clan_id"
		db_query.arguments = list("clan_id" = href_list[CLAN_HREF])
		db_query.Execute()
		db_query.NextRow()

		clan_id = db_query.item[1]
		switch(href_list[CLAN_ACTION])
			if(CLAN_ACTION_CLAN_RENAME)
				if(!has_clan_permission(CLAN_PERMISSION_ADMIN_MODIFY))
					return

				var/input = input(src, "Input the new name", "Set Name", db_query.item[2]) as text|null

				if(!input || input == db_query.item[2])
					return


				log_admin("[key_name_admin(src)] has set the name of [db_query.item[2]] to [input].")
				to_chat(src, span_notice("Set the name of [db_query.item[2]] to [input]."))

				db_query.sql = "UPDATE [format_table_name("clan")] SET name = :name WHERE id = :clan_id"
				db_query.arguments = list("clan_id" = clan_id, "name" = trim(input))
				db_query.Execute()

			if(CLAN_ACTION_CLAN_SETDESC)
				if(!has_clan_permission(CLAN_PERMISSION_USER_MODIFY))
					return

				var/input = input(usr, "Input a new description", "Set Description", db_query.item[3]) as message|null

				if(!input || input == db_query.item[3])
					return

				log_admin("[key_name_admin(src)] has set the description of [db_query.item[2]].")
				to_chat(src, span_notice("Set the description of [db_query.item[2]]."))

				db_query.sql = "UPDATE [format_table_name("clan")] SET description = :description WHERE id = :clan_id"
				db_query.arguments = list("clan_id" = clan_id, "description" = trim(input))
				db_query.Execute()

			if(CLAN_ACTION_CLAN_SETCOLOR)
				if(!has_clan_permission(CLAN_PERMISSION_ADMIN_MODIFY))
					return

				var/color = input(usr, "Input a new color", "Set Color", db_query.item[5]) as color|null

				if(!color || color == db_query.item[5])
					return

				log_admin("[key_name_admin(src)] has set the color of [db_query.item[2]] to [color].")
				to_chat(src, span_notice("Set the name of [db_query.item[2]] to [color]."))

				db_query.sql = "UPDATE [format_table_name("clan")] SET color = :color WHERE id = :clan_id"
				db_query.arguments = list("clan_id" = clan_id, "color" = color)
				db_query.Execute()

			if(CLAN_ACTION_CLAN_SETHONOR)
				if(!has_clan_permission(CLAN_PERMISSION_ADMIN_MANAGER))
					return

				var/input = tgui_input_number(src, "Input the new honor", "Set Honor", db_query.item[4])

				if((!input && input != 0) || input == db_query.item[4])
					return

				log_admin("[key_name_admin(src)] has set the honor of clan [db_query.item[2]] from [db_query.item[4]] to [input].")
				to_chat(src, span_notice("Set the honor of [db_query.item[2]] from [db_query.item[4]] to [input]."))

				db_query.sql = "UPDATE [format_table_name("clan")] SET honor = :honor WHERE id = :clan_id"
				db_query.arguments = list("clan_id" = clan_id, "honor" = input)
				db_query.Execute()

			if(CLAN_ACTION_CLAN_DELETE)
				if(!has_clan_permission(CLAN_PERMISSION_ADMIN_MANAGER))
					return

				var/input = input(src, "Please input the name of the clan to proceed.", "Delete Clan") as text|null

				if(input != db_query.item[2])
					to_chat(src, "You have decided not to delete [db_query.item[2]].")
					return

				log_admin("[key_name_admin(src)] has deleted the clan [db_query.item[2]].")
				to_chat(src, span_notice("You have deleted [db_query.item[2]]."))

				db_query.sql = "UPDATE [format_table_name("clan_player")] SET clan_id = 0 WHERE clan_id = :clan_id"
				db_query.arguments = list("clan_id" = clan_id)
				db_query.Execute()

				db_query.sql = "DELETE FROM [format_table_name("clan")] WHERE id = :clan_id"
				db_query.arguments = list("clan_id" = clan_id)
				db_query.Execute()

				usr_view_clan_info(null, TRUE)
				qdel(db_query)
				return // We delete here. We don't need to save the clan after it deletes

		if(clan_id)
			usr_view_clan_info(clan_id)

		qdel(db_query)

	else if(href_list[CLAN_TARGET_HREF])
		db_query.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey"
		db_query.arguments = list("byond_ckey" = text2num(href_list[CLAN_TARGET_HREF]))
		db_query.Execute()
		db_query.NextRow()

		clan_id = db_query.item[4]

		var/player_rank = clan_info.item[2]
		if(has_clan_permission(CLAN_PERMISSION_ADMIN_MANAGER, warn = FALSE))
			player_rank = 999

		if((db_query.item[3] & CLAN_PERMISSION_ADMIN_MANAGER) || player_rank <= db_query.item[2])
			to_chat(src, span_danger("You can't target this person!"))
			return

		switch(href_list[CLAN_ACTION])
			if(CLAN_ACTION_PLAYER_PURGE)
				if(!has_clan_permission(CLAN_PERMISSION_ADMIN_MANAGER))
					return

				var/input = input(src, "Are you sure you want to purge this person? Type '[db_query.item[1]]' to purge", "Confirm Purge") as text|null

				if(!input || input != db_query.item[1])
					return

				var/target_clan = db_query.item[4]
				log_admin("[key_name_admin(src)] has purged [db_query.item[1]]'s clan profile.")
				to_chat(src, span_notice("You have purged [db_query.item[1]]'s clan profile."))

				db_query.sql = "DELETE FROM [format_table_name("clan_player")] WHERE byond_ckey = :byond_ckey"
				db_query.arguments = list("byond_ckey" = text2num(href_list[CLAN_TARGET_HREF]))
				db_query.Execute()

				usr_view_clan_info(target_clan, TRUE)
				qdel(db_query)
				return // Return because we don't want to save them. They've been deleted

			if(CLAN_ACTION_PLAYER_MOVECLAN)
				if(!has_clan_permission(CLAN_PERMISSION_ADMIN_MOVE))
					return

				var/datum/db_query/db_clans = SSdbcore.NewQuery("SELECT id, name, description, honor, color FROM [format_table_name("clan")]")
				db_clans.Execute()
				var/list/clans = list()
				while(db_clans.NextRow())
					clans += list("[db_clans.item[2]]" = db_clans.item[1])

				qdel(db_clans)

				var/is_clan_manager = has_clan_permission(CLAN_PERMISSION_ADMIN_MANAGER, warn = FALSE)
				if(is_clan_manager && clans.len >= 1)
					if(db_query.item[3] & CLAN_PERMISSION_ADMIN_ANCIENT)
						clans += list("Remove from Ancient")
					else
						clans += list("Make Ancient")

				if(db_query.item[4])
					clans += list("Remove from clan")

				var/input = tgui_input_list(src, "Choose the clan to put them in", "Change player's clan", clans)

				if(!input)
					return

				if(input == "Remove from clan" && db_query.item[4])
					to_chat(src, span_notice("Removed [db_query.item[1]] from their clan."))
					log_admin("[key_name_admin(src)] has removed [db_query.item[1]] from their current clan.")

					db_query.sql = "UPDATE [format_table_name("clan")] SET clan_rank = :clan_rank, clan_id = 0 WHERE byond_ckey = :byond_ckey"
					db_query.arguments = list("byond_ckey" = href_list[CLAN_TARGET_HREF], "clan_rank" = clan_ranks_ordered[CLAN_RANK_YOUNG])
					db_query.Execute()

				else if(input == "Remove from Ancient")
					to_chat(src, span_notice("Removed [db_query.item[1]] from ancient."))
					log_admin("[key_name_admin(src)] has removed [db_query.item[1]] from ancient.")

					db_query.sql = "UPDATE [format_table_name("clan")] SET clan_rank = :clan_rank, permissions = :permissions WHERE byond_ckey = :byond_ckey"
					db_query.arguments = list("byond_ckey" = href_list[CLAN_TARGET_HREF], "clan_rank" = clan_ranks_ordered[CLAN_RANK_YOUNG], "permissions" = clan_ranks[CLAN_RANK_YOUNG].permissions)
					db_query.Execute()

				else if(input == "Make Ancient" && is_clan_manager)
					to_chat(src, span_notice("Made [db_query.item[1]] an ancient."))
					log_admin("[key_name_admin(src)] has made [db_query.item[1]] an ancient.")

					db_query.sql = "UPDATE [format_table_name("clan")] SET clan_rank = :clan_rank, permissions = :permissions WHERE byond_ckey = :byond_ckey"
					db_query.arguments = list("byond_ckey" = href_list[CLAN_TARGET_HREF], "clan_rank" = clan_ranks_ordered[CLAN_RANK_ADMIN], "permissions" = CLAN_PERMISSION_ADMIN_ANCIENT)
					db_query.Execute()

				else
					to_chat(src, span_notice("Moved [db_query.item[1]] to [input]."))
					log_admin("[key_name_admin(src)] has moved [db_query.item[1]] to clan [input].")

					if(!(db_query.item[3] & CLAN_PERMISSION_ADMIN_ANCIENT))
						db_query.sql = "UPDATE [format_table_name("clan")] SET clan_rank = :clan_rank permissions = :permissions WHERE byond_ckey = :byond_ckey"
						db_query.arguments = list("byond_ckey" = href_list[CLAN_TARGET_HREF], "clan_rank" = clan_ranks_ordered[CLAN_RANK_BLOODED], "permissions" = clan_ranks[CLAN_RANK_BLOODED].permissions)
						db_query.Execute()

					db_query.sql = "UPDATE [format_table_name("clan")] SET clan_id = :clan_id WHERE byond_ckey = :byond_ckey"
					db_query.arguments = list("byond_ckey" = href_list[CLAN_TARGET_HREF], "clan_id" = clans[input])
					db_query.Execute()

			if(CLAN_ACTION_PLAYER_MODIFYRANK)
				if(!db_query.item[4])
					to_chat(src, span_warning("This player doesn't belong to a clan!"))
					return

				var/list/datum/rank/ranks = clan_ranks.Copy()
				ranks -= CLAN_RANK_ADMIN // Admin rank should not and cannot be obtained from here

				var/datum/rank/chosen_rank
				if(has_clan_permission(CLAN_PERMISSION_ADMIN_MODIFY, warn = FALSE))
					var/input = tgui_input_list(src, "Select the rank to change this user to.", "Select Rank", ranks)

					if(!input)
						return

					chosen_rank = ranks[input]

				else if(has_clan_permission(CLAN_PERMISSION_USER_MODIFY, clan_info.item[4]))
					for(var/rank in ranks)
						if(!has_clan_permission(ranks[rank].permission_required, warn = FALSE))
							ranks -= rank

					var/input = tgui_input_list(src, "Select the rank to change this user to.", "Select Rank", ranks)

					if(!input)
						return

					chosen_rank = ranks[input]

					if(chosen_rank.limit_type)
						db_query.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE clan_id = :clan_id AND clan_rank = :clan_rank"
						db_query.arguments = list("clan_id" = clan_id, "clan_rank" = clan_ranks_ordered[input])
						db_query.Execute()

						var/players_in_rank = length(db_query.rows)
						qdel(db_query)
						switch(chosen_rank.limit_type)
							if(CLAN_LIMIT_NUMBER)
								if(players_in_rank >= chosen_rank.limit)
									to_chat(src, span_danger("This slot is full! (Maximum of [chosen_rank.limit] slots)"))
									return
							if(CLAN_LIMIT_SIZE)
								db_query.sql = "SELECT byond_ckey, clan_rank, permissions, clan_id, honor FROM [format_table_name("clan_player")] WHERE clan_id = :clan_id"
								db_query.arguments = list("clan_id" = clan_id)
								db_query.Execute()
								var/available_slots = length(db_query.rows) / chosen_rank.limit

								if(players_in_rank >= available_slots)
									to_chat(src, span_danger("This slot is full! (Maximum of [chosen_rank.limit] per player in the clan, currently [available_slots])"))
									return


				else
					return // Doesn't have permission to do this

				if(!has_clan_permission(chosen_rank.permission_required)) // Double check
					return

				log_admin("[key_name_admin(src)] has set the rank of [db_query.item[1]] to [chosen_rank.name] for their clan.")
				to_chat(src, span_notice("Set [db_query.item[1]]'s rank to [chosen_rank.name]"))

				db_query.sql = "UPDATE [format_table_name("clan")] SET clan_rank = :clan_rank, permissions = :permissions WHERE byond_ckey = :byond_ckey"
				db_query.arguments = list("byond_ckey" = href_list[CLAN_TARGET_HREF], "clan_rank" = clan_ranks_ordered[chosen_rank.name], "permissions" = chosen_rank.permissions)
				db_query.Execute()

		usr_view_clan_info(clan_id, TRUE)
		qdel(db_query)
