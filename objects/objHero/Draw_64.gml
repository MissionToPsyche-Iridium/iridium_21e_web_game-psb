/// @desc Hero Gui
// Pause
if(paused) {
	exit;
} else {
	draw_sprite_ext( sprite_index, image_index, x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), image_xscale * face, image_yscale, image_angle, image_blend, image_alpha );
}

// Room 5
if (room == rmLevel5) {
    // Ensure surface exists
    if (flashlight_surface == -1 || !surface_exists(flashlight_surface)) {
        flashlight_surface = surface_create(room_width, room_height);
    }

	//covers the map for the flashlight to draw
    surface_set_target(flashlight_surface);
    draw_clear_alpha(c_black, 1);

	//gets the camera view for the flashlight 
    var screen_x = x - camera_get_view_x(view_camera[0]);
    var screen_y = y - camera_get_view_y(view_camera[0]);

	//creates the flashlight and blends it in 
    gpu_set_blendmode(bm_subtract);
    draw_circle_colour(screen_x, screen_y, flashlight_radius, c_white, c_white, false);
    gpu_set_blendmode(bm_normal);
	
	//resets the target for the movement
    surface_reset_target();
    draw_surface(flashlight_surface, 0, 0);
} else {
	if(global.tutorialStage >= 3) {
		draw_sprite(sprOxygen, oxygen, 212, 10);
	}
}

//Tutorial Dialogue
if(global.tutorialComplete == 0) {
	draw_sprite(sprTutorialDialogue, 0, 10, camera_get_view_height(view_camera[0]) - 10);

	// First Prompt
	if(global.tutorialStage == 0) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Wowzers, Admiral Smith! That landing was... not ideal.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Diagnostics suggest we just performed an unscheduled lithobrake maneuver.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Let’s start with the basics. Can you move your feet for me?");
	
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('A' to move left and 'D' to move right)");
	} else if(global.tutorialStage == 0.25) {
		// A is clicked
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Wowzers, Admiral Smith! That landing was... not ideal.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Diagnostics suggest we just performed an unscheduled lithobrake maneuver.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Let’s start with the basics. Can you move your feet for me?");
		draw_text(213, camera_get_view_height(view_camera[0]) - 50, "A");
	
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "(' ' to move left and 'D' to move right)");
	} else if(global.tutorialStage == 0.75) {
		// D is clicked
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Wowzers, Admiral Smith! That landing was... not ideal.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Diagnostics suggest we just performed an unscheduled lithobrake maneuver.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Let’s start with the basics. Can you move your feet for me?");
		draw_text(507, camera_get_view_height(view_camera[0]) - 50, "D");
	
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('A' to move left and ' ' to move right)");
	} else if(global.tutorialStage == 1) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Okay, you'’ve still got some wiggly-jiggly!");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Now give me a jump or two, just to make sure your gravity boots are still");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "calibrated.");
	
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('Spacebar' hold to jump)");
	} else if(global.tutorialStage == 2) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Powering up resources HUD text...");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Click Resources");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('Left click' resources in top left to see collected amounts)");
	} else if(global.tutorialStage == 3) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Powering up oxygen HUD text...");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "View oxygen");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "(If oxygen depletes, player will respawn in medbay)");
	} else if(global.tutorialStage == 4) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Powering up status HUD text...");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Click status");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('Left click' status in top middle to see ship repair progress)");
	} else if(global.tutorialStage == 5) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Powering up controls HUD text...");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Click controls");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('Left click' controls in top right to see game controls)");
	} else if(global.tutorialStage == 6) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Excellent! You’'re still in one piece.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Now - see that computer over there? Power it up.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "I’'m currently piggybacking on your suit'’s auxiliary juice.");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('E' to repair parts of ship)");
	} else if(global.tutorialStage == 7) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Accessing ship diagnostics... uh-oh... Hull integrity: 27%.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Robotics: offline. Air filtration: offline. Machine shop: offline.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Main power: 12%. Fuel reserves: 7%. Yikes on bikes.");
	} else if(global.tutorialStage == 8) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "I'’ll unlock the next room. Let’s get robotics online first.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "We'’re gonna need every robotic arm and wiggly appendage we've got.");
	}
}