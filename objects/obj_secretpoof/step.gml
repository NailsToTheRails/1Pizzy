x += (hsp * dir_h);
y += (vsp * dir_v);
hsp = Approach(hsp, 0.2, 0.3);
vsp = Approach(vsp, 0.2, 0.3);
shake = random_range(-1, 1);
image_angle += dir_h;
x += shake;
y += shake;