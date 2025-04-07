audio_stop_sound(snd_r1);
room_goto(rmLevel3);

if(global.level3Complete == 0 && global.level3Stage == 0) {
	global.level3Stage = 1;
}