// Always draw the computer sprite
draw_self();

// Check if obj_hero overlaps obj_computer
if (position_meeting(x, y, obj_hero)) {
	if(global.computerFix == 0) {
		// Draw the letter 'E' above the computer
	    draw_text(x - (sprite_width / 2) - 4, y - sprite_height - 28, "1"); // Adjust y - 32 to position the text above the computer
    
	    // Draw the resource sprite above the computer
	    draw_sprite(spr_resource, 0, x - (sprite_width / 2) + 8, y - sprite_height - 40)// Adjust y - 48 to position the sprite above the text
	}
}