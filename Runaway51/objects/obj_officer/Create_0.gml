// State machine
enum OFFICER_STATE {
    PATROL,
    SUSPICIOUS,
    CHASE,
    INCAPACITATED
}
state = OFFICER_STATE.PATROL;

// Movement
patrol_speed = 2;
chase_speed = 3.2;
grav = 0.25;
vsp = 0;
max_fall = 12;
facing = 1;

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
stun_duration = 10 * game_get_speed(gamespeed_fps);
stun_star_angle = 0;
stun_z_timer = 0;

// Patrol path
spawn_x = x;
spawn_y = y;

patrol_path = path_add();
path_add_point(patrol_path, spawn_x - 200, spawn_y, 100);
path_add_point(patrol_path, spawn_x + 200, spawn_y, 100);
path_set_closed(patrol_path, true);
path_set_kind(patrol_path, 0);
path_start(patrol_path, patrol_speed, path_action_reverse, true);