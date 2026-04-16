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
            
            // Force immediate position change so you feel it
            if (!instance_place(x + (_knockback_dir * 30), y, obj_wall)) {
                x += _knockback_dir * 30;
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
        if (!instance_place(x + knockback_hsp, y, obj_wall)) {
            x += knockback_hsp;
        } else {
            knockback_hsp = 0;
        }
        knockback_hsp *= (1 - knockback_fric);
    } else {
        knockback_hsp = 0;
    }
    
    // Gravity still applies
    if (!instance_place(x, y + 1, obj_wall)) {
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
    
    if (instance_place(x, y + 1, obj_wall)) {
        climbing = false;
        sprite_index = spr_player;
    }
}

// ============================================================
// PLAYER MOVEMENT
// ============================================================
if (keyboard_check(vk_left)) {
    image_xscale = -1;
    if (!instance_place(x - move_speed, y, obj_wall)) {
        x -= move_speed;
    }
}

if (keyboard_check(vk_right)) {
    image_xscale = 1;
    if (!instance_place(x + move_speed, y, obj_wall)) {
        x += move_speed;
    }
}

// Jumping
if (keyboard_check(vk_up)) {
    if (instance_place(x, y + 1, obj_wall)) {
        vspeed = jump_height;
    }
}

// Gravity
if (instance_place(x, y + 1, obj_wall)) {
    gravity = 0;
} else {
    gravity = 0.25;
}

// Speed limit
if (vspeed > 12) vspeed = 12;

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