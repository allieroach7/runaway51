
if (!variable_global_exists("loading")) {
    global.loading = false;
}
// Initialize ALL global variables
global.level = 1;
global.keys_needed = 2;  // Level 1 needs 2 keys
global.player_lives = 3;


show_debug_message("Game Controller initialized - Level: " + string(global.level) + ", Lives: " + string(global.player_lives));