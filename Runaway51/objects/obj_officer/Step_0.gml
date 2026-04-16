// ============================================================
// GRAVITY
// ============================================================
if (!place_meeting(x, y + 1, obj_wall)) {
    vsp += grav;
    if (vsp > max_fall) vsp = max_fall;
} else {
    if (vsp > 0) vsp = 0;
}

if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
} else {
    y += vsp;
}

// ============================================================
// UPDATE FACING DIRECTION
// ============================================================
if (state == OFFICER_STATE.PATROL) {
    // Get the actual movement direction from the path
    var _move_dir = 0;
    if (path_speed > 0) {
        // Get the next path position
        var _next_x = path_get_x(patrol_path, path_position + 0.05);
        if (_next_x != undefined) {
            _move_dir = sign(_next_x - x);
        }
    }
    
    if (_move_dir != 0) {
        facing = _move_dir;
        image_xscale = _move_dir;
    }
    // Keep existing facing if not moving
} else if (state == OFFICER_STATE.CHASE) {
    // Chase facing is already handled in the CHASE case
}

// ============================================================
// DETECTION
// ============================================================
var _can_see = false;
var _guard_cx = (bbox_left + bbox_right) / 2;
var _guard_cy = (bbox_top + bbox_bottom) / 2;

if (instance_exists(obj_player)) {
    var _dist = point_distance(_guard_cx, _guard_cy, obj_player.x, obj_player.y);
    
    if (_dist < detect_range) {
        var _angle_to_player = point_direction(_guard_cx, _guard_cy, obj_player.x, obj_player.y);
        var _look_angle = (facing == 1) ? 0 : 180;
        var _angle_diff = abs(angle_difference(_angle_to_player, _look_angle));
        
        // Check frontal cone
        if (_angle_diff <= detect_angle) {
            if (!collision_line(_guard_cx, _guard_cy, obj_player.x, obj_player.y, obj_wall, false, true)) {
                _can_see = true;
            }
        }
        
        // Close range — detect from ANY direction
        if (_dist < 80 && !collision_line(_guard_cx, _guard_cy, obj_player.x, obj_player.y, obj_wall, false, true)) {
            _can_see = true;
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
                path_end();
            } else {
                state = OFFICER_STATE.SUSPICIOUS;
                suspicious_timer = suspicious_duration;
                suspicious_look_timer = 0;
                path_end();
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
                path_start(patrol_path, patrol_speed, path_action_reverse, true);
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
            // Stop moving if player is invincible
            if (obj_player.invincible > 0) {
                // Face the player but don't move
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
                path_start(patrol_path, patrol_speed, path_action_reverse, true);
                break;
            }
            
            var _dir = sign(obj_player.x - _guard_cx);
            facing = _dir;
            image_xscale = _dir;
            
            // Don't move if very close — prevents overlapping
            if (_dist < 40) {
                break;
            }
            
            var _next_x = x + (chase_speed * _dir);
            var _on_ground = place_meeting(x, y + 1, obj_wall);
            var _ground_ahead = place_meeting(_next_x, y + 1, obj_wall);
            
            if (_on_ground && _ground_ahead) {
                if (!place_meeting(_next_x, y, obj_wall)) {
                    x = _next_x;
                }
            }
        } else {
            state = OFFICER_STATE.PATROL;
            path_start(patrol_path, patrol_speed, path_action_reverse, true);
        }
        break;

    case OFFICER_STATE.INCAPACITATED:
        stun_timer--;
        stun_star_angle += 3;
        if (stun_star_angle >= 360) stun_star_angle -= 360;
        stun_z_timer++;
        
        if (stun_timer <= 0) {
            stun_timer = 0;
            stun_z_timer = 0;
            stun_star_angle = 0;
            state = OFFICER_STATE.PATROL;
            path_start(patrol_path, patrol_speed, path_action_reverse, true);
        }
        break;
}