if(global.computerFix == 0) {
	// Check if obj_hero overlaps obj_computer
	if (position_meeting(x, y, obj_hero)) {
	    // Check if the E key is pressed
	    if (keyboard_check_pressed(ord("E"))) {
	        // Check if the player has at least 1 of resource_1
	        if (global.resource_1_count > 0) {
	            // Change the sprite frame to frame 1
	            image_index = 1;

	            // Optionally reduce the resource count
	            global.resource_1_count -= 1;
				
				global.computerFix = 1;
	        }
	    }
	}
}