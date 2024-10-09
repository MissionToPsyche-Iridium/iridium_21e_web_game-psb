if (mouse_x > x - sprite_width / 2 && mouse_x < x + sprite_width / 2 &&
    mouse_y > y - sprite_height / 2 && mouse_y < y + sprite_height / 2) {
    
    image_index = 1;
    
    if (mouse_check_button_pressed(mb_left)) {
        room_goto(rm_play);
    }
} else {
    image_index = 0;
}