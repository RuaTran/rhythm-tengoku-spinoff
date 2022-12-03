// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawMainMenuMessagebox(){
	
		drawPosition = [415,645];
		if (beatNumber >= 10) {
		modifier = beatNumber%4;
		modifier = -sin(1/2*pi*modifier);
	
		draw_sprite_ext(mm_messagebox,0,drawPosition[0],drawPosition[1],1.25,-1.25,0,-1,modifier*2);
		draw_set_alpha(modifier*2);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text(drawPosition[0]+sprite_get_width(mm_messagebox)/2 +55, drawPosition[1]-sprite_get_height(mm_messagebox)/2-15, "Press Space To Start!");
		draw_set_alpha(1);
	}
}