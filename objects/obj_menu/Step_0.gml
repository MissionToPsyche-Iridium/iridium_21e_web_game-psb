// Toggle pause when Esc is pressed
if (keyboard_check_pressed(vk_escape)) {
    paused = !paused; // Toggle the paused state
}

// If the game is paused, stop everything except the pause menu
if (paused) {
	if (keyboard_check_pressed(vk_tab)) {
    room_goto(rm_start);
	}
}