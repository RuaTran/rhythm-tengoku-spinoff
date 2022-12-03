/// @description Insert description here
// You can write your code in this editor

if beatNumber > -10 and beatNumber < 354{
	draw_sprite_ext(mg_you,0,835,115,1.2,1.2,0,c_white,1);
	//draw_text(810,100  - 5 - (1 - (beatNumber + 1) % 2) * 8,"YOU");
}

if (beatNumber > 354){
	draw_text(1100,80,"SCORE:");
	draw_text(1100,120,string(songScore)+"/"+string(maxScore));
}
