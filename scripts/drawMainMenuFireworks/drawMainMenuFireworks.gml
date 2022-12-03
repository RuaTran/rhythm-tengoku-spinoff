// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawMainMenuFireworks(){
	//letterPlacements[array_length(letterPlacements)-1]
	drawMainMenuFirework(465, 245, 8);
	drawMainMenuFirework(865, 360, 8);
}

// function to draw a single main menu firework
function drawMainMenuFirework(centerX, centerY, startBeat){
	if (beatNumber >= startBeat){
		
		modifier = (beatNumber+1.5) % 2
		//show_debug_message(modifier);
		
		draw_sprite_ext(mm_firework1,0,centerX,centerY,modifier*.5,modifier*.5,0,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework1,0,centerX,centerY,modifier*.5,modifier*.5,90,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework1,0,centerX,centerY,modifier*.5,modifier*.5,180,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework1,0,centerX,centerY,modifier*.5,modifier*.5,270,c_white,1.75-modifier);
		
		draw_sprite_ext(mm_firework2,0,centerX,centerY,modifier*.8,modifier*.8,0,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework2,0,centerX,centerY,modifier*.8,modifier*.8,90,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework2,0,centerX,centerY,modifier*.8,modifier*.8,180,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework2,0,centerX,centerY,modifier*.8,modifier*.8,270,c_white,1.75-modifier);
		
		draw_sprite_ext(mm_firework3,0,centerX,centerY,modifier*1.2,modifier*1.2,0,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework3,0,centerX,centerY,modifier*1.2,modifier*1.2,90,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework3,0,centerX,centerY,modifier*1.2,modifier*1.2,180,c_white,1.75-modifier);
		draw_sprite_ext(mm_firework3,0,centerX,centerY,modifier*1.2,modifier*1.2,270,c_white,1.75-modifier);
	}
}