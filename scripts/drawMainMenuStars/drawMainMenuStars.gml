// This can be made a lot more efficient by reusing functions and frankly quite bad, but this is done quickly for prototyping
// for example, the spinIn() and Loop() functions could take in arrays of star objects, but that is not a priority right now so there is a LOT of repetition.
// could define positions in a JSON file and have them loaded in as well.


// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawMainMenuStars(){
	
	//group 1 spin
	if(beatNumber >= 8){
		drawStarsLoop()
	} else {
		drawStarsSpinIn1(3)
		drawStarsSpinIn2(5)
		drawStarsSpinIn3(7)
	}
}

function getRotation(val){
	return (sin(pi*val-pi/2)+1)*180 // normalizes sin function to simulate fade-in and fade-out. Try plugging this function into a calculator bounded by 0,1 to see
	// this could be sped up using a table to reduce calculations, but is unnecessary
	
}

// will have the stars initially spin in on the desired beatNumber
function drawStarsSpinIn1(desiredBeatNumber){
	if (beatNumber >= desiredBeatNumber) {
		if (beatNumber <= desiredBeatNumber + .3 and bgstar1_scale < 1.8){
			bgstar1_scale += 0.20;
		} else if (beatNumber <= desiredBeatNumber + .4 and bgstar1_scale > 1){
			bgstar1_scale -= 0.4;
			if (bgstar1_scale < 1){
				bgstar1_scale = 1;
			}
		}
		if (beatNumber < desiredBeatNumber + 3 and bgstar1_rotation < 1){
			bgstar1_rotation += 0.036;
			if (bgstar1_rotation > 1){
				bgstar1_rotation = 1;
			}
		}
		if (bgstar1_opacity < 1){
			bgstar1_opacity += 0.06;
		}
	}
	
	draw_sprite_ext(bg_star,0,100,200,bgstar1_scale,bgstar1_scale,getRotation(bgstar1_rotation)+10,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,200,300,bgstar1_scale,bgstar1_scale,-getRotation(bgstar1_rotation)+20,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,50,350,bgstar1_scale*0.5,bgstar1_scale*0.5,-getRotation(bgstar1_rotation)+30,bgstar_orange,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,75,500,bgstar1_scale,bgstar1_scale,getRotation(bgstar1_rotation)+40,bgstar_orange,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,150,575,bgstar1_scale,bgstar1_scale,getRotation(bgstar1_rotation)+50,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1200,275,bgstar1_scale,bgstar1_scale,getRotation(bgstar1_rotation)+60,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1250,450,bgstar1_scale*0.5,bgstar1_scale*0.5,getRotation(bgstar1_rotation)+70,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1300,500,bgstar1_scale*0.5,bgstar1_scale*0.5,getRotation(bgstar1_rotation)+80,bgstar_orange,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1175,575,bgstar1_scale*0.5,bgstar1_scale*0.5,getRotation(bgstar1_rotation)+90,bgstar_orange,bgstar1_opacity)
}

// will have the stars initially spin in on the desired beatNumber
function drawStarsSpinIn2(desiredBeatNumber){
	if (beatNumber >= desiredBeatNumber) {
		if (beatNumber <= desiredBeatNumber + .3 and bgstar2_scale < 1.8){
			bgstar2_scale += 0.2;
		} else if (beatNumber <= desiredBeatNumber + .4 and bgstar2_scale > 1){
			bgstar2_scale -= 0.4;
			if (bgstar2_scale < 1){
				bgstar2_scale = 1;
			}
		}
		if (beatNumber < desiredBeatNumber + 3 and bgstar2_rotation < 1){
			bgstar2_rotation += 0.036;
			if (bgstar2_rotation > 1){
				bgstar2_rotation = 1;
			}
		}
		if (bgstar2_opacity < 1){
			bgstar2_opacity += 0.06;
		}
	}
	
	draw_sprite_ext(bg_star,0,50,75,bgstar2_scale,bgstar2_scale,getRotation(bgstar2_rotation)+15,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,150,50,bgstar2_scale,bgstar2_scale,-getRotation(bgstar2_rotation)+30,bgstar_orange,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,300,40,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar2_rotation)+45,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,375,30,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar2_rotation)+60,bgstar_orange,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,125,375,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar2_rotation)+75,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,75,700,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar2_rotation)+90,bgstar_orange,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,1310,600,bgstar2_scale,bgstar2_scale,getRotation(bgstar2_rotation)+105,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,1250,700,bgstar2_scale,bgstar2_scale,getRotation(bgstar2_rotation)+120,bgstar_orange,bgstar2_opacity)
}

// will have the stars initially spin in on the desired beatNumber

