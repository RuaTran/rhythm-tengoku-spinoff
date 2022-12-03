/// @description Insert description here
// You can write your code in this editor
TERMINAL_VELOCITY = 10;

// the position of the letters, which try to follow the circles
letterX = x;
letterY = y;

// the home position of the letters when the intro completes
targetY = 0;
targetX = 0;

// where the letters will pulse to after beat 10
pulseX = 0;
pulseY = 0;


// newtonian physics variables for acceleration and velocity
ax = 0;
ay = 0;
vx = 0;
vy = 0;

// whether or not the letter has passed through target in the intro
firstPass = false;
secondPass = false;


