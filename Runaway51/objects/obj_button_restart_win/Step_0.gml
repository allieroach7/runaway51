// Get button position (centered)
var button_x = room_width / 2 - button_width / 2;
var button_y = room_height - 150;

// Check if mouse is over button
if (mouse_x > button_x && mouse_x < button_x + button_width &&
    mouse_y > button_y && mouse_y < button_y + button_height) {
    
    if (!is_hovered) {
        is_hovered = true;
        window_set_cursor(cr_handpoint);
    }
    
    // Check for click
    if (mouse_check_button_pressed(mb_left)) {
        show_debug_message("Restart button clicked from win screen!");
        
        // Reset all game variables
        global.level = 1;
        global.keys_needed = 2;
        global.player_lives = 3;
        
        // Reset player if exists
        if (instance_exists(obj_player)) {
            with (obj_player) {
                player_lives = 3;
                keys_collected = 0;
            }
        }
        
        // Go back to title screen
        room_goto(rm_titleScreen);
		
    }
} else {
    if (is_hovered) {
        is_hovered = false;
        window_set_cursor(cr_default);
    }
}