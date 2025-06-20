if (character != "PZ") 
{
	PZ_taunt_buffer = 1
	exit;
}
//IDK anymore man
//if tauntsnd != global.yaebal fmod_event_instance_release(tauntsnd)
if PZ_taunt_buffer or global.yaebal != tauntsnd
{
	PZ_taunt_buffer = 0
	fmod_event_instance_release(tauntsnd)
	switch (global.tauntstyle) 
	{
		case 0: global.yaebal = fmod_event_create_instance("event:/sugary/taunt"); break;
		case 1: global.yaebal = fmod_event_create_instance("event:/sugary/tauntOLD"); break;
		case 2: global.yaebal = fmod_event_create_instance("event:/sfx/pep/taunt"); break;
	}
}
tauntsnd = global.yaebal

with (obj_pizzakinparent)
{
	if (global.toppinstyle == 0) 
	{
	    switch (object_index)
	    {
		case obj_pizzakinshroom:  
			image_speed = 0.35
			if (sprite_index == spr_taunt) image_speed = 0
			spr_intro = spr_toppinshroom_intro;
			spr_idle = spr_toppinshroom;
			spr_run = spr_toppinshroom_run;
			spr_panic = spr_toppinshroom_panic;
			spr_taunt = spr_toppinshroom_taunt;
			spr_supertaunt = noone
			spr_panicrun = noone
			spr_intro_strongcold = spr_xmasshroomtoppin_intro;
			spr_idle_strongcold = spr_xmasshroomtoppin_idle;
			spr_run_strongcold = spr_xmasshroomtoppin_walk;
		break;
		case obj_pizzakincheese:  
			image_speed = 0.35
			if (sprite_index == spr_taunt) image_speed = 0
			spr_intro = spr_toppincheese_intro;
			spr_idle = spr_toppincheese;
			spr_run = spr_toppincheese_run;
			spr_panic = spr_toppincheese_panic;
			spr_taunt = spr_toppincheese_taunt;
			spr_supertaunt = noone
			spr_panicrun = noone
			spr_intro_strongcold = spr_xmascheesetoppin_intro;
			spr_idle_strongcold = spr_xmascheesetoppin_idle;
			spr_run_strongcold = spr_xmascheesetoppin_walk;
		break;
		case obj_pizzakinsausage: 
			image_speed = 0.35
			if (sprite_index == spr_taunt) image_speed = 0
			spr_intro = spr_toppinsausage_intro;
			spr_idle = spr_toppinsausage;
			spr_run = spr_toppinsausage_run;
			spr_panic = spr_toppinsausage_panic;
			spr_taunt = spr_toppinsausage_taunt;
			spr_supertaunt = noone
			spr_panicrun = noone
			spr_intro_strongcold = spr_xmassausagetoppin_intro;
			spr_idle_strongcold = spr_xmassausagetoppin_idle;
			spr_run_strongcold = spr_xmassausagetoppin_walk;
		break;
		case obj_pizzakintomato:  
			image_speed = 0.35
			if (sprite_index == spr_taunt) image_speed = 0
			spr_intro = spr_toppintomato_intro;
			spr_idle = spr_toppintomato;
			spr_run = spr_toppintomato_run;
			spr_panic = spr_toppintomato_panic;
			spr_taunt = spr_toppintomato_taunt;
			spr_supertaunt = noone
			spr_panicrun = noone
			spr_intro_strongcold = spr_xmastomatotoppin_intro;
			spr_idle_strongcold = spr_xmastomatotoppin_idle;
			spr_run_strongcold = spr_xmastomatotoppin_walk;
		break;
		case obj_pizzakinpineapple: 
			image_speed = 0.35
			if (sprite_index == spr_taunt) image_speed = 0
			spr_intro = spr_toppinpineapple_intro;
			spr_idle = spr_toppinpineapple;
			spr_run = spr_toppinpineapple_run;
			spr_panic = spr_toppinpineapple_panic;
			spr_supertaunt = noone
			spr_panicrun = noone
			spr_taunt = spr_toppinpineapple_taunt;
			spr_intro_strongcold = spr_xmaspineappletoppin_intro;
			spr_idle_strongcold = spr_xmaspineappletoppin_idle;
			spr_run_strongcold = spr_xmaspineappletoppin_walk;
		break;
		} 
		} else {
			switch (object_index)
	    {
		case obj_pizzakinshroom:  
			image_speed = 0.75
			spr_intro = MOD_GLOBAL.spr_marshmallow_appear;
			spr_idle = MOD_GLOBAL.spr_marshmellow_idle;
			spr_run = MOD_GLOBAL.spr_marshmellow_walk;
			spr_supertaunt = MOD_GLOBAL.spr_marshmallow_supertaunt;
			spr_panicrun = MOD_GLOBAL.spr_marshmellow_panicWalk;
			spr_panic = MOD_GLOBAL.spr_marshmellow_panic;
			spr_taunt = MOD_GLOBAL.spr_marshmellow_taunt;
			spr_intro_strongcold = MOD_GLOBAL.spr_marshmallow_appear;
			spr_idle_strongcold = MOD_GLOBAL.spr_marshmellow_idle;
			spr_run_strongcold = MOD_GLOBAL.spr_marshmellow_walk;
			if (sprite_index == spr_taunt) image_speed = 0
		break;
		case obj_pizzakincheese:  
		image_speed = 0.75
			spr_intro = MOD_GLOBAL.spr_chocolate_appear;
			spr_idle = MOD_GLOBAL.spr_chocolate_idle;
			spr_run = MOD_GLOBAL.spr_chocolate_walk;
			spr_panicrun = MOD_GLOBAL.spr_chocolate_panicWalk;
			spr_supertaunt = MOD_GLOBAL.spr_chocolate_supertaunt;
			spr_panic = MOD_GLOBAL.spr_chocolate_panic;
			spr_taunt = MOD_GLOBAL.spr_chocolate_taunt;
			spr_intro_strongcold = MOD_GLOBAL.spr_chocolate_appear;
			spr_idle_strongcold = MOD_GLOBAL.spr_chocolate_idle;
			spr_run_strongcold = MOD_GLOBAL.spr_chocolate_walk;
			if (sprite_index == spr_taunt) image_speed = 0
		break;
		case obj_pizzakinsausage: 
		image_speed = 0.75
			spr_intro = MOD_GLOBAL.spr_gummyworm_appear;
			spr_idle = MOD_GLOBAL.spr_gummyworm_idle;
			spr_run = MOD_GLOBAL.spr_gummyworm_walk;
			spr_panicrun = MOD_GLOBAL.spr_gummyworm_panicWalk;
			spr_supertaunt = MOD_GLOBAL.spr_gummyworm_supertaunt;
			spr_panic = MOD_GLOBAL.spr_gummyworm_panic;
			spr_taunt = MOD_GLOBAL.spr_gummyworm_taunt;
			spr_intro_strongcold = MOD_GLOBAL.spr_gummyworm_appear;
			spr_idle_strongcold = MOD_GLOBAL.spr_gummyworm_idle;
			spr_run_strongcold = MOD_GLOBAL.spr_gummyworm_walk;
			if (sprite_index == spr_taunt) image_speed = 0
		break;
		case obj_pizzakintomato:  
		image_speed = 0.75
			spr_intro = MOD_GLOBAL.spr_crack_appear;
			spr_idle = MOD_GLOBAL.spr_crack_idle;
			spr_panicrun = MOD_GLOBAL.spr_crack_panicWalk;
			spr_run = MOD_GLOBAL.spr_crack_walk;
			spr_supertaunt = MOD_GLOBAL.spr_crack_supertaunt;
			spr_panic = MOD_GLOBAL.spr_crack_panic;
			spr_taunt = MOD_GLOBAL.spr_crack_taunt;
			spr_intro_strongcold = MOD_GLOBAL.spr_crack_appear;
			spr_idle_strongcold = MOD_GLOBAL.spr_crack_idle;
			spr_run_strongcold = MOD_GLOBAL.spr_crack_walk;
			if (sprite_index == spr_taunt) image_speed = 0
		break;
		case obj_pizzakinpineapple: 
		image_speed = 0.75
			spr_intro = MOD_GLOBAL.spr_candy_appear;
			spr_idle = MOD_GLOBAL.spr_candy_idle;
			spr_run = MOD_GLOBAL.spr_candy_walk;
			spr_panicrun = MOD_GLOBAL.spr_candy_panicWalk;
			spr_supertaunt = MOD_GLOBAL.spr_candy_supertaunt;
			spr_panic = MOD_GLOBAL.spr_candy_panic;
			spr_taunt = MOD_GLOBAL.spr_candy_taunt;
			spr_intro_strongcold = MOD_GLOBAL.spr_candy_appear;
			spr_idle_strongcold = MOD_GLOBAL.spr_candy_idle;
			spr_run_strongcold = MOD_GLOBAL.spr_candy_walk;
			if (sprite_index == spr_taunt) image_speed = 0
		break;
		} // toppin style bracket
	}
}
with (obj_key)
{
	if (global.spookeytoggle) sprite_index = MOD_GLOBAL.KEY;
}
with (obj_keyfollow)
{
	if (global.spookeytoggle && sprite_index == spr_key) sprite_index = MOD_GLOBAL.KEYFOLLOW;
}

