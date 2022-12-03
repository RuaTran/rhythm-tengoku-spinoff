/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
//noteMap[targetNoteIndex]*60000/BPM + HIT_WINDOW <= beatNumber*60000/BPM
if (npcNoteMap[npcTargetNoteIndex]*60000/BPM<= beatNumber*60000/BPM  and npcNoteMap[npcTargetNoteIndex] != -99999 and state != stateGameFinished){
	npcTargetNoteIndex += 1; // goto next note in the map
	if (npcBrushDirection == 0){ // do brush
		gameAnimationActors[0].playAnimation(mg1_chris,1000000);
		gameAnimationActors[0].idleSprite = mg1_chris;	
		part_particles_create_color(bubbleEmitter,500,270,bubbleParticle,c_white,10);
		audio_play_sound(brush1,10,0,0.4);
		npcBrushDirection = 1;
		if (beatNumber <=64){
			if (brushDirection == 0){			
				gameAnimationActors[1].playAnimation(mg1_helen,1000000);	
				gameAnimationActors[1].idleSprite = mg1_helen;	
				part_particles_create_color(bubbleEmitter,860,290,bubbleParticle,c_white,10);
				brushDirection = 1;
			}
		}
	} else {
		gameAnimationActors[0].playAnimation(mg1_chris_reversed,1000000);
		gameAnimationActors[0].idleSprite = mg1_chris_reversed;	
		part_particles_create_color(bubbleEmitter,500,270,bubbleParticle,c_white,10);
		audio_play_sound(brush1,10,0,0.4);
		npcBrushDirection = 0;
		if (beatNumber <=64){
			gameAnimationActors[1].playAnimation(mg1_helen_reversed,1000000);	
			gameAnimationActors[1].idleSprite = mg1_helen_reversed;	
			part_particles_create_color(bubbleEmitter,860,290,bubbleParticle,c_white,10);
			brushDirection = 0;
		}
	}
}

switch (state){
	case stateNoteHit:
		if (brushDirection == 0){			
			gameAnimationActors[1].playAnimation(mg1_helen,1000000);	
			gameAnimationActors[1].idleSprite = mg1_helen;	
			part_particles_create_color(bubbleEmitter,860,290,bubbleParticle,c_white,10);
			audio_play_sound(brush1,10,0,0.4);
			brushDirection = 1;
		} else {
			gameAnimationActors[1].playAnimation(mg1_helen_reversed,1000000);	
			gameAnimationActors[1].idleSprite = mg1_helen_reversed;	
			part_particles_create_color(bubbleEmitter,860,290,bubbleParticle,c_white,10);
			audio_play_sound(brush1,10,0,0.4);
			brushDirection = 0;
		}
	break;
	
	case stateNoteMissed:
		gameAnimationActors[0].playAnimation(mm_christmas,100000);	
		if (brushDirection == 0){ brushDirection = 1;} // keep the two characters synchronized
		else if (brushDirection == 1){ brushDirection = 0;}
	break;
	
	case stateExpectNote:
		bounceActor(gameAnimationActors[0]);
		bounceActor(gameAnimationActors[1]);
	break;
	
	case stateSongFinished:
		bounceActor(gameAnimationActors[0]);
		bounceActor(gameAnimationActors[1]);
	break;
}
//some timing things, hardcoded for now, but a values could be loaded from file

if (beatNumber >= 192.7 and beatNumber <= 223.8  and beatNumber%1 <=0.05){
//if (beatNumber >= 0 and beatNumber <= 20  and beatNumber%1 <=0.1){
	bubbleColor = floor(random(3));
	
	if (bubbleColor == 0) {bubbleColor = c_aqua;} else
	if (bubbleColor == 1) {bubbleColor = c_lime;} else
	if (bubbleColor == 2) {bubbleColor = c_fuchsia;}
	
	part_particles_create_color(bubbleEmitter,floor(random(80))*5,random(200),bgParticle,bubbleColor,1);
	part_particles_create_color(bubbleEmitter,floor(random(80))*5+966,random(200),bgParticle,bubbleColor,1);
}

if (beatNumber >= 348.7 and beatNumber <= 348.8 and state != stateGameFinished){
	state = stateGameFinished;
	
	gameAnimationActors[1].idleSprite = mg1_helen_reversed;
	gameAnimationActors[0].idleSprite = mg1_chris_reversed;
	gameAnimationActors[1].sprite_index = mg1_helen_reversed;
	gameAnimationActors[0].sprite_index = mg1_chris_reversed;
	part_particles_create_color(bubbleEmitter,860,290,starParticle,c_white,5);
	part_particles_create_color(bubbleEmitter,500,270,starParticle,c_white,5);
}

// go to the ending, this is disabled for now
/*
if (beatNumber >= 352.7 and beatNumber <= 352.8 and state = stateGameFinished){
	part_system_destroy(bubbleEmitter);
	fader2.transition("fade_out", 3000000 , room_end);
}
*/

//make the perfect message flash if you're on a perfect run otherwise show a fail. This should probably go in the parent object for minigame
if (perfectClear){
	if (beatNumber > 0 and beatNumber % 5 <= 0.8){
		perfectTextImage.image_alpha = 0;
	} else {
		perfectTextImage.image_alpha = 1;
	}
} else {
	perfectImage.idleSprite = perfect_fail;
	perfectTextImage.image_alpha = 0;
}