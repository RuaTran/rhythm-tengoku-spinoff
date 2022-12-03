/// @description Insert description here
// You can write your code in this editor

if (beatNumber > 4){
	audio_stop_all();
	// looks like game_restart deconstructs everything already based on the debugger. look here if there's a memory leak issue though.
	/*
	for (var i = 0; i < LETTER_COUNT; i++){
		instance_destroy(letterArray[i].id);
	}
	instance_destroy(id);
	*/
	game_restart();
}