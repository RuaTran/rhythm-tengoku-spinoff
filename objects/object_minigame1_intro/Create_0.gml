/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();
song = mg1_intro_song;
songStartTime = 500000;
BPM = 100;
fader = instance_create_depth(0,0,-100,transitionObject);
fader2 = instance_create_depth(0,0,-100,transitionObject);
cheats = 1;
noteMap = [10, -99999]
fader.transition("fade-in");
