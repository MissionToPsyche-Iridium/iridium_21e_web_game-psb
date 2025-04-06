/// @description Insert description here
// You can write your code in this editor
if(doorState == "closed" && instance_exists(outsideAirlockDoor) && global.airVacFix == 1)
{
	doorState = "open";

	instance_deactivate_object(mainDoor);
	instance_deactivate_object(AirLockAir);

	doorTimer = room_speed * 1;
}