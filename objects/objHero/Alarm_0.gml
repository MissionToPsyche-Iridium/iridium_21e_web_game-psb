//This is a loop that changes the oxygen value ever X seconds 
//This also looks for the oxygen value to "hit zero" then respawns
//the character back at the ship

if(room == rmLevel5) {
	oxygen = 0;
} else {
	oxygen = oxygen + 1;
	if (oxygen == oxygen_max)
	{
		room_goto(rmLevel1);
		objHero.x = 1104;
		objHero.y = 1312;
		oxygen = 0;
	}
}

alarm[0] = room_speed * 2;
