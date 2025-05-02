static PZ_sprite_previous = undefined;
static PZ_texture_previous = undefined;
static PZ_state_previous = undefined;
static blue_color = undefined;
static blue_color_dark = undefined;
state PZ_imagedex_previous = undefined;
var mod_instance_exists = function(_object)
{
    with obj_mod_object
    {
        if __OBJECT == _object
        {
            return true
        }
    }
    return false
} // made by gryphon ^^ thanks gryphon

if character == "PZ"
{
    if PZ_sprite_previous != sprite_index
    {
        // Always start his idle animation from first frame
        if sprite_index == spr_idle
            image_index = 0;

        PZ_sprite_previous = sprite_index;
    }

    if PZ_texture_previous != global.palettetexture or blue_color == undefined or blue_color_dark == undefined
    {
        // Detect afterimage color
        if !sprite_exists(global.palettetexture)
        {
            blue_color = #872CD2;
            blue_color_dark = #200239;
        }
        else
        {
            var surf = surface_create(1, 1);
            surface_set_target(surf);
            draw_sprite(global.palettetexture, 0, sprite_get_xoffset(global.palettetexture), sprite_get_yoffset(global.palettetexture));
            surface_reset_target();
            var col = surface_getpixel(surf, 0, 0);
            surface_free(surf);

            blue_color = col;
            blue_color_dark = make_colour_hsv(colour_get_hue(col), colour_get_saturation(col) * 1.5, colour_get_value(col) * 0.35);
        }

        PZ_texture_previous = global.palettetexture;
    }

    if PZ_state_previous != state
    {
        if state == states.mach3 && PZ_state_previous == states.mach2
        {
            flash = true;
            sound_play_3d("event:/sugary/machstart", x, y);
        }
        if state == states.mach3
            spr_machclimbwall = spr_machclimbwall3;
		if state == states.fireass
		{
			fmod_event_instance_play(global.snd_fireass);
		}
        PZ_state_previous = state;
    }

    // sprite tweaks
    global.force_mach_shader = true;
    global.force_blue_afterimage = (state == "PZ_wallkick");
    
    global.mach_colors = [( #30A8F8), ( #E85098)];
    global.mach_colors_dark = [( #0F3979), ( #5F0920)];

    global.blueimg_color = blue_color;
    global.blueimg_color_dark = blue_color_dark;

    spr_finishingblow5 = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4);

    // charge effect
    if state == states.tumble or state == states.climbwall
    {
        if ((state == states.climbwall && wallspeed > 12) or (state != states.climbwall && movespeed > 12)) && !instance_exists(chargeeffectid)
        {
            with instance_create(x, y, obj_chargeeffect)
            {
                playerid = other.id;
                other.chargeeffectid = id;
            }
        }
    }

    // wallkick sound
    if sprite_index == spr_walljumpstart or sprite_index == spr_walljumpend
        sound_instance_move(MOD_GLOBAL.PZ_snd_wallkick, x, y);
    else if sound_is_playing(MOD_GLOBAL.PZ_snd_wallkick) && state != states.backbreaker
        fmod_event_instance_set_parameter(MOD_GLOBAL.PZ_snd_wallkick, "state", 1, true);
    
    // state specific
    switch state
    {
        #region CROUCH

        case states.crouch:
            if scr_slapbuffercheck()
            {
                scr_resetslapbuffer();
                scr_modmove_crouchslide();
            }
            break;
        
        #endregion
        #region CLIMBWALL

        case states.climbwall:
            if wallspeed >= 12 && spr_machclimbwall == spr_machclimbwall2
            {
                flash = true;
                sound_play_3d("event:/sugary/machstart", x, y);
            }
            spr_machclimbwall = wallspeed >= 12 ? spr_machclimbwall3 : spr_machclimbwall2;
            break;

        #endregion
        #region ROLL/DIVE
        
        case states.tumble:
            if movespeed > 12 && sprite_index == spr_machroll
            {
                sprite_index = spr_backslideland;
                image_index = 0;
            }
            break;
        
        #endregion
        #region SUPER JUMP

        case states.Sjump:
	if (global.walljumptype == 0) {
            move = key_left + key_right;
            if move != 0 && sprite_index == spr_superjump
            {
                if xscale != move
                {
                    movespeed = 0;
                    xscale = move;
                }
                hsp = movespeed * sign(move);
                movespeed = Approach(movespeed, 3, 0.5);
            }
	} else {
	move = key_left + key_right;
	}
            break;
        
        #endregion
        #region WALL KICK

        case "PZ_wallkick":
            tv_do_expression(MOD_GLOBAL.spr_tv_exprmach2);    
            
            suplexmove = true;
            move = key_left + key_right;
            hsp = movespeed;
            
            if move != 0
            {
                movespeed = Approach(movespeed, 10 * move, 0.8);
                dir = move;
            }
            else
                movespeed = Approach(movespeed, 0, 0.45);
            
            if check_solid(x + sign(movespeed), y) && scr_preventbump()
                movespeed = 0;
            
            if !grounded && key_down
            {
                vsp = max(vsp, 14);
                if sprite_index != spr_walljumpfastfallstart && sprite_index != spr_walljumpfastfall
                {
                    sprite_index = spr_walljumpfastfallstart;
                    image_index = 0;
                    fmod_event_instance_play(snd_dive);
                }
                else if input_buffer_jump > 0 && sprite_index == spr_walljumpfastfall
                {
                    input_buffer_jump = 0;
                    state = states.freefall;
                    image_index = 0;
                    sprite_index = spr_poundcancelstart;
                    dir = xscale;
                    hsp = movespeed * xscale;
                    movespeed = abs(movespeed);
                    vsp = -6;
                    freefallsmash = 0;
                }
            }
            
            if scr_slapbuffercheck()
            {
                scr_resetslapbuffer();
                jumpstop = true;
                xscale = dir;
                
                if !key_up
                {
                    sprite_index = spr_walljumpcancelstart;
                    image_index = 0;
                    movespeed = 12;
                    hsp = movespeed * xscale;
                    vsp = -5;
                    state = states.mach3;
                    sound_play_3d("event:/sugary/machstart", x, y);
                    //fmod_studio_event_instance_start(sndWallkickCancel);
                }
                else
                    scr_modmove_uppercut();
            }
            
            if grounded && vsp >= 0
            {
                sound_play_3d("event:/sfx/playerN/wallbounceland", x, y);
                flash = true;
                xscale = dir;
                
                if key_attack
                {
                    
                    repeat (5)
                    {
                        with instance_create(random_range(bbox_left, bbox_right), random_range(bbox_top, bbox_bottom), obj_secretpoof) {
				sprite_index = MOD_GLOBAL.spr_spinningFireParticle			
			}
                    }
                    
                    
                    movespeed = 12;
                    hsp = movespeed * dir;
                    state = states.mach3;
                    image_index = 0;
                    sprite_index = spr_rollgetup;
                    sound_play_3d("event:/sugary/machstart", x, y);
                }
                else
                {
                    landAnim = true;
                    movespeed = 8;
                    hsp = movespeed * dir;
                    state = states.normal;
                    instance_create(x, y, obj_landcloud)
                    sound_play_3d(stepsnd, x, y);
                }
            }
            
            if image_index >= image_number - 1
            {
                if sprite_index == spr_walljumpstart
                    sprite_index = spr_walljumpend;
                if sprite_index == spr_walljumpfastfallstart
                    sprite_index = spr_walljumpfastfall;
            }

            if key_shoot2
			    scr_perform_move(2, state);
	    
             if (!mod_instance_exists(obj_wallkickDust))
       		 instance_create(x + random_range(-40, 40), y + random_range(-40, 40), obj_wallkickDust);

            if punch_afterimage > 0
                punch_afterimage--;
            else
            {
                punch_afterimage = 5;
                with create_blue_afterimage(x, y, sprite_index, image_index, xscale)
                    playerid = other.id;
            }

            scr_dotaunt();
            image_speed = 0.45;
            break;

        #endregion
        #region MACH 3
        
        case states.mach3:
            if sprite_index == spr_walljumpcancelstart && image_index >= image_number - 1
                sprite_index = spr_walljumpcancel;
            if (sprite_index == spr_walljumpcancelstart or sprite_index == spr_walljumpcancel) && grounded
                sprite_index = spr_mach4;
            break;

        #endregion
         #region ROCKET
        case states.rocket:
      
            if (key_left == -1 && xscale == 1 && !grounded)
             state = 185;
            
            if (key_right && xscale == -1 && !grounded)
            state = 185;

        break;

        case states.rocketslide:
            if (!grounded) 
           {sprite_index = MOD_GLOBAL.spr_rocketturnair;
           movespeed *= 1.01;;
           }
            else
            {movespeed *= 1.022;}

        break;

        #endregion
               #region FIREMOUTH
        case states.firemouth:
            if (grounded && image_index > 8)
            {
                if (key_jump2)
                { vsp = -20;}
                else
                {
                vsp = -14;
                //PZ_imagedex_previous = image_index; 
                }
            }
          /*  if (!grounded && !instance_exists(obj_firemouthflame) && !key_jump2 && vsp >= -8)
            {
                if vsp < 8
                {
                    if (sprite_index != spr_firemouth)
                    {
                    sprite_index = spr_firemouth;
                    
                    }
                }
                else
                {sprite_index = spr_firemouthspin;}
            }
            */

        break;
        
        #endregion

		  #region FIRE ASS

        case states.fireass:
			if (global.walljumptype == 0) 
			{
				if scr_slapbuffercheck()//(input_buffer_slap > 0)
		        {
					if (sprite_index = spr_fireass) 
					{
			            //input_buffer_slap = 0;
			            scr_resetslapbuffer();
			            sprite_index = MOD_GLOBAL.spr_fireass_dash;
			            image_index = 0;
						scr_fmod_soundeffect(global.snd_explosion, x, y);
			            state = "fireassdash";
			            
			            if (move != 0)
			                xscale = move;
			            
			            movespeed = 12;
			            vsp = 0;
		        	}
				}
			}
            break;
        
        #endregion
        #region KNIGHT
        case 38:
          if (global.experimenPZ = 1)
        {
            if(PZ_sprite_previous == spr_knightpepdoublejump && key_jump2 && !grounded)
            {
                state = "PZknightGlide"
            }
        }
        break;
        #endregion
        #region KNIGHT ACTUAL GLIDE
        case "PZknightGlide":
            sprite_index = MOD_GLOBAL.spr_PZKnightGlide;
            move = key_left + key_right;
            if (!key_jump2)
            {
                vsp = Approach(vsp,4,0.5)
            }
            else
            {
                vsp = Approach(vsp,-4,0.5)
            }
            movespeed = hsp;
            hsp = Approach(hsp,10*move,0.6);
            if (move != 0)
            {
                obj_player1.xscale = move;
            }

            if (key_down)
            {
                state = 47;
                vsp = 7;
                sprite_index = spr_knightpepdowntrust;
            }
            if (grounded)
            {
                if (move != 0)
                {
                state = 38;
                sprite_index = spr_knightpepcharge;
                hsp = -8 * image_xscale;
                }
                else
                {
                state = 47;
                sprite_index = spr_knightpepland;
                }
            }
        break;
        #endregion

	  #region UPPERCUT PETALS

        case states.punch:
    	static petal_timer = 2;
if (sprite_index = spr_breakdanceuppercut) {
	 if (!petal_timer-- && vsp <= 0)
  	  {
    	    with (instance_create(x + random_range(-40, 40), y + random_range(-40, 40), obj_moddeddebris))
   	     {
     	       image_angle = 0;
     	       image_alpha = 5;
      	      image_speed = 0.35;
        	    vsp = 2;
            	hsp = 0;
            	grav = 0.35;
            	terminalVelocity = 1;
        	}
        
        	petal_timer = 4;
    	}
}
            break;
        
        #endregion
case states.keyget:

return false;
break;
    }
}
