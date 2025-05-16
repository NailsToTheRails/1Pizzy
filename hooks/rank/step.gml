if (instance_exists(obj_player1)) {
	if (obj_player1.character == "PZ") {
		if (global.rank == "P") {
			if brown {
				if floor(image_index) == image_number - 1
				{
					image_speed = 0.75;
					sprite_index = MOD_GLOBAL.prankanim;
				}
				if sprite_index == MOD_GLOBAL.prankanim && floor(image_index) == image_number - 1 {
					image_speed = 0;
					image_index = image_number - 1
				}
			}
		}
	}
}