if(room == rmLevel5) {
	flashlight_active = true;	
}
else{
	flashlight_active = false;	
}

// Enter Level 3
if(room == rmLevel3) {
	// Respawn Items
	instance_deactivate_object(caveIn1);
	instance_deactivate_object(caveIn2);
	instance_deactivate_object(caveIn3);
	instance_deactivate_object(caveIn4);

	if(instance_position(736, 2784, Obj_O2_Tank) == noone) {
		instance_create_layer(736, 2784, "Instances", Obj_O2_Tank);
	}
	
	if(instance_position(1728, 2240, Obj_O2_Tank) == noone) {
		instance_create_layer(1728, 2240, "Instances", Obj_O2_Tank);
	}
	
	if(instance_position(1696, 1152, Obj_O2_Tank) == noone) {
		instance_create_layer(1696, 1152, "Instances", Obj_O2_Tank);
	}
	
	if(instance_position(1344, 1440, Obj_O2_Tank) == noone) {
		instance_create_layer(1344, 1440, "Instances", Obj_O2_Tank);
	}
	
	if(instance_position(1408, 1408, Obj_O2_Tank) == noone) {
		instance_create_layer(1408, 1408, "Instances", Obj_O2_Tank);
	}
}