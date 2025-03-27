// Toggle pause when Esc is pressed
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused; // Toggle the paused state
}



// If the game is paused, stop everything except the pause menu
if (paused) {
	
	if (keyboard_check_pressed(vk_tab)) {
    room_goto(rm_start);
	}
	if(keyboard_check_pressed(vk_numpad0)) {
		sound = !sound; 
		if(sound) {
			audio_pause_sound(snd_r1);	
			audio_pause_sound(snd_r2);
			audio_pause_sound(snd_r3);
			audio_pause_sound(snd_r4);
			audio_pause_sound(snd_r5);
		}
		if(!sound) {
			audio_resume_sound(snd_r1);	
		}
	}
}