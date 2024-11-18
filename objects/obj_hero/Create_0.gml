// Controls Setup
controlsSetup();

// Moving
moveDir = 0;
moveSpd = 2;
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


// Health
int_hp = 2;
int_max_hp = 2;

// Resources
global.resource_1_count = 0;
global.resource_2_count = 0;
global.resource_3_count = 0;
global.resource_4_count = 0;
global.resource_5_count = 0;