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
	
	// Destroy all
	instance_destroy(Obj_O2_Tank);

	// Create all
	instance_create_layer(736, 2784, "Instances", Obj_O2_Tank);
	instance_create_layer(1728, 2240, "Instances", Obj_O2_Tank);
	instance_create_layer(1696, 1152, "Instances", Obj_O2_Tank);
	instance_create_layer(1344, 1440, "Instances", Obj_O2_Tank);
	instance_create_layer(1408, 2624, "Instances", Obj_O2_Tank);
}

// Enter Level 4
if(room == rmLevel4) {
	// Destroy all
	instance_destroy(Obj_O2_Tank);

	// Create all
	instance_create_layer(704, 544, "Instances", Obj_O2_Tank);
	instance_create_layer(2467, 769, "Instances", Obj_O2_Tank);
	instance_create_layer(2170, 959, "Instances", Obj_O2_Tank);
}