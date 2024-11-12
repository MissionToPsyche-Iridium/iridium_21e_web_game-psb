// Horizontal Movement
//[
	// First set direction to move horizontally
	flt_move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
	// Next set the speed at which to move in that direction
	flt_move_x = flt_move_x * flt_move_speed;
//]

// Vertical Movement
//[
	// If hero meets above floor, then movement in vertical should be 0
	if(place_meeting(x, y + 2, obj_floor_1)) {
		// Set to 0
		flt_move_y = 0;

		if(keyboard_check_pressed(vk_space)) {
			flt_move_y = -flt_jump_speed;
			is_jumping = true;
			audio_play_sound(snd_jump, 0, false);
		}

	} else if (place_meeting(x, y - 2, obj_floor_1)) {
		flt_move_y = flt_gravity_constant;
	} else if (flt_move_y < flt_terminal_fall_speed) {
		flt_move_y += flt_gravity_constant;
	}
//]

// Make hero move and appropriately handle collisions
move_and_collide(flt_move_x, flt_move_y, obj_floor_1);

if flt_move_x != 0 {
	image_xscale = sign(flt_move_x);
}

// Standing Still
if(flt_move_x == 0) {
	image_speed = 0.05;
	
	if(floor(image_index) < 0 || floor(image_index) > 1) {
		image_index = 0;
	}
} else if (flt_move_x != 0 && flt_move_y == 0)  {
	image_speed = 0.20;
	
	if(floor(image_index) < 3 || floor(image_index) > 4) {
		image_index = 3;
	}
} else if(flt_move_y > 0) {
	image_index = 7;
}