function update_patrol_boundaries() {
    // Create new patrol boundaries based on current position
    patrol_left_bound = x - 200;
    patrol_right_bound = x + 200;
    
    // Set direction to face away from the nearest boundary
    if (x - spawn_x > 0) {
        patrol_direction = -1;  // Facing left
    } else {
        patrol_direction = 1;   // Facing right
    }
}