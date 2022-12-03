/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

if (state == stateSongFinished and beatNumber <= 10.5){
	fader2.transition("fade-out", 1000000 , room_minigame1);
}