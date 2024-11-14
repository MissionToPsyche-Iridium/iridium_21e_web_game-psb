/// @desc Hero Gui

//draw_sprite(spr_health, int_hp - 1, 10, 10);
draw_sprite(spr_resource, 0, 30, 30);
draw_text(30, 30, string(global.resource_1_count));

draw_sprite(spr_resource, 1, 62, 30);
draw_text(62, 30, string(global.resource_1_count));

draw_sprite(spr_resource, 2, 94, 30);
draw_text(94, 30, string(global.resource_1_count));

draw_sprite(spr_resource, 3, 126, 30);
draw_text(126, 30, string(global.resource_1_count));

draw_sprite(spr_resource, 4, 156, 30);
draw_text(156, 30, string(global.resource_1_count));