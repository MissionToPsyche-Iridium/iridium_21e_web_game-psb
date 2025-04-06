// Loop through all instances in the game
for (var i = 0; i < instance_number(all); i++) {
    var inst = instance_find(all, i);
    if (inst != noone && inst.persistent) {
        with (inst) {
            instance_destroy();
        }
    }
}