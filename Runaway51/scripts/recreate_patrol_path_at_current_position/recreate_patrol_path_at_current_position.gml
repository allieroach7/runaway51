function recreate_patrol_path_at_current_position() {
    // Delete old path
    if (patrol_path != -1) {
        path_delete(patrol_path);
    }
    
    // Create new path starting from current position
    patrol_path = path_add();
    path_add_point(patrol_path, x - 200, y, 100);
    path_add_point(patrol_path, x + 200, y, 100);
    path_set_closed(patrol_path, true);
    path_set_kind(patrol_path, 0);
}