function restart_game() {
    // Reset player variables
    if (instance_exists(obj_player)) {
        with (obj_player) {
            player_lives = 3;      // Reset to starting lives
            keys_collected = 0;    // Reset key count
        }
    }
    
    // Go back to tutorial room
    room_goto(rm_tutorial);
}