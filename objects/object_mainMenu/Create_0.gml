/// @description Insert description here
// You can write your code in this editor
//window_set_fullscreen(true);
menu_start = true;
menu_start_alpha = 2.0;

bg_indirect_scroll = 0;
bg_indirect2_scroll = 0;

//star universal values
bgstar_rotation = 0;
bgstar_blue = #28d4fc;
bgstar_orange = #f4942c;

//star group 1 values
bgstar1_opacity = 0;
bgstar1_scale = 0;
bgstar1_rotation = 0;

//star group 2 values
bgstar2_opacity = 0;
bgstar2_scale = 0;
bgstar2_rotation = 0;

//star group 3 values
bgstar3_opacity = 0;
bgstar3_scale = 0;
bgstar3_rotation = 0;

//main menu letters
letterArray = [];
letterPlacements =
[
	[465,245], //he
	[580,250], //re
	[680,190], //n
	[800,185], //no
	
	[455,360], //ri
	[555,370], //zu
	[655,325], //mu
	[765,320], // ten
	[875,255], // goku
];

letterPulsePlacements =
[
	[445,230], //he
	[575,230], //re
	[685,170], //n
	[820,175], //no
	
	[440,365], //ri
	[545,385], //zu
	[655,345], //mu
	[775,335], // ten
	[895,265], // goku
];

letterOrder = [mm_he,mm_re,mm_n2,mm_no,mm_ri,mm_zu,mm_mu,mm_ten,mm_goku]
LETTER_COUNT = array_length(letterOrder);
LETTER_Y_OFFSET = 800;

// how far offscreen the actors are to start
actorsOffset = 400;

for (var i = 0; i < LETTER_COUNT; i++){
	array_push(letterArray,instance_create_depth(letterPlacements[i][0],letterPlacements[i][1]+LETTER_Y_OFFSET,-1,letter_mainMenu))
	letterArray[i].spriteIndex = letterOrder[i];
	letterArray[i].targetX = letterPlacements[i][0];
	letterArray[i].targetY = letterPlacements[i][1];
	//letterArray[i].letterX = 0;
	//letterArray[i].letterY = 0;
	letterArray[i].pulseX = letterPulsePlacements[i][0];
	letterArray[i].pulseY = letterPulsePlacements[i][1];
}

draw_set_font(mm_font);

mainMenuMusic = audio_play_sound(gamestartmenu,1,false,0.4);
BPM = 124.9;
beatNumber = 0;
creationTime = get_timer(); //the time when this instance was created
beatSync = 0.77; //milliseconds delay
window_set_caption("ヘレンのリズム天国");