// Get Controls
if (keyboard_check_pressed(vk_escape)) {
   paused = !paused; // Toggle the paused state
}

if(paused) {
	exit;	
}
else {
	// Get Inputs
	getControls();
}

// X Movement
//[
	// Move Direction
	// Right = 1
	// Left = -1
	// Both = 0
	moveDir = rightKey - leftKey;
	
	// Facing Direction
	// If not moving, keep the same
	// Otherwise, update face to Move Direction
	if moveDir != 0 {
		face = moveDir;
	}

	// !! Currently Disabled Running for DEMO !!
	// This needs to be fully documented and tested
	//[
		runType = runKey;

		runType = 0;
	//]
	
	// Set X Speed
	// X Speed = Move Direction * Walking Movement Speed
	//[
		xspd = moveDir * moveSpd[runType];
	//]

	// X Collision
	//[
		// Create a Sub Pixel variable for scooting movement when colliding
		var _subPixel = .5;
		
		// If the (X Position of the hero + the X Speed of the hero) meets the collision object
		// Then enter collision checks
		// If this is equal to false, then no collision happens and the hero will move forward
		if place_meeting( x + xspd, y, obj_floor_1) {
		
			// Check for slope upwards
			// This is done by checking to see if there is !not! a place meeting of:
				// hero x position + x speed
				// hero y position and the absolute value of hero x speed - 1
				// With the collision object
				
				// Existing Code - From Tutorial
				//if !place_meeting( x + xspd, y - abs(xspd)-1, obj_floor_1 ) {
				//while place_meeting(x + xspd, y, obj_floor_1 ) {
				//	y -= _subPixel;	
				//}
				
				// New Code
				//[
					// Slope Meeting
					var xSlopeMeeting = false;
			
					// Check X speed by X speed grid
					for(var i = 0; i <= abs(xspd); i++) {
						for(var j = 0; j <= abs(xspd); j++) {
							// Check upwards
							if place_meeting( x + moveDir * j, y - i, obj_floor_1 ) {
								// Verify that there is a pixel to move to
								for(var k = 0; k <= abs(xspd); k++) {
									if !place_meeting( x + moveDir * 1, y - i - k, obj_floor_1 ) {
										xSlopeMeeting = true;
						
										break;
									}
								}
							}
						}
					}
				
					// If there is a slope meeting that can be traversed and hero is on the ground
					// Then start traversing upwards in the sub pixels until there is no more collision
					if xSlopeMeeting && onGround {
						while place_meeting(x + moveDir, y, obj_floor_1 ) {
							y -= _subPixel;
						}
				//]
			// Next, check for ceiling sloper, otherwise, regular collision
			} else {
				// Ceiling slopes
				if !place_meeting(x + xspd, y + abs(xspd) + 1, obj_floor_1) {
					while place_meeting(x + xspd, y, obj_floor_1) {
						y += _subPixel;	
					}
				// Normal collision
				} else {
					// Scoot up to wall precisely
					var _pixelCheck = _subPixel * sign(xspd);
					while !place_meeting(x + _pixelCheck, y, obj_floor_1) {
						x += _pixelCheck;	
					}

					// Set xspd to zero to "collide"
					xspd = 0;
				}
			}
		}
	
		// Go down slopes
		if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_floor_1) && place_meeting(x + xspd, y + abs(xspd)+1, obj_floor_1) {
			while !place_meeting(x + xspd, y + _subPixel, obj_floor_1) {
				y += _subPixel;	
			}
		}
	//]

	// After all previous checks, move obj_Hero x position within room
	x += xspd;
//]

// y movement
	// gravity
	if coyoteHangTimer > 0 {
		// Count the timer down
		coyoteHangTimer--;
	} else {
		// Apply gravity to the player
		yspd += grav;
		
		// We're no longer on the ground
		setOnGround(false);
	}
	
	// Reset / Prepare jumping variables
	if onGround {
		jumpCount = 0;
		coyoteJumpTimer = coyoteJumpFrame;
	} else {
		// if player is in air, make sure they can't do extra jumps
		coyoteJumpTimer--;
		if jumpCount == 0 && coyoteJumpTimer <= 0 {
			jumpCount = 1;	
		}
	}
	
	// Initiate Jump
	if jumpKeyBuffered && jumpCount < jumpMax {
		// reset the buffer
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		// Increase the number of performed jumps
		jumpCount++;
		
		// Set the jump hold timer
		jumpHoldTimer = jumpHoldFrames[jumpCount-1];
		// Tell ourself we're no longer on the ground
		setOnGround(false);
		audio_play_sound(snd_jump, 1, false);
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
		
		// Upwards Y Collisions (with ceiling slopes)
		if yspd < 0 && place_meeting(x, y + yspd, obj_floor_1 ) {
			// Jump into sloped ceilings
			var _slopeSlide = false;
			
			// Slide UpLeft slope
			if moveDir == 0 && !place_meeting(x - abs(yspd)-1, y+yspd, obj_floor_1) {
				while place_meeting(x, y + yspd, obj_floor_1) {
					x -= 1;
				}
				_slopeSlide = true;
			}
			
			// Slide UpRight slope
			if moveDir == 0 && !place_meeting(x + abs(yspd)+1, y + yspd, obj_floor_1) {
				while place_meeting(x, y + yspd, obj_floor_1) {
					x += 1;
				}
				_slopeSlide = true;
			}
			
			// Normal Y Collision
			if !_slopeSlide {
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
		}
		
		// Downwards Y Collision
		if yspd >= 0 {
			if place_meeting( x, y + yspd, obj_floor_1 ) {
				// Scoot up to the wall precisely
				var _pixelCheck = _subPixel * sign(yspd);
				while !place_meeting( x, y + _pixelCheck, obj_floor_1 ) {
					y += _pixelCheck;	
				}
		
				// Set yspd to 0 to collide
				yspd = 0;
			}
		
			// Set if I am on ground
			if place_meeting( x, y + 1, obj_floor_1) {
				setOnGround(true);
			}
			
			// Moving Platform
			if place_meeting( x, y + 1, obj_moving_platform) {
				setOnGround(true);
				x += obj_moving_platform.moveX;
				y += obj_moving_platform.moveY;
			}
			
			// Up / Down
			//if place_meeting( x, y + 1, upDown) {
			//	setOnGround(true);
			//	x += upDown.moveX;
			//	y += upDown.moveY;
			//}
		}
		
		// Move
		y += yspd;
	
// Sprite Control
	// Walking
	if abs(xspd) > 0 {
		sprite_index = walkSpr;
	}
	
	// Running
	if abs(xspd) >= moveSpd[1] {
		sprite_index = runSpr;	
	}
	
	// Not Moving
	if xspd == 0 {
		sprite_index = idleSpr;
	}
	
	// In the air
	if !onGround {
		sprite_index = jumpSpr;	
	}
	
	// set the collision mask
	mask_index = maskSpr;



//Moving platform collision
//var moving_platform = instance_place(x,y + max(1, yspd), obj_moving_platform);

//if (moving_platform && bbox_bottom <= moving_platform.bbox_top)
//{
//	if(yspd > 0)
//	{
//		while(!place_meeting(x,y+sign(yspd), obj_moving_platform))
//		{
//			y+= sign(yspd);
//		}
//		yspd = 0;
//	}
//	x += movingPlatform.moveX;
//  y += movingPlatform.moveY;
//}

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