// This triggers automatically when clicking the button instance
if (position_meeting(mouse_x, mouse_y, id)) {
    show_debug_message("Button clicked via Mouse event!");
    
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
}