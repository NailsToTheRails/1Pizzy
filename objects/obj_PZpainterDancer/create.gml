persistent = false;
visible = true;
spr_idle = sprite_add(MOD_PATH + "/sprites/PainterIdle.png", 13, false, false, 110, 110);
spr_dance = sprite_add(MOD_PATH + "/sprites/PainterDance.png", 18, false, false, 110, 110);
sprite_set_speed(spr_idle, 0.5, spritespeed_framespergameframe);
sprite_set_speed(spr_dance, 0.4, spritespeed_framespergameframe);

sprite_index = spr_idle;