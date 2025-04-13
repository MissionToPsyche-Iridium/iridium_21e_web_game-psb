
camera_set_view_pos(view_camera[0], xpos,ypos);

//camera_set_view_size(view_camera[0],xCameraSize,yCameraSize);

if (!fadeout) a = Approach(a,0.25,0.005); else a = Approach(a,1,0.005);

l += 0.5;

print = string_copy(str,1,l);
if (l > string_length(str)+180) && (next < array_length_1d(strings)-1)
{
	next = next+1;
	l = 0;
	//if (next == array_length_1d(strings)-1) holdspace++;
}
str = strings[next];

if (keyboard_check_direct(vk_space))
{
	holdspace++;
}

if (holdspace > 80) || (xpos <= 250 ) fadeout = 1;

if (a == 1) && (fadeout == 1) {
	camera_set_view_pos(view_camera[0], 1048, 640);
	room_goto(rm_start);
}