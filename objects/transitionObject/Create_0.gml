/// @description Insert description here
// You can write your code in this editor

animationStartTime = 0;
animationEndTime = 0;
animationTime = 0; //how long to animate for
targetRoom = pointer_null;
transitionType = "fade-out"; //default

//state machine

stateIdle = function(){
	
}
state = stateIdle;

// spr = sprite to draw, time = time in microseconds to animate for
stateStartAnimating = function(){
	animationStartTime = get_timer();
	animationEndTime = animationStartTime + animationTime;
	if (transitionType == "fade-out"){
		image_alpha = 0;
	}
	
	if (transitionType == "fade-in"){
		image_alpha = 1;
	}
	state = stateAnimating;
}

stateAnimating = function(){
	if (get_timer() >= animationEndTime){
		state = stateAnimationComplete;
	}
	
	if (transitionType == "fade-out" and image_alpha <= 1.0){
		image_alpha += 0.03;
	}
	
	if (transitionType == "fade-in" and image_alpha >= 0){
		image_alpha -= 0.03;
	}
}

stateAnimationComplete = function(){
	if (targetRoom != pointer_null){
		audio_stop_all();
		room_goto(targetRoom);
	}
}

// object functions
function playAnimation(spr, duration, startTime = 0){
	animationTime = duration;
	animationStartTime = get_timer() + startTime
	state = stateStartAnimating;
}

function transition(transitionType = self.transitionType, anim_duration = 1000000 , targetRoom = self.targetRoom){
	image_alpha = 0;
	sprite_index = tile_black;
	image_xscale = 20.0;
	image_yscale = 20.0;
	self.transitionType = transitionType
	self.targetRoom = targetRoom;
	animationTime = anim_duration;
	animationStartTime = get_timer()
	state = stateStartAnimating;
}