/// @description Insert description here
// You can write your code in this editor
if(doorState == "closed")
{
	doorState = "open";
	instance_deactivate_object(doorName);
	doorTimer = room_speed * 1;
}