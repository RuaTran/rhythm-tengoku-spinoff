// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//each draw must be seperated into different for loops to simulate layering

function drawMainMenuTitle(){
	drawMainMenuLettersFadeIn(5);
	drawMainMenuPulsing(8);
	drawMainMenuRainbow();
	drawMainMenuCircles();
	drawMainMenuLetters();
}

function drawMainMenuRainbow(){
	shader_set(rainbowShader);
	for(var i = 0; i < LETTER_COUNT; i++){
		draw_circle_color(letterArray[i].x,letterArray[i].y, 130, c_gray,c_gray,false);
	}
	shader_reset();
}

function drawMainMenuPulsing(targetBeat){
	if(beatNumber > targetBeat){
		if(beatNumber%1 < 0.1){
			// for testing beat alignment
			// audio_play_sound(beep,1,0,0.1);
			for(var i = 0; i < LETTER_COUNT; i++){
				letterArray[i].x = letterArray[i].pulseX;
				letterArray[i].y = letterArray[i].pulseY;
				letterArray[i].letterX = letterArray[i].pulseX;
				letterArray[i].letterY = letterArray[i].pulseY;
			}
		} else {
			moveCirclesTowardsTargets();
		}
			
	}
}

function drawMainMenuCircles(){
	draw_set_color(c_white)
	for(var i = 0; i < LETTER_COUNT; i++){
		draw_circle(letterArray[i].x,letterArray[i].y,110,false);
	}
	
	draw_set_color(c_black);
	for(var i = 0; i < LETTER_COUNT; i++){
		draw_circle(letterArray[i].x,letterArray[i].y,100,false);
	}	
}

//fun vector time

function moveCirclesTowardsTargets(){
	for(var i = 0; i < LETTER_COUNT; i++){
		vx = letterArray[i].targetX - letterArray[i].x;
		vy = letterArray[i].targetY - letterArray[i].y;
		distance = sqrt(power(vx,2) + power(vy,2));
		
		// avoid dividing by zero
		if (distance > 1){
			vx = vx / distance;
			vy = vy / distance;
		}
		
		if (distance > 5){
			letterArray[i].x += 10 * vx;
			letterArray[i].y += + 10 * vy;
		} else {
			letterArray[i].x = letterArray[i].x
			letterArray[i].y = letterArray[i].y
		}
			
	}
}

function moveLettersTowardsCircles(){
	for(var i = 0; i < LETTER_COUNT; i++){
		vx = letterArray[i].x - letterArray[i].letterX;
		vy = letterArray[i].y - letterArray[i].letterY;
		distance = sqrt(power(vx,2) + power(vy,2));
		
		// avoid dividing by zero
		if (distance > 1){
			vx = vx / distance;
			vy = vy / distance;
		}
		
		//keeps the letters leashed to the circles 65 pixels away, if it's closer it will move towards the center
		if (distance > 35){ // now we have a vector;
			letterArray[i].letterX = letterArray[i].x + 35 * -vx;
			letterArray[i].letterY = letterArray[i].y + 35 * -vy;
		} else if (distance > 5){
			letterArray[i].letterX += 5 * vx;
			letterArray[i].letterY += + 5 * vy;
		} else {
			letterArray[i].letterX = letterArray[i].x
			letterArray[i].letterY = letterArray[i].y
		}
			
	}
}


function drawMainMenuLetters(){
	moveLettersTowardsCircles();
	letterColor = 0; // placeholder variable, color alternates between orange and yellow
	for(var i = 0; i < LETTER_COUNT; i++){
		if(letterColor == c_yellow){
			letterColor = c_orange;
		} else if (i != 4) {
			letterColor = c_yellow;
		}
		draw_sprite_ext(letterArray[i].spriteIndex,0,letterArray[i].letterX,letterArray[i].letterY,1.4,1.4,0,letterColor,1);
	}
}

function drawMainMenuLettersFadeIn(targetBeat){
if(beatNumber > targetBeat+1 and beatNumber < targetBeat+3){ //change to 8 or 9
		for(var i = 0; i < LETTER_COUNT; i++){
			distance = letterArray[i].y - letterArray[i].targetY
			
			//on the first attempt at passing targetY, start gravity
			if (!letterArray[i].firstPass){
				if (sign(distance) = -1) {letterArray[i].vy = -50; letterArray[i].ay = 4; letterArray[i].firstPass = true;}
			} else if (!letterArray[i].secondPass){
				if (sign(distance) = 1) {letterArray[i].secondPass = true;}
			}
			
			//on the second attempt at passing targetY, stop the letters completely
			if (letterArray[i].secondPass){
				letterArray[i].y = letterArray[i].targetY;
				letterArray[i].vy = 0;
				letterArray[i].ay = 0;
			}
			
			letterArray[i].vy += letterArray[i].ay; // add acceleration to velocity
			letterArray[i].y += letterArray[i].vy; // change y based on velocity
		}
	} else if (beatNumber > targetBeat){
		for(var i = 0; i < LETTER_COUNT; i++){
				letterArray[i].vy = -140+i*14;
		}
	}
}