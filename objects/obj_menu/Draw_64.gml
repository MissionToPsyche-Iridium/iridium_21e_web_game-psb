// If the game is paused, draw the overlay
if (paused) {
    draw_set_color(c_black);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false); // Background (semi-transparent overlay)
    draw_set_color(c_white);
    draw_text(635, 375, "PAUSED");
    draw_text(10, 10, "Press ESC to Pause");
    draw_text(10, 30, "Use Arrow Keys to Move");
    draw_text(10, 50, "Press NumPad0 to Toggle Sound");
}