if global.walljumptype == 3 && character == "PZ"
{
	if (state == states.mach3 || state == states.mach2 || state == states.mach1 || state == 104 || state == 5) && state != states.machcancel && !grounded && scr_check_groundpound2()
	{
		sprite_index = spr_playerN_divebombfall;
		state = states.machcancel;
		movespeed = movespeed * sign(hsp)
		vsp = 20;
		input_buffer_slap = 0;
		input_buffer_jump = 0;
		image_index = 0;
		return 0;
	}
}
switch(state) 
{
	case states.freefallland:
	if (global.walljumptype == 2 && character == "PZ") {
		if (key_attack) {
			movespeed = 50
			state = states.mach3
		}
	}
	break;
	case states.machslide:
	if (global.walljumptype == 2 && (sprite_index == spr_machslide || sprite_index == spr_machslidestart)) {
		movespeed = 0;
		hsp = lerp(hsp, 0, 0.6);
	}
	break;
	case states.freefall:
	if (global.walljumptype == 2 && character == "PZ") {
		// No Cheats Used Here - NJA
		if not (sprite_index == spr_poundcancel1 or sprite_index == spr_poundcancelstart) {
		freefallsmash = 50
		freefallvsp = 50
		vsp = 50
		}
	}
	break;
	case states.shotgun:
	if (global.walljumptype == 2 && sprite_index == spr_shotgunpullout && character == "PZ") {
			// No Promises - NJA
			movespeed = 50
			state = states.mach3
			exit;
	}
	break;
	case states.machcancel:
	image_speed = 0.5;
    move = key_left + key_right;
    
    /*if key_jump
    {
    	vsp = -20
    }*/
    if (scr_slapbuffercheck() > 0 && !key_up)
    {
        if (!shotgunAnim || move != 0 || global.shootbutton != 0)
        {
            input_buffer_shoot = 0;
            
            if (move != 0)
                xscale = move;
            
            scr_resetslapbuffer();
            key_slap = false;
            key_slap2 = false;
            jumpstop = true;
            
            if (vsp > -5)
                vsp = -5;
            
            state = 104;
            movespeed = 12;
            sprite_index = spr_playerN_sidewayspin;
            
            with (instance_create(x, y, obj_crazyrunothereffect))
                copy_player_scale(other);
            
            image_index = 0;
            particle_set_scale(5, xscale, 1);
            create_particle(x, y, 5, 0);
        }
        else
        {
            if (savedmove != 0)
                xscale = savedmove;
            
            scr_shotgunshoot();
        }
    }
	break;
	case "fireassdash":
	hsp = movespeed * xscale;
	movespeed = Approach(movespeed, 11, 0.15);

	if (floor(image_index) < 12) vsp = 0;

	sprite_index = MOD_GLOBAL.spr_fireass_dash;

    if (floor(image_index) == (image_number - 1) || grounded)
    {
        image_index = 0;
        sprite_index = spr_fall;
        state = states.jump;
        
        if (key_attack)
        {
            sprite_index = spr_secondjump2;
            state = states.mach2;
        }
    }

    with (instance_place((x + hsp), y, obj_ratblock)) instance_destroy()

    with (instance_place((x + hsp), y, obj_destructibles)) instance_destroy()    

    if (place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destructibles) && !place_meeting(x + xscale, y, obj_ratblock))
    {
        sprite_index = spr_fall;
        state = states.jump;
        vsp = -12;
        jumpStop = true;
        movespeed = 0;
    }
    
    image_speed = 0.7;
    break;
	case states.Sjump:
	if (character == "PZ") 
	{
		switch (global.walljumptype) 
		{
			case 0:
			if sprite_index == spr_Sjumpcancelstart
			{
				vsp = 0;
				if (move != 0)
					xscale = move;
				if (floor(image_index) == (image_number - 1))
				{
					jumpstop = true;
					if !jetpackcancel
						vsp = -4;
					flash = true;
					movespeed = 13;
					image_index = 0;
					sprite_index = spr_Sjumpcancel;
					state = states.mach3;
					with (instance_create(x, y, obj_crazyrunothereffect))
						copy_player_scale(other);
				}
			}
			break;
			case 1:
			case 2:
			if (global.walljumptype == 2)
				sjumpvsp -= 5
			if (sprite_index == spr_Sjumpcancelstart)
			{
				sprite_index = spr_mach4;
				state = states.mach3;
				vsp = -10;
				hsp = 0;
				if (global.walljumptype == 1) 
				{
					movespeed = 13;	
				} 
				else 
				{
					movespeed = 45; // nja buff 40 > 45
				}
		
			}
			break;
		}
	}
	break;
	case states.keyget:
	hsp = 0;
	vsp = 0;
	image_speed = 0.35;
	movespeed = 0;
	mach2 = 0;
	jumpAnim = true;
	dashAnim = true;
	landAnim = false;
	moveAnim = true;
	stopAnim = true;
	crouchslideAnim = true;
	crouchAnim = true;
	machhitAnim = false;
	global.combotime = 60;
	sprite_index = spr_keyget;
	if (!keysound && floor(image_index) >= 16)
	{
		keysound = true;
		scr_fmod_soundeffect(snd_voiceok, obj_player1.x, obj_player1.y);
	}
	if (floor(image_index) == (image_number - 1))
	{
		global.keyget = false;
		state = states.normal;
		if isgustavo state = states.ratmount;
		image_index = 0;
		if (global.spookeytoggle) {
			ds_list_add(global.KeyFollowerList, instance_create(x, y, obj_spookeyMODfollow));
		} else {
			if IT_final_key() ds_list_add(global.KeyFollowerList, instance_create(x, y, obj_keyfollow));
		}
	}
	break;
}