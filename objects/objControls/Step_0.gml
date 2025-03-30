var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);
var view_width = camera_get_view_width(view_camera[0]);

// GUI element position
var offset_x = view_width - 10 - 384;
var offset_y = 10;

var gui_width = 384;
var gui_height = 96;

if(sprIndex == 0) {
	gui_height = 20;
}

// Basic hitbox check
if (mx > offset_x && mx < offset_x + gui_width &&
    my > offset_y && my < offset_y + gui_height) {
    
    if (mouse_check_button_pressed(mb_left)) {
        if(sprIndex == 0) {
			sprIndex = 1;	
		} else {
			sprIndex = 0;
		}

    }
}