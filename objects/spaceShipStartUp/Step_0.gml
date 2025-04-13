// Only animate if not in final phase
if (change == 0){
if (animation_phase < 3) {
    frame_timer++;

    if (frame_timer >= frame_speed) {
        frame_timer = 0;

        switch (animation_phase) {
            case 0:
                image_index += frame_dir;

                if (image_index >= 1) {
                    image_index = 1;
                    frame_dir = -1;
                } else if (image_index <= 0) {
                    image_index = 0;
                    frame_dir = 1;

                    phase0_loops++;
                    if (phase0_loops >= 3) {
                        animation_phase = 1;
                        image_index = 0;
                        frame_dir = 1;
                        phase1_loops = 0; // Init new loop counter
                    }
                }
                break;

            case 1:
                image_index += frame_dir;

                if (image_index >= 2) {
                    image_index = 2;
                    frame_dir = -1;
                } else if (image_index <= 0) {
                    image_index = 0;
                    frame_dir = 1;

                    phase1_loops++;
                    if (phase1_loops >= 3) {
                        animation_phase = 2;
                        image_index = 0;
                        frame_dir = 1;
                        phase2_loops = 0;
                    }
                }
                break;

            case 2:
                image_index += frame_dir;

                if (image_index >= 3) {
                    image_index = 3;
                    frame_dir = -1;
                } else if (image_index <= 0) {
                    image_index = 0;
                    frame_dir = 1;

                    phase2_loops++;
                    if (phase2_loops >= 3) {
                        animation_phase = 3;
                        image_index = 4;
                    }
                }
                break;
        }
    }
} else {
    image_index = 3;
}
}
