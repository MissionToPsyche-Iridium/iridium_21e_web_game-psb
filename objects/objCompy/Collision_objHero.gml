if (dialogue == noone) {
    dialogue = instance_create_layer(x, y, "gameObjects", objCompyDialogue);
    
    // Set its image index
    if (dialogue != noone) {
        dialogue.image_index = global.compyDialogue;
    }
}

if(global.compyFix == 1) {
	image_index = 1;	
}