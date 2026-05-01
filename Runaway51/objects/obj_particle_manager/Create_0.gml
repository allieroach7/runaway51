// Beam hit particles (green alien energy)
beam_ps = part_system_create();
beam_pt = part_type_create();
part_type_shape(beam_pt, pt_shape_flare);
part_type_size(beam_pt, 0.2, 0.5, -0.02, 0);
part_type_life(beam_pt, 15, 30);
part_type_speed(beam_pt, 1, 3, 0, 0);
part_type_direction(beam_pt, 0, 360, 0, 0);
part_type_colour3(beam_pt, c_lime, c_green, c_white);
part_type_alpha3(beam_pt, 1, 0.6, 0);

// Player hit particles (red damage)
hit_ps = part_system_create();
hit_pt = part_type_create();
part_type_shape(hit_pt, pt_shape_star);
part_type_size(hit_pt, 0.2, 0.4, -0.02, 0);
part_type_life(hit_pt, 20, 40);
part_type_speed(hit_pt, 1, 3, 0, 0);
part_type_direction(hit_pt, 0, 360, 0, 0);
part_type_colour3(hit_pt, c_red, c_orange, c_yellow);
part_type_alpha3(hit_pt, 1, 0.5, 0);

// Key collect particles (gold sparkle)
key_ps = part_system_create();
key_pt = part_type_create();
part_type_shape(key_pt, pt_shape_flare);
part_type_size(key_pt, 0.3, 0.6, -0.01, 0);
part_type_life(key_pt, 20, 40);
part_type_speed(key_pt, 0.5, 2, 0, 0);
part_type_direction(key_pt, 0, 360, 0, 0);
part_type_colour3(key_pt, c_yellow, c_orange, c_white);
part_type_alpha3(key_pt, 1, 0.8, 0);