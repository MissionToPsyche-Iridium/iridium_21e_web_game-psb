var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// GUI element position
var offset_x = 342;
var offset_y = 10;

var gui_width = 463;
var gui_height = 100;

if(sprIndex == 0) {
	gui_height = 20;
}

// Basic hitbox check
if (mx > offset_x && mx < offset_x + gui_width &&
    my > offset_y && my < offset_y + gui_height) {
    
    if (mouse_check_button_pressed(mb_left)) {
		if(global.tutorialStage >= 4 || global.tutorialComplete == 1) {
	        if(sprIndex == 0) {
				sprIndex = 1;
			} else {
				sprIndex = 0;
			}
		}
    }
}

if(sprIndex > 0) {
	// There are 6 status checks, therefore 0-7 frames
	// 0: Closed
	// 1: None fixed
	// 2-7: 1-6 fixed
			
	// Compy
	if(global.compyFix == 1 && global.serverFix == 0) {
		sprIndex = 2;
	// Robotics
	} else if(global.serverFix == 1 && global.level2Fix == 0) {
		sprIndex = 3;
	// Water
	} else if(global.level2Fix == 1 && global.craneFix == 0) {
		sprIndex = 4;
	// Crane
	} else if(global.craneFix == 1 && global.airVacFix == 0) {
		sprIndex = 5;
	// Air Vac
	} else if(global.airVacFix == 1 && global.antennaFix == 0) {
		sprIndex = 6;
	// Antenna
	} else if(global.antennaFix == 1) {
		sprIndex = 7;
	} else {
		// Do nothing
	}	
}