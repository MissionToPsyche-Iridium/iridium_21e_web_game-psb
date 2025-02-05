if (!place_meeting(x, y, objHero) && dialogue != noone) {
    instance_destroy(dialogue);
    dialogue = noone;
}