// Tutorial
if(global.tutorialComplete == 0) {
	global.tutorialStage++;
	
	if(global.tutorialStage == 8) {
		alarm[1] = 300;
	}
	
	if(global.tutorialStage == 9) {
		// Unlock doors
		global.tutorialComplete = 1;
	}
}