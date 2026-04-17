// This is cleaner than checking in Step
restart_game();

/// @description Handle restart button click

// Reset player variables
if (instance_exists(obj_player)) {
    with (obj_player) {
        player_lives = 3;      // Reset to starting lives
        keys_collected = 0;    // Reset key count

    }
}


// Go back to tutorial
room_goto(rm_tutorial);