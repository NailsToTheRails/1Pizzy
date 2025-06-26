alarm[0] = 3;
if !instance_exists(obj_player1) exit;

if (obj_player1.character == "PZ" && room == tower_soundtest)
instance_create(6720,370,obj_PZpainterDancer)