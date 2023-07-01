/atom/proc/sway_jitter(times = 3, steps = 3, strength = 3, sway = 5)
	var/sway_dir = 1 //left to right
	animate(src, transform = turn(matrix(transform), sway * (sway_dir *= -1)), pixel_x = rand(-strength,strength), pixel_y = rand(-strength/3,strength/3), time = times, easing = JUMP_EASING, flags = ANIMATION_PARALLEL)
	for(var/i in 1 to steps)
		animate(transform = turn(matrix(transform), sway*2 * (sway_dir *= -1)), pixel_x = rand(-strength,strength), pixel_y = rand(-strength/3,strength/3), time = times, easing = JUMP_EASING)

	animate(transform = turn(matrix(transform), sway * (sway_dir *= -1)), pixel_x = 0, pixel_y = 0, time = 0)//ease it back
