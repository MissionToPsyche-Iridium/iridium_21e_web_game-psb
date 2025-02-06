// Define sprite and position
var sprite_to_draw = sprControlls; // Change this to your actual sprite name
var x_offset = 0; // Adjust how far from the right edge
var y_offset = 0;  // Adjust how far from the top edge

// Get viewport width and height
var screen_width = display_get_gui_width();
var screen_height = display_get_gui_height();

// Calculate top-right position
var x_pos = screen_width - sprite_get_width(sprite_to_draw) + x_offset;
var y_pos = y_offset;

// Draw the sprite
draw_sprite(sprite_to_draw, 0, x_pos, y_pos);