function drawStarsSpinIn3(desiredBeatNumber){
	if (beatNumber >= desiredBeatNumber) {
		if (beatNumber <= desiredBeatNumber + .3 and bgstar3_scale < 1.8){
			bgstar3_scale += 0.2;
		} else if (beatNumber <= desiredBeatNumber + .4 and bgstar3_scale > 1){
			bgstar3_scale -= 0.4;
			if (bgstar3_scale < 1){
				bgstar3_scale = 1;
			}
		}
		if (beatNumber < desiredBeatNumber + 3 and bgstar3_rotation < 1){
			bgstar3_rotation += 0.036;
			if (bgstar3_rotation > 1){
				bgstar3_rotation = 1;
			}
		}
		if (bgstar3_opacity < 1){
			bgstar3_opacity += 0.06;
		}
	}
	
	draw_sprite_ext(bg_star,0,175,675,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar3_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,250,725,bgstar3_scale*0.5,bgstar3_scale*0.5,-getRotation(bgstar3_rotation),bgstar_orange,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1100,700,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar3_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1125,30,bgstar3_scale*0.5,bgstar3_scale*0.5,-getRotation(bgstar3_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1225,75,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar3_rotation),bgstar_orange,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1025,60,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar3_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1300,150,bgstar3_scale,bgstar3_scale,-getRotation(bgstar3_rotation),bgstar_orange,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1320,325,bgstar3_scale*0.5,bgstar3_scale*0.5,-getRotation(bgstar3_rotation),bgstar_blue,bgstar3_opacity)
}

function drawStarsLoop(){
	//group 1
	draw_sprite_ext(bg_star,0,100,200,bgstar1_scale,bgstar1_scale,getRotation(bgstar_rotation)+10,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,200,300,bgstar1_scale,bgstar1_scale,-getRotation(bgstar_rotation)+20,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,50,350,bgstar1_scale*0.5,bgstar1_scale*0.5,-getRotation(bgstar_rotation)+30,bgstar_orange,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,75,500,bgstar1_scale,bgstar1_scale,getRotation(bgstar_rotation)+40,bgstar_orange,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,150,575,bgstar1_scale,bgstar1_scale,getRotation(bgstar_rotation)+50,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1200,275,bgstar1_scale,bgstar1_scale,getRotation(bgstar_rotation)+60,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1250,450,bgstar1_scale*0.5,bgstar1_scale*0.5,getRotation(bgstar_rotation)+70,bgstar_blue,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1300,500,bgstar1_scale*0.5,bgstar1_scale*0.5,getRotation(bgstar_rotation)+80,bgstar_orange,bgstar1_opacity)
	draw_sprite_ext(bg_star,0,1175,575,bgstar1_scale*0.5,bgstar1_scale*0.5,getRotation(bgstar_rotation)+90,bgstar_orange,bgstar1_opacity)
	
	//group 2
	draw_sprite_ext(bg_star,0,50,75,bgstar2_scale,bgstar2_scale,getRotation(bgstar_rotation)+15,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,150,50,bgstar2_scale,bgstar2_scale,-getRotation(bgstar_rotation)+30,bgstar_orange,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,300,40,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar_rotation)+45,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,375,30,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar_rotation)+60,bgstar_orange,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,125,375,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar_rotation)+75,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,75,700,bgstar2_scale*0.5,bgstar2_scale*0.5,-getRotation(bgstar_rotation)+90,bgstar_orange,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,1310,600,bgstar2_scale,bgstar2_scale,getRotation(bgstar_rotation)+105,bgstar_blue,bgstar2_opacity)
	draw_sprite_ext(bg_star,0,1250,700,bgstar2_scale,bgstar2_scale,getRotation(bgstar_rotation)+120,bgstar_orange,bgstar2_opacity)
	//group 3
	draw_sprite_ext(bg_star,0,175,675,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,250,725,bgstar3_scale*0.5,bgstar3_scale*0.5,-getRotation(bgstar_rotation),bgstar_orange,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1100,700,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1125,30,bgstar3_scale*0.5,bgstar3_scale*0.5,-getRotation(bgstar_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1225,75,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar_rotation),bgstar_orange,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1025,60,bgstar3_scale*0.5,bgstar3_scale*0.5,getRotation(bgstar_rotation),bgstar_blue,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1300,150,bgstar3_scale,bgstar3_scale,-getRotation(bgstar_rotation),bgstar_orange,bgstar3_opacity)
	draw_sprite_ext(bg_star,0,1320,325,bgstar3_scale*0.5,bgstar3_scale*0.5,-getRotation(bgstar_rotation),bgstar_blue,bgstar3_opacity)
	
	starsSpin();
}

function starsSpin(){
	if(bgstar_rotation < 1){
		bgstar_rotation += 0.017775;
	} else {
		bgstar_rotation = 0
	}
}