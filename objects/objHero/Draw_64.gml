/// @desc Hero Gui
draw_set_halign(fa_left);
draw_set_valign(fa_top);
		
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
	draw_sprite_ext(sprTutorialDialogue, dialogueFrame, 10, camera_get_view_height(view_camera[0]) - 10, 1, 1, 0, c_white, 0.85);
	
	draw_set_color(c_white);
	draw_set_font(fntDefault);
	draw_text(22, camera_get_view_height(view_camera[0]) - 160, "AI");

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
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Initializing HUD start-up program.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "HUD Display: Resources");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "We will need to collect resources around Psyche to fix the ship!");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('Left click' resources in top left to see collected amounts)");
	} else if(global.tutorialStage == 3) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "HUD Display: Oxygen");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Your spacesuit has an internal oxygen supply, if you let it run low, you will pass out.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "But don'’t worry! The drones will get you back to the medbay for full recovery!");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "(If oxygen depletes, player will respawn in medbay)");
	} else if(global.tutorialStage == 4) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "HUD Display: Status");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "The status is a quick glance at progress made on ship repairs.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Each of these are vital to getting us off this rock safely!");
		
		draw_set_color(c_yellow);
		draw_text(185, camera_get_view_height(view_camera[0]) - 50, "('Left click' status in top middle to see ship repair progress)");
	} else if(global.tutorialStage == 5) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "HUD Display: Controls");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "If you are still dazed from crash landing, please refer to the control HUD.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "This display has all the necessary humanoid functions needed to complete this mission.");
		
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

//Robotics Dialogue
if(global.tutorialComplete == 1 && global.roboticsComplete == 0) {
	draw_sprite_ext(sprTutorialDialogue, dialogueFrame, 10, camera_get_view_height(view_camera[0]) - 10, 1, 1, 0, c_white, 0.85);
	
	draw_set_color(c_white);
	draw_set_font(fntDefault);
	draw_text(22, camera_get_view_height(view_camera[0]) - 160, "AI");
	
	if(global.serverFix == 0) {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Alright, we need to get that core robotic unit humming again.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "That resource on the left podium might help. Looks like a core module.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Can you grab it and install it in the override socket to the right?");
	} else {
		draw_set_color(c_green);
		draw_set_font(fntAI);
	
	    draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Bingo-bango! Robotics online. That unlocks more ship systems.");
		draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Let's head to storage and see what else we’ve got to work with.");
	}
}

//Storage Dialogue
if(global.tutorialComplete == 1 && global.roboticsComplete == 1 && global.storageComplete == 0) {
	draw_sprite_ext(sprTutorialDialogue, dialogueFrame, 10, camera_get_view_height(view_camera[0]) - 10, 1, 1, 0, c_white, 0.85);
	
	draw_set_color(c_white);
	draw_set_font(fntDefault);
	draw_text(22, camera_get_view_height(view_camera[0]) - 160, "AI");
		
	draw_set_color(c_green);
	draw_set_font(fntAI);
	
	draw_text(185, camera_get_view_height(view_camera[0]) - 140, "Looks like there are some high-grade alloy in the center storage room.");
	draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Perfect for patching our systems.");
	draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Let's use that to unlock the filtration room on the top left of the ship.");
}

//Level 2 Dialogue
if(global.tutorialComplete == 1 && global.roboticsComplete == 1 && global.storageComplete == 1 && global.level2Complete == 0 && global.level2Stage >= 1) {
	draw_sprite_ext(sprTutorialDialogue, dialogueFrame, 10, camera_get_view_height(view_camera[0]) - 10, 1, 1, 0, c_white, 0.85);
	
	draw_set_color(c_white);
	draw_set_font(fntDefault);
	draw_text(22, camera_get_view_height(view_camera[0]) - 160, "AI");

	draw_set_color(c_green);
	draw_set_font(fntAI);
	
	draw_text(185, camera_get_view_height(view_camera[0]) - 140, "This room'’s a mess. Pressure breach on the far side - air'’s escaping faster than I can say '’whoosh'’!");
	draw_text(185, camera_get_view_height(view_camera[0]) - 110, "We'’ll need to grab what we can to get the machine shop up and running.");
	draw_text(185, camera_get_view_height(view_camera[0]) - 80, "Grab one resource at a time and get back to the main compartment!");
}

//Level 3 Dialogue
if(global.tutorialComplete == 1 && global.roboticsComplete == 1 && global.storageComplete == 1 && global.level2Complete == 1 && global.level3Complete == 0 && global.level3Stage >= 1) {
	draw_sprite_ext(sprTutorialDialogue, dialogueFrame, 10, camera_get_view_height(view_camera[0]) - 10, 1, 1, 0, c_white, 0.85);
	
	draw_set_color(c_white);
	draw_set_font(fntDefault);
	draw_text(22, camera_get_view_height(view_camera[0]) - 160, "AI");

	draw_set_color(c_green);
	draw_set_font(fntAI);
	
	draw_text(185, camera_get_view_height(view_camera[0]) - 140, "These rock formations are... unstable.");
	draw_text(185, camera_get_view_height(view_camera[0]) - 110, "Be careful! Those materials over there should help us fix the internal VAC doors.");
	draw_text(185, camera_get_view_height(view_camera[0]) - 80, "A warning, this cave looks large, keep an eye out on that oxygen!");
}