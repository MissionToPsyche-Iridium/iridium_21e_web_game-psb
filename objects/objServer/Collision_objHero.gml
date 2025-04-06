if (dialogue == noone && global.serverFix == 0) {
    dialogue = instance_create_layer(x, y - 5, "gameObjects", objServerDialogue);
}