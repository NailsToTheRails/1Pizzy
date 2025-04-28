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
with (obj_key)
{
if (other.character == "PZ")
sprite_index = MOD_GLOBAL.KEY;
}
with (obj_keyfollow)
{
if (other.character == "PZ")
sprite_index = MOD_GLOBAL.KEYFOLLOW;
}
	switch(state) {
 case "fireassdash":
      hsp = movespeed * xscale;
    movespeed = Approach(movespeed, 11, 0.15);
    
    if (floor(image_index) < 12)
        vsp = 0;
    
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
    
    with (instance_place((x + hsp), y, obj_ratblock)) 
		instance_destroy()

    with (instance_place((x + hsp), y, obj_destructibles)) 
		instance_destroy()    

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
		if (character == "PZ") {
	switch (global.walljumptype) {
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
	if (sprite_index == spr_Sjumpcancelstart)
   {
	sprite_index = spr_mach4;
	state = states.mach3;
	vsp = -10;
	hsp = 0;
	if (global.walljumptype == 1) {
		movespeed = 13;	
	} else {
		movespeed = 40;
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
		if isgustavo
			state = states.ratmount;
		image_index = 0;
		if (character == "PZ") 
		{
			if IT_final_key() 
			{
				ds_list_add(global.KeyFollowerList, instance_create(x, y, obj_spookeyMODfollow));
			} else 
			{
			if IT_final_key()
				ds_list_add(global.KeyFollowerList, instance_create(x, y, obj_keyfollow));
			}
		}
			
	}
	break;
    }