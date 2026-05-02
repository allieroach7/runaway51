// Check if mouse is over the button sprite
if (position_meeting(mouse_x, mouse_y, id)) {
    if (!is_hovered) {
        is_hovered = true;
        image_xscale = 1.05;
        image_yscale = 1.05;
        window_set_cursor(cr_handpoint);
    }
    
    // Check for click
    if (mouse_check_button_pressed(mb_left)) {
        show_debug_message("Button clicked!");
        
        // Reset game state
        global.level = 1;
        global.keys_needed = 2;
        global.player_lives = 3;
        
        if (instance_exists(obj_player)) {
            with (obj_player) {
                player_lives = 3;
                keys_collected = 0;
            }
        }
        
        room_goto(rm_tutorial);
		audio_play_sound(snd_gameplay,2,true)
    }
} else {
    if (is_hovered) {
        is_hovered = false;
        image_xscale = 1;
        image_yscale = 1;
        window_set_cursor(cr_default);
    }
}