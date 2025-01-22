if(image_index == 0) {
	global.resource_1_count += 1;
	audio_play_sound(snd_collect, 1, false);
} else if(image_index == 1) {
	global.resource_2_count += 1;
	audio_play_sound(snd_collect2, 1, false);
} else if(image_index == 2) {
	global.resource_3_count += 1;
	audio_play_sound(snd_collect3, 1, false);
} else if(image_index == 3) {
	global.resource_4_count += 1;
	audio_play_sound(snd_collect4, 1, false);
} else if(image_index == 4) {
	global.resource_5_count += 1;
	audio_play_sound(snd_collect5, 1, false);
}

instance_destroy();