// ============================================================
// INITIALIZE GLOBAL VARIABLES (Do this FIRST)
// ============================================================
if (!variable_global_exists("player_lives")) {
    global.player_lives = 3;
}
if (!variable_global_exists("level")) {
    global.level = 1;
}
if (!variable_global_exists("keys_needed")) {
    global.keys_needed = 2;
}

// ============================================================
// PLAYER VARIABLES
// ============================================================
//set gravity
gravity_direction = 270;

// Player stats - use global values
keys_collected = 0;
player_lives = global.player_lives;

// Movement variables (adjust to your values)
move_speed = 4;
jump_height = -8;
climb_speed = 3;
climbing = false;

// ============================================================
// COMBAT VARIABLES
// ============================================================
beam_cooldown = 0;
beam_cooldown_max = 10;
hit_stun = 0;
hit_stun_max = 30;
invincible = 0;
invincible_max = 60;
knockback_hsp = 0;
knockback_fric = 0.3;

// Debug
show_debug_message("Player created - Level: " + string(global.level) + 
                   ", Keys Needed: " + string(global.keys_needed) + 
                   ", Lives: " + string(player_lives));