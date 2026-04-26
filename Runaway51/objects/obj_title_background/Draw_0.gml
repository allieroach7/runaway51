// Draw dark gradient background
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);

// Draw some stars or effects (optional)
draw_set_color(c_white);
for (var i = 0; i < 100; i++) {
    draw_point(random(room_width), random(room_height));
}