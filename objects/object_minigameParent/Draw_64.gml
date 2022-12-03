/// @description Insert description here
// You can write your code in this editor

if (drawDebugInfo){
	draw_set_color(c_black);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text(0,0,"song: " + audio_get_name(song));
	draw_text(0,40,"measure: " + string(measure));
	draw_text(0,80,"beatNumber: " + string(beatNumber));
	draw_text(0,120,"BPM: " + string(BPM));
	draw_text(0,160,"beatOffset (ms): " + string(beatOffset/1000));

	draw_text(300,0,"songScore: " + string(songScore));
	draw_text(300,40,"buttonHeld: " + string(buttonHeld));
	draw_text(300,80,"buttonPressTime: " + string(buttonPressTime));
	draw_text(300,120,"buttonReleaseTime: " + string(buttonReleaseTime));

	draw_text(600,0,"gameState: " + string(stateName));
	draw_text(600,40,"targetNote: " + string(noteMap[targetNoteIndex]));
	draw_text(600,80,"cheats on: " + string(cheats));
	
	if (beatNumber >= 1 and (beatNumber )%1 <= 0.05){
	if ((beatNumber+3)%4 < 0.1){
		audio_play_sound(beep,1,0,0.1,0,1.5);
	} else {
		audio_play_sound(beep,1,0,0.1);
	}
}
}