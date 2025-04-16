var view_width = camera_get_view_width(view_camera[0]);

var offset_x = view_width - 10;
var offset_y = 10;

if(global.tutorialStage >= 5 || global.tutorialComplete == 1) {
	draw_sprite(sprControls, sprIndex, offset_x, offset_y);
}
