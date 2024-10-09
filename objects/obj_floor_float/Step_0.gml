if(bool_movement_downward) {
	y = y + 0.25
	
	flt_y_movement = flt_y_movement + 0.25
	
	if(flt_y_movement >= 7.5) {
		bool_movement_downward = false;
		flt_y_movement = 0;
	}
} else {
	y = y - 0.25
	
	flt_y_movement = flt_y_movement + 0.25
	
	if(flt_y_movement >= 7.5) {
		bool_movement_downward = true;
		flt_y_movement = 0;
	}
}