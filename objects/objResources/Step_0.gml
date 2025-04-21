var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

// GUI element position
var offset_x = 10;
var offset_y = 10;

var gui_width = 192;
var gui_height = 96;

if(sprIndex == 0) {
	gui_height = 20;
}

// Basic hitbox check
if (mx > offset_x && mx < offset_x + gui_width &&
    my > offset_y && my < offset_y + gui_height) {
    
    if (mouse_check_button_pressed(mb_left)) {
		if(global.tutorialStage >= 2 || global.tutorialComplete == 1) {
	        if(sprIndex == 0) {
				sprIndex = 1;	
			} else {
				sprIndex = 0;
			}
		}
    }
}