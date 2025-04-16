audio_stop_all();

instance_destroy(objHero);
instance_destroy(objControls);
instance_destroy(objResources);
instance_destroy(objStatus);

room_goto(rmFinalCutscene);