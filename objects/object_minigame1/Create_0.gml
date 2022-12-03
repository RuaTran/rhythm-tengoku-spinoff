/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
//song information and noteMap
song = saintmorning_rhythm;
BPM = 165.15;
beatOffset = 532000;
songStartTime = 1500000;

// these are the beat numbers for which the guy auto pushes a button
npcNoteMap = [	1, 2.5, 3, 4.5, 5.5, 6.5, 7, 
				9, 10.5, 11, 12.5, 13.5, 14.5, 15,
				17, 18.5, 19, 20.5, 21.5, 22.5, 23,
				25, 26.5, 27, 28.5, 29, 29.5, 30.5, 31,
				33, 34.5, 35, 36.5, 37.5, 38.5, 39,
				41, 42.5, 43, 44.5, 45.5, 46.5, 47,
				49, 50.5, 51, 52.5, 53.5, 54.5, 55,
				57, 58.5, 59, 60, 60.5, 61.5, 62, 63,
				
				65, 66, 67, 68, 68.5, // first measure
				81, 82, 83, 84, 84.5, // second measure
				97, 98, 99, 100, 100.5, 101.5, 102.5, // third
				113, 114, 114.5, 115.5, 116.5, // fourth
				129, 130.5, 131, 132.5, 133.5, 134.5, 135, // fifth
				145, 146.5, 147, 148.5, 149.5, 150.5, 151, // sixth
				161, 161.5, 162.5, 163, 164, 164.5, 165.5, 166, // seventh
				177, 178.5, 179, 181, 182.5, 183, // eighth
				193, 193.666, 194.333, 195, 195.666, 196.333, 197, 197.666, 198.333, 199, // ninth (triplets)
				209, 209.666, 210.333, 211, 211.666, 212.333, 213, 213.666, 214.333, 215, // tenth (triplets2)
				225, 225.5, 226.5, 227, 228, 228.5, 229.5, 230, // eleventh
				241, 241.5, 242.5, 243, 244, 244.5, 245.5, 246, //twelvth
				257, 258.5, 260, 261.5, 263, //thirteenth
				273, 274.5, 276, 277.5, 279, // fourteenth
				289, 290.5, 291, 292.5, 293.5, 294.5, 295, // fifteenth
				305, 306.5, 307, 308.5, 309.5, 310.5, 311, // sixteenth
				323, 325, 327, // seventeenth
				-99999 // end
				]
npcTargetNoteIndex = 0;
npcBrushDirection = 1;

// these are the notes during which the girl (player) is expected to press a button
noteMap = [ 73, 74, 75, 76, 76.5, // 1			
			89, 90, 91, 92, 92.5, // 2
			105, 106, 107, 108, 108.5, 109.5, 110.5, // 3			
			121, 122, 122.5, 123.5, 124.5, // 4
			137, 138.5, 139, 140.5, 141.5, 142.5, 143, // 5			
			153, 154.5, 155, 156.5, 157.5, 158.5, 159, // 6
			169, 169.6, 170.5, 171, 172, 172.5, 173.5, 174,	// 7		
			185, 186.5, 187, 189, 190.5, 191, // 8	
			201, 201.666, 202.333, 203, 203.666, 204.333, 205, 205.666, 206.333, 207, // 9			
			217, 217.666, 218.333, 219, 219.666, 220.333, 221, 221.666, 222.333, 223, // 10		
			233, 233.5, 234.5, 235, 236, 236.5, 237.5, 238,	// 11		
			249, 249.5, 250.5, 251, 252, 252.5, 253.5, 254,	// 12	
			265, 266.5, 268, 269.5, 271, // 13		
			281, 282.5, 284, 285.5, 287, // 14			
			297, 298.5, 299, 300.5, 301.5, 302.5, 303, // 15		
			313, 314.5, 315, 316.5, 317.5, 318.5, 319, // 16
			331, 333, 335, // 17
			-99999 // end
			];
maxScore = array_length(noteMap)-1;

//game setup (backgrounds, actors, cutscenes, etc)
brushDirection = 1;
foreground = instance_create_depth(0,0,-10,gameAnimationActor);
foreground.idleSprite = mg1_foreground;
background = instance_create_depth(0,0,10,gameAnimationActor);
background.idleSprite = mg1_background;
perfectImage = instance_create_depth(0,0,-11,gameAnimationActor);
perfectImage.idleSprite = perfect_pass;
perfectImage.image_xscale = 1;
perfectImage.image_yscale = 1;
perfectTextImage = instance_create_depth(50,0,-11,gameAnimationActor);
perfectTextImage.idleSprite = perfect_text;
perfectTextImage.image_xscale = 1;
perfectTextImage.image_yscale = 1;
 
gameAnimationActors[0] = instance_create_depth(170,50,0,gameAnimationActor);
gameAnimationActors[0].idleSprite = mg1_chris[0]; 
gameAnimationActors[1] = instance_create_depth(530,70,0,gameAnimationActor);
gameAnimationActors[1].idleSprite = mg1_helen[0]; 

bubbleEmitter = part_system_create();
bubbleParticle = part_type_create();
part_type_shape(bubbleParticle, pt_shape_ring);
part_type_gravity(bubbleParticle, 0.55, 270);
part_type_size(bubbleParticle, 0.05, 0.1, 0.002, 0.1);
part_type_speed(bubbleParticle, 3, 8, -0.50, 1);
part_type_direction(bubbleParticle, 0, 359, 1, 20);
part_type_alpha1(bubbleParticle, 0.7);

starParticle = part_type_create();
part_type_shape(starParticle, pt_shape_star);
part_type_gravity(starParticle, 0.55, 270);
part_type_orientation(starParticle,0,359,20,0,1)
part_type_size(starParticle, 0.1, 0.2, 0.01, 0);
part_type_speed(starParticle, 8, 12, -0.50, 1);
part_type_direction(starParticle, 0, 359, 1, 20);
part_type_alpha1(starParticle, 0.7);

bgParticle = part_type_create();
part_type_alpha1(bgParticle, 0.11);
part_type_shape(bgParticle, pt_shape_ring);
part_type_size(bgParticle, 3, 5, 0.002, 0);
part_type_gravity(bgParticle, 0.3, 270);
part_type_speed(bgParticle, 5, 15, -0.50, 1);
part_type_direction(bgParticle, 0, 359, 1, 20);
part_type_life(bgParticle, 100, 200);

randomise();

fader = instance_create_depth(0,0,-100,transitionObject);
fader2 = instance_create_depth(0,0,-100,transitionObject);
fader.transition("fade-in");

// function to make the actors bob up and down to the beat of the song
function bounceActor(actor){
	if (beatNumber >= 1){
		actor.y = actor.homeY - 5 - (1 - (beatNumber + 1) % 2) * 8;
	}
}