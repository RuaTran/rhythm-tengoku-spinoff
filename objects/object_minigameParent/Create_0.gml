/// @description Insert description here
// You can write your code in this editor

HIT_WINDOW = 90; // +-225 milliseconds to properly score on a note

cheats = false; // whether or not to play the song automatically
song = beep; // song to play, beep is a placeholder to prevent crashes
BPM = 0; // BPM of the song
beatOffset = 0; // how long before the first beat of the song starts (microseconds)
beatNumber = 0; // beat count of the song
creationTime = get_timer(); //the time when this instance was created
songStartTime = 0; //the time when the song has started, used for beatNumber (microseconds)
songStarted = false; // if the song has started yet
measure = 0; // if I remade this game again, I would make beatmaps using measures
perfectClear = true;

songScore = 0;

drawDebugInfo = false;

buttonHeld = false;
buttonPressTime = 0;
buttonReleaseTime = 0;

gameAnimationActors = []; //list of 'actors' in the animation, could be any object that plays animations

draw_set_font(mm_font);

/////////// STATE MACHINE
noteMap = [-99999];
targetNoteIndex = 0;

stateName = 0; // used to store the state name for debug purposes since GML doesn't allow you to print variable names
state = 0; // pointer for the state function to use in step

stateStart = function(){
	//start song when ready
	if ((get_timer() - creationTime) >= songStartTime and not songStarted){
		songStarted = true;
		audio_play_sound(song,1,0,0.6);
		state = stateExpectNote;
		stateName = "stateExpectNote";
	}

}
state = stateStart;
stateName = "stateStart";


stateExpectNote = function(){
	// debug for note ALWAYS HIT, enabled in-game with F2
	if (cheats == true){
		buttonPressTime = beatNumber - HIT_WINDOW * BPM/60000;
	}
	
	if (noteMap[targetNoteIndex]*60000/BPM + HIT_WINDOW <= beatNumber*60000/BPM or buttonPressTime*60000/BPM >= noteMap[targetNoteIndex]*60000/BPM - HIT_WINDOW and buttonPressTime*60000/BPM <= noteMap[targetNoteIndex]*60000/BPM + HIT_WINDOW and noteMap[targetNoteIndex] != -99999){
		//check if note is hit on time
		if (buttonPressTime*60000/BPM >= noteMap[targetNoteIndex]*60000/BPM - HIT_WINDOW and buttonPressTime*60000/BPM <= noteMap[targetNoteIndex]*60000/BPM + HIT_WINDOW){
			state = stateNoteHit;
			stateName = "stateNoteHit";
		} else {
		//note is missed
			state = stateNoteMissed;
			stateName = "stateNoteMissed";
		}
	} 
	
	if (noteMap[targetNoteIndex] = -99999){
		state = stateSongFinished;
		stateName = "stateSongFinished";
	}
}

stateNoteHit = function(){
	// add to the score and set next target note to the next one in the noteMap
	songScore += 1;
	if (noteMap[targetNoteIndex] != -99999){
		targetNoteIndex += 1;
	}
	state = stateExpectNote;
	stateName = "stateExpectNote";
}

stateNoteMissed = function(){
	// we don't subtract from score
	if (perfectClear == true) {
		audio_play_sound(sfx_perfect_fail,1,0,0.7);
		perfectClear = false;
	}
	if (noteMap[targetNoteIndex] != -99999){
		targetNoteIndex += 1;
	}
	state = stateExpectNote;
	stateName = "stateExpectNote";
}

stateSongFinished = function(){
	
}

stateGameFinished = function(){
	stateName = "stateGameFinished"
}