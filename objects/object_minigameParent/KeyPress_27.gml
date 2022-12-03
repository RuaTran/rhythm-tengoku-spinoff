/// @description Insert description here
// You can write your code in this editor

audio_stop_all();
/*
for (var i = 0; i < array_length(gameAnimationActors); i++){
	instance_destroy(gameAnimationActors[i]);
}*/
//instance_destroy(all);
//room_goto(room_mainMenu);

fader = instance_create_depth(0,0,-11,transitionObject);
fader.transition("fade-out",1500000,room_mainMenu);