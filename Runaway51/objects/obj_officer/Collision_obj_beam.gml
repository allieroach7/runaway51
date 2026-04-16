if (state != OFFICER_STATE.INCAPACITATED) {
    state = OFFICER_STATE.INCAPACITATED;
    stun_timer = stun_duration;
    path_end();
    hspeed = 0;
    vsp = 0;
}

with (other) {
    instance_destroy();
}