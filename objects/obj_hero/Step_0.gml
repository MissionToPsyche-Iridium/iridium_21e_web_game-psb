// Set movement
flt_move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
flt_move_x = flt_move_x * flt_move_speed;

if place_meeting(x, y+2, obj_floor_1) {
	flt_move_y = 0;
	
	if keyboard_check(vk_space) {
		flt_move_y = -flt_jump_speed;
		audio_play_sound(snd_jump, 0, false);
	}
} else if flt_move_y < 10 {
	flt_move_y += 1;
}

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