/// @description Insert description here
// You can write your code in this editor


if(doorTimer > 0)
{
	doorTimer--;
}
else if(doorTimer == 0)
{
	doorState = "closed";
	instance_activate_object(mainDoor);
	instance_activate_object(AirLockAir);
}