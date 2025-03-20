if(global.level2Dialogue == 0) {
	global.level2Dialogue = 1;
	
	// Show dialog
	instance_create_layer(x, y, "gameObjects", objLevel2Dialogue);
}