/// @desc Hero Gui

draw_sprite_ext( sprite_index, image_index, x - camera_get_view_x(view_camera[0]), y - camera_get_view_y(view_camera[0]), image_xscale * face, image_yscale, image_angle, image_blend, image_alpha );

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

// draw_sprite(O2_Bar, oxygen, 30, 60);