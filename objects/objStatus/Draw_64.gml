if(room != (rmLevel5 || rm_start || rmFinalCutscene || rmInitialCutscene)) {
	var offset_x = 342;
	var offset_y = 10;

	if(global.tutorialStage >= 4) {
		draw_sprite(sprStatus, sprIndex, offset_x, offset_y);
	}
}