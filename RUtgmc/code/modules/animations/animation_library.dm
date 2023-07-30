/atom/proc/sway_jitter(times = 3, steps = 3, strength = 3, sway = 5)
	var/sway_dir = 1 //left to right
	animate(src, transform = turn(matrix(transform), sway * (sway_dir *= -1)), pixel_x = rand(-strength,strength), pixel_y = rand(-strength/3,strength/3), time = times, easing = JUMP_EASING, flags = ANIMATION_PARALLEL)
	for(var/i in 1 to steps)
		animate(transform = turn(matrix(transform), sway*2 * (sway_dir *= -1)), pixel_x = rand(-strength,strength), pixel_y = rand(-strength/3,strength/3), time = times, easing = JUMP_EASING)

	animate(transform = turn(matrix(transform), sway * (sway_dir *= -1)), pixel_x = 0, pixel_y = 0, time = 0)//ease it back

/obj/effect/temp_visual/block //color is white by default, set to whatever is needed
	name = "blocking glow"
	icon_state = "block"
	duration = 6.7

/obj/effect/temp_visual/block/Initialize(mapload, set_color)
	if(set_color)
		add_atom_colour(set_color, FIXED_COLOUR_PRIORITY)
	. = ..()
	pixel_x = rand(-12, 12)
	pixel_y = rand(-9, 0)
