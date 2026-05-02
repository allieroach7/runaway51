// Check if mouse is over the button
if (position_meeting(mouse_x, mouse_y, id)) {
    // Reset player variables
    if (instance_exists(obj_player)) {
        with (obj_player) {
            player_lives = 3;
            keys_collected = 0;
        }
    }
    
    // Reset global game state to level 1
    global.level = 1;
    global.keys_needed = 2;
    global.player_lives = 3;
    
    // Go to tutorial room
    room_goto(rm_tutorial);
}
