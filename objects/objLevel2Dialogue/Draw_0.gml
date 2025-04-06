if (dialogue_index < array_length(dialogue)) {
	// Get viewport position
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);
	var view_width = camera_get_view_width(view_camera[0]);
	var view_height = camera_get_view_height(view_camera[0]);
	
    // Dialogue box position (relative to the viewport)
	var box_x = view_x;
	var box_y = view_y + view_height - 100;
	var box_width = view_width;
	var box_height = 80;

    // Draw the semi-transparent box
    draw_set_color(c_black);
    draw_set_alpha(0.9);
    draw_rectangle(box_x, box_y, box_x + box_width, box_y + box_height, false);
    draw_set_alpha(1);
	
	// 🔳 Draw top and bottom borders (in white or another color)
    draw_set_color(c_white);
    
    // Top border
    draw_line(box_x, box_y, box_x + box_width, box_y);
    
    // Bottom border
    draw_line(box_x, box_y + box_height, box_x + box_width, box_y + box_height);

    // Set text properties
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Draw current dialogue line
    draw_text(box_x + 10, box_y + 10, dialogue[dialogue_index]);
}