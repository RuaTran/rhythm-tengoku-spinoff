/// @description Insert description here
// You can write your code in this editor

if (beatNumber > 4){
	audio_sound_gain(mainMenuMusic, 0, 1500);
	fader = instance_create_depth(0,0,-11,transitionObject);
	fader.transition("fade-out",1500000,room_minigame1_intro);
}