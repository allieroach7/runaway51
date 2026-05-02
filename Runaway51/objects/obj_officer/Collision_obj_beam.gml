if (state != OFFICER_STATE.INCAPACITATED) {
    state = OFFICER_STATE.INCAPACITATED;
    stun_timer = stun_duration;
    path_end();
    hspeed = 0;
    vsp = 0;
}

// Beam hit particles
if (instance_exists(obj_particle_manager)) {
    part_particles_create(obj_particle_manager.beam_ps, x, y, obj_particle_manager.beam_pt, 15);
}

with (other) {
    instance_destroy();
}

audio_play_sound(snd_stun,5,false)