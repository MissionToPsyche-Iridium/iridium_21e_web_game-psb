// Get Inputs
getControls();

// x movement
	// direction
	moveDir = rightKey - leftKey;

	// Get xspd
	xspd = moveDir * moveSpd;

	// x collision
	var _subPixel = .5;
	if place_meeting( x + xspd, y, obj_floor_1) {
		// Scoot up to wall precisely
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting(x + _pixelCheck, y, obj_floor_1) {
			x += _pixelCheck;	
		}
	
		// Set xspd to zero to "collide"
		xspd = 0;	
	}

	// move
	x += xspd;

// y movement
	// gravity
	yspd += grav;
	
	// Reset / Prepare jumping variables
	if onGround {
		jumpCount = 0;
		jumpHoldTimer = 0;
	} else {
		// if player is in air, make sure they can't do extra jumps
		if jump == 0 {
			jumpCount = 1;	
		}
	}
	
	// Initiate Jump
	if jumpKeyBuffered && jumpCount < jumpMax {
		// reset the buffer
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		// Increase the number iof performed jumps
		jumpCount++;
		
		// Set the jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
	}
	// Cut off the jump by releasing the jump button'
	if !jumpKey {
		jumpHoldTimer = 0;	
	}
	// Jump based on the timer/ding the button
	if jumpHoldTimer > 0 {
		// Constantly set the yspd to the jumping speed
		yspd = jspd[jumpCount - 1];
		
		// Count down the timer
		jumpHoldTimer--;
	}
	
	// Y collision and movement
		// Cap falling speed
		if yspd > termVel {
			yspd = termVel;
		}

		// Y Collision
		var _subPixel = .5;
		if place_meeting( x, y + yspd, obj_floor_1 ) {
			// Scoot up to the wall precisely
			var _pixelCheck = _subPixel * sign(yspd);
			while !place_meeting( x, y + _pixelCheck, obj_floor_1 ) {
				y += _pixelCheck;	
			}
			
			// Bonk code
			if yspd < 0 {
					jumpHoldTimer = 0;
			}
		
			// Set yspd to 0 to collide
			yspd = 0;
		}
		
		// Set if I am on ground
		if yspd >= 0 && place_meeting( x, y + 1, obj_floor_1) {
			onGround = true;
		} else {
			onGround = false;	
		}
		
		// Move
		y += yspd;
	
	
	





//// Horizontal Movement
////[
//	// First set direction to move horizontally
//	flt_move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
//	// Next set the speed at which to move in that direction
//	flt_move_x = flt_move_x * flt_move_speed;
////]

//// Vertical Movement
////[
//	// If hero meets above floor, then movement in vertical should be 0
//	if(place_meeting(x, y + 2, obj_floor_1) || place_meeting(x,y+2, obj_moving_platform)) {
//		// Set to 0
//		flt_move_y = 0;

//		if(keyboard_check_pressed(vk_space)) {
//			flt_move_y = -flt_jump_speed;
//			is_jumping = true;
//			audio_play_sound(snd_jump, 0, false);
//		}

//	} else if (place_meeting(x, y - 2, obj_floor_1)) {
//		flt_move_y = flt_gravity_constant;
//	} else if (flt_move_y < flt_terminal_fall_speed) {
//		flt_move_y += flt_gravity_constant;
//	}
////]

////Moving platform collision
//var moving_platform = instance_place(x,y + max(1,flt_move_y), obj_moving_platform);
//if (moving_platform && bbox_bottom <= moving_platform.bbox_top)
//{
//	if(flt_move_y > 0)
//	{
//		while(!place_meeting(x,y+sign(flt_move_y),obj_moving_platform))
//		{
//			y+= sign(flt_move_y);
//		}
//		flt_move_y = 0;
//	}
//	x += moving_platform.moveX;
//	y += moving_platform.moveY;
//}


//// Make hero move and appropriately handle collisions
//move_and_collide(flt_move_x, flt_move_y, obj_floor_1);

//if flt_move_x != 0 {
//	image_xscale = sign(flt_move_x);
//}

//// Standing Still
//if(flt_move_x == 0) {
//	image_speed = 0.05;
	
//	if(floor(image_index) < 0 || floor(image_index) > 1) {
//		image_index = 0;
//	}
//} else if (flt_move_x != 0 && flt_move_y == 0)  {
//	image_speed = 0.20;
	
//	if(floor(image_index) < 3 || floor(image_index) > 4) {
//		image_index = 3;
//	}
//} else if(flt_move_y > 0) {
//	image_index = 7;
//}