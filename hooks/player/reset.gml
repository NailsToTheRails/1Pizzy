if (global.KeyFollowerList) {
	if (ds_list_size(global.KeyFollowerList) > 0)
		ds_list_clear(global.KeyFollowerList);
}
instance_destroy(obj_spookeyMODfollow);