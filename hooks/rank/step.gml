if (instance_exists(obj_player1)) {
	if (obj_player1.character == "PZ") {
		if (global.rank == "P") {
			if sprite_index == MOD_GLOBAL.prankanim && floor(image_index) == image_number - 1 {
				image_speed = 0;
				image_index = image_number - 1
			}
		}
	}
if brown {
	// HARD CODE THAT SHIT
	if (image_index > 51) && (global.rank == "P") && (obj_player1.character == "PZ") 
	{
		image_speed = 0.75;
		sprite_index = MOD_GLOBAL.prankanim;
	}
}
}