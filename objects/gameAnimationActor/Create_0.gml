/// @description Insert description here
// You can write your code in this editor

animationStartTime = 0;
animationEndTime = 0;
animationTime = 0; //how long to animate for
animationSprite = pointer_null; 
idleSprite = pointer_null;
homeX = x;
homeY = y;

//state machine

stateIdle = function(){
	image_speed = 0;
	sprite_index = idleSprite;
}
state = stateIdle;

// spr = sprite to draw, time = time in microseconds to animate for
stateStartAnimating = function(){
	animationStartTime = get_timer();
	animationEndTime = animationStartTime + animationTime;
	sprite_index = animationSprite;
	image_speed = 1;
	state = stateAnimating;
}

stateAnimating = function(){
	if (image_index >= image_number - 1){
		image_speed = 0;
	}
	if (get_timer() >= animationEndTime){
		sprite_index = idleSprite;
		state = stateIdle;
	}
}

// object functions
function playAnimation(spr, duration, startTime = 0){
	animationSprite = spr;
	animationTime = duration;
	animationStartTime = get_timer() + startTime
	state = stateStartAnimating;
}