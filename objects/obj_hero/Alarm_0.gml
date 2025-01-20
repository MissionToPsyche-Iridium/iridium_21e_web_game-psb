//This is a loop that changes the oxygen value ever X seconds 
//This also looks for the oxygen value to "hit zero" then respawns
//the character back at the ship

oxygen = oxygen + 1;
if (oxygen == oxygen_max)
{
	obj_hero.x = xstart;
	obj_hero.y = ystart;
	oxygen = 0;
}
alarm[0] = room_speed * 2;
