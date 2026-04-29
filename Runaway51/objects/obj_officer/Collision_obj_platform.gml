// When hitting a wall, turn around in patrol state
if (state == OFFICER_STATE.PATROL) {
    patrol_direction *= -1;
    facing = patrol_direction;
    image_xscale = patrol_direction;
    hspeed = patrol_speed * patrol_direction;
    
    // Move out of wall slightly
    x += patrol_direction * 5;
}