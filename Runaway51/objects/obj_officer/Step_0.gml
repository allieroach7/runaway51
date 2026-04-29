// ============================================================
// GRAVITY
// ============================================================
if (!place_meeting(x, y + 1, obj_platform)) {
    vsp += grav;
    if (vsp > max_fall) vsp = max_fall;
} else {
    if (vsp > 0) vsp = 0;
}

if (place_meeting(x, y + vsp, obj_platform)) {
    while (!place_meeting(x, y + sign(vsp), obj_platform)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp;
}

// ============================================================
// PATROL MOVEMENT (Now manual to bugfix instead of path-based)
// ============================================================
if (state == OFFICER_STATE.PATROL) {
    // Move in current direction
    hspeed = patrol_speed * patrol_direction;
    
    // Check if we hit a wall or reached boundary
    var _next_x = x + hspeed;
    
    if (place_meeting(_next_x, y, obj_platform)) {
        // Hit wall - turn around
        patrol_direction *= -1;
        hspeed = patrol_speed * patrol_direction;
        _next_x = x + hspeed;
    }
    
    // Check boundaries
    if (_next_x > patrol_right_bound) {
        patrol_direction = -1;
        hspeed = patrol_speed * patrol_direction;
        _next_x = patrol_right_bound;
    } else if (_next_x < patrol_left_bound) {
        patrol_direction = 1;
        hspeed = patrol_speed * patrol_direction;
        _next_x = patrol_left_bound;
    }
    
    // Apply movement
    x = _next_x;
}

// ============================================================
// UPDATE FACING DIRECTION
// ============================================================
if (state == OFFICER_STATE.PATROL) {
    // Set facing based on patrol direction
    if (patrol_direction > 0) {
        facing = 1;
        image_xscale = 1;   // Change to -1 if sprite faces left by default
    } else {
        facing = -1;
        image_xscale = -1;  // Change to 1 if sprite faces left by default
    }
}

// ============================================================
// DETECTION
// ============================================================
var _can_see = false;
var _guard_cx = x;
var _guard_cy = y;

if (instance_exists(obj_player)) {
    var _player_cx = obj_player.x;
    var _player_cy = obj_player.y;
    var _dist = point_distance(_guard_cx, _guard_cy, _player_cx, _player_cy);
    
    if (_dist < detect_range) {
        var _angle_to_player = point_direction(_guard_cx, _guard_cy, _player_cx, _player_cy);
        var _look_angle = (facing == 1) ? 0 : 180;
        var _angle_diff = abs(angle_difference(_angle_to_player, _look_angle));
        
        // Frontal cone detection
        if (_angle_diff <= detect_angle) {
            if (!collision_line(_guard_cx, _guard_cy, _player_cx, _player_cy, obj_platform, false, true)) {
                _can_see = true;
            }
        }
        
        // Close range detection (360 degrees)
        if (_dist < 80) {
            if (!collision_line(_guard_cx, _guard_cy, _player_cx, _player_cy, obj_platform, false, true)) {
                _can_see = true;
            }
        }
    }
}

// ============================================================
// STATE MACHINE
// ============================================================
switch (state) {

    case OFFICER_STATE.PATROL:
        if (_can_see && instance_exists(obj_player)) {
            var _dist = point_distance(_guard_cx, _guard_cy, obj_player.x, obj_player.y);
            if (_dist < detect_range_close) {
                state = OFFICER_STATE.CHASE;
                hspeed = 0;
            } else {
                state = OFFICER_STATE.SUSPICIOUS;
                suspicious_timer = suspicious_duration;
                suspicious_look_timer = 0;
                hspeed = 0;
            }
        }
        break;

    case OFFICER_STATE.SUSPICIOUS:
        suspicious_look_timer++;
        if (suspicious_look_timer mod 30 == 0) {
            facing *= -1;
            image_xscale = facing;
        }
        
        suspicious_timer--;
        
        if (suspicious_timer <= 0) {
            if (_can_see) {
                state = OFFICER_STATE.CHASE;
            } else {
                state = OFFICER_STATE.PATROL;
                // Reset patrol direction to face original spawn direction
                patrol_direction = 1;
				update_patrol_boundaries();  // FIX TELEPORT
            }
        }
        
        if (instance_exists(obj_player)) {
            var _dist = point_distance(_guard_cx, _guard_cy, obj_player.x, obj_player.y);
            if (_dist < detect_range_close && _can_see) {
                state = OFFICER_STATE.CHASE;
            }
        }
        break;

    case OFFICER_STATE.CHASE:
        if (instance_exists(obj_player)) {
            if (obj_player.invincible > 0) {
                var _dir = sign(obj_player.x - _guard_cx);
                if (_dir != 0) {
                    facing = _dir;
                    image_xscale = _dir;
                }
                break;
            }
            
            var _dist = point_distance(_guard_cx, _guard_cy, obj_player.x, obj_player.y);
            
            if (_dist > lose_range) {
                state = OFFICER_STATE.PATROL;
                patrol_direction = (obj_player.x > x) ? 1 : -1;
				update_patrol_boundaries();  // FIX TELEPORT
                break;
            }
            
            var _dir = sign(obj_player.x - _guard_cx);
            facing = _dir;
            image_xscale = _dir;
            
            if (_dist < 40) {
                hspeed = 0;
                break;
            }
            
            var _next_x = x + (chase_speed * _dir);
            var _on_ground = place_meeting(x, y + 1, obj_platform);
            var _ground_ahead = place_meeting(_next_x, y + 1, obj_platform);
            
            if (_on_ground && _ground_ahead) {
                if (!place_meeting(_next_x, y, obj_platform)) {
                    x = _next_x;
                    hspeed = chase_speed * _dir;
                } else {
                    // Hit wall - lose interest
                    state = OFFICER_STATE.PATROL;
                    patrol_direction = (x > patrol_left_bound) ? -1 : 1;
					update_patrol_boundaries();  // FIX TELEPORT
                }
            }
        } else {
            state = OFFICER_STATE.PATROL;
            patrol_direction = (x > spawn_x) ? -1 : 1;
			update_patrol_boundaries();  // FIX TELEPORT
        }
        break;

    case OFFICER_STATE.INCAPACITATED:
        stun_timer--;
        stun_star_angle += 3;
        if (stun_star_angle >= 360) stun_star_angle -= 360;
        stun_z_timer++;
        hspeed = 0;
        
        if (stun_timer <= 0) {
            stun_timer = 0;
            stun_z_timer = 0;
            stun_star_angle = 0;
            state = OFFICER_STATE.PATROL;
            patrol_direction = (x > spawn_x) ? -1 : 1;
			update_patrol_boundaries();  // FIX TELEPORT
        }
        break;
}