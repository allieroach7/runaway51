// This is cleaner than checking in Step
restart_game();

/// @description Handle restart button click

// Reset player variables
if (instance_exists(obj_player)) {
    with (obj_player) {
        player_lives = 3;      // Reset to starting lives
        keys_collected = 0;    // Reset key count
        
        // Optional: Reset position to spawn point
        // x = spawn_x;
        // y = spawn_y;
        
        // Optional: Reset any other state
        // invincible = 0;
        // vspeed = 0;
        // hspeed = 0;
        // climbing = false;
        // state = PLAYER_STATE.NORMAL;
    }
}

// Optional: Reset any room-specific variables
// global.game_over = false;

// Go back to tutorial
room_goto(rm_tutorial);