if character == "PZ"
{
    scr_fmod_soundeffect(jumpsnd, x, y);
	switch (global.walljumptype) 
	{
		case 3:
		case 0:
	    input_buffer_jump = 0;
	    key_jump = false;
	    railmovespeed = 0;
	
	    image_index = 0;
	    sprite_index = spr_walljumpstart;
	    movespeed = 4 * xscale;
	    vsp = -14;
	
	    jumpstop = false;
	    xscale *= -1;
	    dir = xscale;
	    walljumpbuffer = 4;
	
	    state = "PZ_wallkick";
	
	    fmod_event_instance_set_parameter(MOD_GLOBAL.PZ_snd_wallkick, "state", 0, true);
	    fmod_event_instance_play(MOD_GLOBAL.PZ_snd_wallkick);

	    repeat (5)
	    {
	        with instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_secretpoof) {
			sprite_index = MOD_GLOBAL.spr_spinningFireParticle			
		}
		}
            
    with (instance_create(x, y, obj_jumpdust, 
    {
        playerID: id
    }))
    {
		image_speed = 0.85
        image_xscale = other.xscale;
        sprite_index = MOD_GLOBAL.spr_wallkick_effect;
    }
	break;
case 1:
case 2:
	   
    repeat (5)
            {
                with instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_secretpoof) {
				sprite_index = MOD_GLOBAL.spr_spinningFireParticle			
			}
            }
            
            with (instance_create(x, y, obj_jumpdust, 
            {
                playerID: id
            }))
            {
		image_speed = 0.85
                image_xscale = other.xscale;
                sprite_index = MOD_GLOBAL.spr_wallkick_effect;
            }

    		input_buffer_jump = 0;
    		key_jump = false;
    		railmovespeed = 0;

    		sprite_index = spr_mach4;
   		 state = states.mach3;
   		 vsp = -10;

  		  jumpstop = false;
    		xscale *= -1;
	if global.walljumptype == 1 
	{
    	if movespeed > 12  
     	{
     		state = states.mach3
     	}
    	else if movespeed < 12  
     	{
     		state = states.mach2
     	}
	} 
	else 
	{
		if movespeed > 12  
		{
     		state = states.mach3
			movespeed = 50
 		}
		else if movespeed < 12  
 		{
 			state = states.mach2
			movespeed = 50
 		}
	}
break;
    
}
    return false;
}
