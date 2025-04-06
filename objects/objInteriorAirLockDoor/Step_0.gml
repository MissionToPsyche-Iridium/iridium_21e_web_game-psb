if (!place_meeting(x, y, objHero) && dialogue != noone) {
    instance_destroy(dialogue);
    dialogue = noone;
}

if(global.airVacFix == 1) {
	instance_destroy();
}

if (place_meeting(x - 10, y, objHero)) {
	if (dialogue == noone && global.airVacFix == 0) {
	    dialogue = instance_create_layer(x - 60, y + 20, "gameObjects", objAirVacDialogue);
	}
}