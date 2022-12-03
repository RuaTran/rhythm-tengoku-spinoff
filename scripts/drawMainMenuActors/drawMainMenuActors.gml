// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawMainMenuActors(){
	if (beatNumber > 8 and actorsOffset > 0 ){
		actorsOffset-=20;
	} 
	modifier = beatNumber%2;
	modifier = sin(pi*(1-modifier));
	
	draw_sprite_ext(mm_helen,0,335+actorsOffset*2,actorsOffset+825+modifier*10,1.25,1.25,-2,-1,1);
	draw_sprite_ext(mm_chris,0,1050-actorsOffset*2,actorsOffset+805-modifier*10,1.25,1.25,1,-1,1);
	
}