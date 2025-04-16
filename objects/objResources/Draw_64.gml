var offset_x = 10;
var offset_y = 10;

if(global.tutorialStage >= 2 || global.tutorialComplete == 1) {
	draw_sprite(sprResources, sprIndex, offset_x, offset_y);

	if (sprIndex == 1) {
		draw_set_color(c_white);
		draw_set_font(fntDefault);
	
		draw_text(30, 50, string(global.resource_1_count));
		draw_text(65, 50, string(global.resource_2_count));
		draw_text(105, 50, string(global.resource_3_count));
		draw_text(140, 50, string(global.resource_4_count));
		draw_text(175, 50, string(global.resource_5_count));
	}
}
