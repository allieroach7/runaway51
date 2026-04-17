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
grav = 0.25;
vsp = 0;
max_fall = 12;
facing = 1;  // 1 = right, -1 = left
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