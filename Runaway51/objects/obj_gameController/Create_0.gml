// Initialize ALL global variables
global.level = 1;
global.keys_needed = 2;  // Level 1 needs 2 keys
global.player_lives = 3;

// Also initialize any other globals you might use
// global.score = 0;
// global.difficulty = 1;

show_debug_message("Game Controller initialized - Level: " + string(global.level) + ", Lives: " + string(global.player_lives));