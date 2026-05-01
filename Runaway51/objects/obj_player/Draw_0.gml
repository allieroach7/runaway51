// Alert shader
if (alert_intensity > 0) {
    shader_set(shd_alert);
    shader_set_uniform_f(u_alert_intensity, alert_intensity);
}

draw_self();

if (alert_intensity > 0) {
    shader_reset();
}