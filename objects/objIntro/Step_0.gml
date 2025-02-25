camera_set_view_pos(view_camera[0], xpos,ypos);
camera_set_view_size(view_camera[0],xCameraSize,yCameraSize);

if (!fadeout) a = Approach(a,0.25,0.005); else a = Approach(a,1,0.005);

l += 0.5;

print = string_copy(str,1,l);
if (l > string_length(str)+200) && (next < array_length_1d(strings)-1)
{
	next = next+1;
	l = 0;
	if (next == array_length_1d(strings)-1) holdspace++;
}

if (counter == 0)
{
	xCameraSize = Approach(xCameraSize,1280,0.4444);
	yCameraSize = Approach(yCameraSize,720,0.25);
	xpos = Approach(xpos,0,0.11);
	ypos = Approach(ypos,500,0.16);
	if( next >=4)
	{
		spcShip1.x= Approach(spcShip1.x,1020,3);
		spcShip1.y= Approach(spcShip1.y,637,1);
	}
}
str = strings[next];

if (keyboard_check_direct(vk_space))
{
	holdspace++;

}

if (holdspace > 80) || (xpos < 1) fadeout = 1;

//if (a == 1) && (fadeout == 1) room_goto_next();
