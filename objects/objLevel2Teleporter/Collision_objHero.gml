objHero.x = 1344;
objHero.y = 416;
room_goto(rmLevel2);

global.roboticsComplete = 1;
global.storageComplete = 1;

if(global.level2Complete == 0 && global.level2Stage == 0) {
	global.level2Stage = 1;
}