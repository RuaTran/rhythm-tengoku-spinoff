/// @description Insert description here
// You can write your code in this editor

beatNumber = (get_timer() - creationTime - songStartTime - beatOffset)/1000000*BPM/60;
measure = 1 + floor(beatNumber/4);
//show_debug_message(measure);

state();