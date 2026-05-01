// ============================================================
// GUARD COLLISION CHECK
// ============================================================
if (invincible <= 0) {
    var _guard = instance_nearest(x, y, obj_officer);
    if (_guard != noone) {
        var _dist = point_distance(x, y, _guard.x, _guard.y);
        if (_dist < 60 && _guard.state != OFFICER_STATE.INCAPACITATED) {
            var _knockback_dir = sign(x - _guard.x);
            if (_knockback_dir == 0) _knockback_dir = -_guard.facing;
            
            knockback_hsp = _knockback_dir * 12;
            vspeed = -5;
            gravity = 0.25;
            hit_stun = hit_stun_max;
            invincible = invincible_max;
			
			obj_player.player_lives -= 1; // removes 1 life when hit
			// Check player lives when hit before ending game if 0
			if (obj_player.player_lives <= 0) {
				room_goto(rm_gameover);
			}
            
            // Force immediate position change so you feel it
            if (!instance_place(x + (_knockback_dir * 30), y, obj_platform)) {
                x += _knockback_dir * 30;
				// Player hit particles
if (instance_exists(obj_particle_manager)) {
    part_particles_create(obj_particle_manager.hit_ps, x, y, obj_particle_manager.hit_pt, 15);
}
            }
            
            show_debug_message("KNOCKBACK! Dir: " + string(_knockback_dir) + " | Stun: " + string(hit_stun));
        }
    }
}

// ============================================================
// SKIP INPUT IF STUNNED (check BEFORE timers tick down)
// ============================================================
if (hit_stun > 0) {
    hit_stun--;
    if (invincible > 0) invincible--;
    
    // Apply knockback during stun
    if (abs(knockback_hsp) > 0.5) {
        if (!instance_place(x + knockback_hsp, y, obj_platform)) {
            x += knockback_hsp;
        } else {
            knockback_hsp = 0;
        }
        knockback_hsp *= (1 - knockback_fric);
    } else {
        knockback_hsp = 0;
    }
    
    // Gravity still applies
    if (!instance_place(x, y + 1, obj_platform)) {
        gravity = 0.25;
    } else {
        gravity = 0;
    }
    if (vspeed > 12) vspeed = 12;
    
    // Flash the sprite
    if (invincible mod 4 < 2) {
        image_alpha = 0.3;
    } else {
        image_alpha = 1;
    }
    
    exit;
}

// ============================================================
// INVINCIBILITY TIMER (runs after stun ends)
// ============================================================
if (invincible > 0) {
    invincible--;
    if (invincible mod 4 < 2) {
        image_alpha = 0.3;
    } else {
        image_alpha = 1;
    }
} else {
    image_alpha = 1;
}

// ============================================================
// LADDER LOGIC
// ============================================================
var on_ladder = instance_place(x, y, obj_ladder);

if (on_ladder) {
    if (keyboard_check(vk_up) || keyboard_check(vk_down)) {
        climbing = true;
        vspeed = 0;
        gravity = 0;
    }
} else {
    climbing = false;
}

if (climbing) {
    if (keyboard_check(vk_up)) {
        y -= climb_speed;
    }
    
    if (keyboard_check(vk_down)) {
        y += climb_speed;
    }
    
    if (instance_place(x, y + 1, obj_platform)) {
        climbing = false;
        sprite_index = spr_player;
    }
}

// ============================================================
// PLAYER MOVEMENT
// ============================================================
if (keyboard_check(vk_left)) {
    image_xscale = -1;
    if (!instance_place(x - move_speed, y, obj_platform)) {
        x -= move_speed;
    }
}

if (keyboard_check(vk_right)) {
    image_xscale = 1;
    if (!instance_place(x + move_speed, y, obj_platform)) {
        x += move_speed;
    }
}

// Jumping
if (keyboard_check(vk_up)) {
    if (instance_place(x, y + 1, obj_platform)) {
        vspeed = jump_height;
    }
}

// Gravity
if (instance_place(x, y + 1, obj_platform)) {
    gravity = 0;
} else {
    gravity = 0.25;
}

// Speed limit
if (vspeed > 12) vspeed = 12;


// --- CAMERA FOLLOW ---
if (view_enabled) {
    var _cam = view_camera[0];
    var _cx = x - (camera_get_view_width(_cam) / 2);
    var _cy = y - (camera_get_view_height(_cam) / 2);
    
    _cx = clamp(_cx, 0, room_width - camera_get_view_width(_cam));
    _cy = clamp(_cy, 0, room_height - camera_get_view_height(_cam));
    
    camera_set_view_pos(_cam, _cx, _cy);
}

// --- ALERT SHADER ---
// Check if any officer is chasing
var _any_chasing = false;
with (obj_officer) {
    if (state == OFFICER_STATE.CHASE) {
        _any_chasing = true;
        break;
    }
}

if (_any_chasing) {
    alert_intensity = min(alert_intensity + 0.05, 1.0);
} else {
    alert_intensity = max(alert_intensity - 0.03, 0);
}
// ============================================================
// ALIEN BEAM ATTACK (Q key)
// ============================================================
if (beam_cooldown > 0) beam_cooldown--;

if (keyboard_check_pressed(ord("Q")) && beam_cooldown <= 0) {
    var _facing = image_xscale;
    var _beam = instance_create_layer(x + (30 * _facing), y, "Instances", obj_beam);
    _beam.beam_dir = _facing;
    _beam.image_xscale = _facing;
    beam_cooldown = beam_cooldown_max;
}


// --- CHEAT CODES (for testing) ---

// Press 1 — Full lives
if (keyboard_check_pressed(ord("1"))) {
    player_lives = 3;
}

// Press 2 — Collect all keys
if (keyboard_check_pressed(ord("2"))) {
    keys_collected = global.keys_needed;
}

// Press 3 — Skip to next level
if (keyboard_check_pressed(ord("3"))) {
    if (room == rm_tutorial) {
        global.keys_needed = 2;
        room_goto(rm_level);
    } else if (room == rm_level) {
        global.keys_needed = 6;
        room_goto(rm_level2);
    } else if (room == rm_level2) {
        room_goto(rm_win);
    }
}
// Press 4 — Stun all guards
if (keyboard_check_pressed(ord("4"))) {
    with (obj_officer) {
        state = OFFICER_STATE.INCAPACITATED;
        stun_timer = stun_duration;
        path_end();
        hspeed = 0;
        vsp = 0;
    }
}

// Press 5 — Instant win
if (keyboard_check_pressed(ord("5"))) {
    room_goto(rm_win);
}

// Press 6 — Instant game over
if (keyboard_check_pressed(ord("6"))) {
    room_goto(rm_gameover);
}