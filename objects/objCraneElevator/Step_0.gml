if(global.craneFix == 1) {
	// Check if objHero is standing on top of the platform
	hero = instance_place(x, y - 1, objHero);
	
	if (!paused) {
	    if (moving_down) {
	        y += move_speed;
	        if (hero != noone) {
	            //hero.y += move_speed; // Move hero with the platform
	        }
        
	        if (y >= target_y) {
	            y = target_y; // Ensure it stops exactly at the target
	            moving_down = false;
	            paused = true;
	            alarm[0] = pause_time; // Set alarm to pause
	        }
	    } else {
	        y -= move_speed;
	        if (hero != noone) {
	            hero.y -= move_speed; // Move hero with the platform
	        }
        
	        if (y <= original_y) {
	            y = original_y;
	            moving_down = true;
	            paused = true;
	            alarm[0] = pause_time; // Set alarm to pause
	        }
	    }
	}
}