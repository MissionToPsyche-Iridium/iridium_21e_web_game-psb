/// @description Insert description here
// You can write your code in this editor
if(doorState == "closed" && instance_exists(second_door))
{
	doorState = "open";
	instance_deactivate_object(mainDoor);
	instance_deactivate_object(airInside);
	doorTimer = room_speed * 1;
}