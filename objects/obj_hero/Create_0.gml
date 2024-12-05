// Custom functions for player
function setOnGround(_val = true) {
	if _val == true {
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		coyoteHangTimer = 0;
	}
}

// Controls Setup
controlsSetup();

// Sprites
maskSpr = sprIdle;
idleSpr = sprIdle;
walkSpr = sprWalk;
runSpr = sprRun;
jumpSpr = sprJump;

// Moving
face = 1;
moveDir = 0;
runType = 0;
moveSpd[0] = 3;
moveSpd[1] = 3.5;
xspd = 0;
yspd = 0;

// Jumping
	grav = .275;
	termVel = 4;
	onGround = true;
	jumpMax = 1;
	jumpCount = 0;
	jumpHoldTimer = 0;
	
		// Jump values for each successful jump
		jumpHoldFrames[0] = 18;
		jspd[0] = -4.15;

	// Coyote Time
	// Hang Time
	coyoteHangFrames = 2;
	coyoteHangTimer = 0;
	// Jump Buffer Time
	coyoteJumpFrame = 5;
	coyoteJumpTimer = 0;

// Health
int_hp = 2;
int_max_hp = 2;

// Resources
global.resource_1_count = 0;
global.resource_2_count = 0;
global.resource_3_count = 0;
global.resource_4_count = 0;
global.resource_5_count = 0;

// Check points
global.computerFix = 0;