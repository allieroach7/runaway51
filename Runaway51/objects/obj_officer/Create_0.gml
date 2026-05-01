
event_inherited();
// State machine
enum OFFICER_STATE {
    PATROL,
    SUSPICIOUS,
    CHASE,
    INCAPACITATED
}
state = OFFICER_STATE.PATROL;

// Movement
patrol_speed = 1;
chase_speed = 2.2;

hspeed = 0;

// Patrol variables (manual movement)
patrol_left_bound = x - 200;
patrol_right_bound = x + 200;
patrol_direction = 1;  // 1 = moving right, -1 = moving left

// Detection
detect_range = 300;
detect_range_close = 150;
lose_range = 450;
detect_angle = 60;

// Suspicious state
suspicious_timer = 0;
suspicious_duration = 90;
suspicious_look_timer = 0;

// Incapacitation
stun_timer = 0;
stun_duration = 6 * game_get_speed(gamespeed_fps);
stun_star_angle = 0;
stun_z_timer = 0;

// Store spawn position
spawn_x = x;
spawn_y = y;

// Initial patrol boundaries
patrol_left_bound = x - 200;
patrol_right_bound = x + 200;
patrol_direction = 1;


// Patrol path (GameMaker path resource - used for route reference)
patrol_path = path_add();
path_add_point(patrol_path, patrol_left_bound, spawn_y, 100);
path_add_point(patrol_path, patrol_right_bound, spawn_y, 100);
path_set_closed(patrol_path, true);
path_set_kind(patrol_path, 0);