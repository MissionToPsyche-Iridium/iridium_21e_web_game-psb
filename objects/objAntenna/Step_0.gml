if (!place_meeting(x, y, objHero) && dialogue != noone) {
    instance_destroy(dialogue);
    dialogue = noone;
}

if (global.antennaFix == 1 && dialogue != noone) {
	image_index = 1;
    instance_destroy(dialogue);
    dialogue = noone;
}

if (global.antennaFix == 1) {
    image_speed = 0.05;
	
	if (image_index > 6) {
	    image_index = 1;
	}
}

