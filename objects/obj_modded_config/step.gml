scr_menu_getinput()

if (key_quit2 || key_back) instance_destroy()

bgscroll -= 1;

updown = key_down2 - key_up2
leftright = key_right2 + key_left2

if updown != 0 {
    sound_play("event:/sfx/ui/step");
    selection = clamp(selection+updown, -1, array_length(options[category].variables)-1)
}

if leftright != 0 {
    if selection > -1
    {
        sound_play("event:/sfx/ui/select");
        variable_global_set(options[category].variables[selection].variable,clamp(variable_global_get(options[category].variables[selection].variable)+leftright,0,array_length(options[category].variables[selection].options)-1));
    }
    else
    {
        sound_play("event:/sfx/ui/step");
        category += leftright;
        arrow = leftright * 12;
        if category >= array_length(options)
            category = 0;
        else if category < 0
            category = array_length(options)-1;
    }
}

arrow = lerp(arrow, 0, 0.25);