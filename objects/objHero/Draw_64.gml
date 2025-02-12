/// @desc Hero Gui
if(paused) {
	exit;
}
else {
draw_sprite_ext( sprite_index, image_index, x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), image_xscale * face, image_yscale, image_angle, image_blend, image_alpha );
}
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
}else{
//draw_sprite(spr_health, int_hp - 1, 10, 10);
draw_sprite(spr_resource, 0, 30, 30);
draw_text(30, 30, string(global.resource_1_count));

draw_sprite(spr_resource, 1, 62, 30);
draw_text(62, 30, string(global.resource_2_count));

draw_sprite(spr_resource, 2, 94, 30);
draw_text(94, 30, string(global.resource_3_count));

draw_sprite(spr_resource, 3, 126, 30);
draw_text(126, 30, string(global.resource_4_count));

draw_sprite(spr_resource, 4, 156, 30);
draw_text(156, 30, string(global.resource_5_count));
draw_sprite(O2_Bar, oxygen, 30, 60);
}



