if (!place_meeting(x, y, objHero) && dialogue != noone) {
    instance_destroy(dialogue);
    dialogue = noone;
}

if (global.craneFix == 1 && dialogue != noone) {
	image_index = 1;
    instance_destroy(dialogue);
    dialogue = noone;
}

if (global.craneFix == 1) {
    image_speed = 0.15;
	
	if (image_index > 5) {
	    image_index = 1;
	}
}

