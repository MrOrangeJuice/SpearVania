hsp = (global.key_right - global.key_left) * hSpeed;

vsp = vsp + grv;

if(canJump-- > 0 && global.key_jump)
{
	vsp = jumpVel;
	canJump = 0;
	sprite_index = jumpStartSprite;
	image_index = 0;
	landed = false;
	landAnimation = false;
}

// Variable jump height
if(!global.key_jump && vsp < 0)
{
	vsp *= 0.85;
}

// Horizontal collision
move_and_collide(hsp,0,oWall,abs(ceil(hsp)));

// Vertical collision
if(array_length(move_and_collide(0,vsp,oWall,abs(ceil(vsp)),0,0)) > 0)
{
	if (vsp > 0) canJump = 10;
	vsp = 0;
	
	if(!landed) 
	{
		landed = true;
		landAnimation = true;
		image_index = 0;
	}
}

// Attack
if(!attacking && global.key_attack)
{
	attacking = true;
	landed = false;
	landAnimation = false;
	image_index = 0;
}

// Animate
// Check Sides

if(hsp > 0)
{
	idleSprite = sPlayer;
	runSprite = sPlayerRun;
	jumpStartSprite = sPlayerJumpStart;
	jumpSprite = sPlayerJump;
	fallSprite = sPlayerFall;
	landSprite = sPlayerLand;
	runLandSprite = sPlayerRunLand;
	attackSprite = sPlayerSlash;
}
else if(hsp < 0)
{
	idleSprite = sPlayerLeft;
	runSprite = sPlayerRunLeft;
	jumpStartSprite = sPlayerJumpStartLeft;
	jumpSprite = sPlayerJumpLeft;
	fallSprite = sPlayerFallLeft;
	landSprite = sPlayerLandLeft;
	runLandSprite = sPlayerRunLandLeft;
	attackSprite = sPlayerSlashLeft;
}

if(attacking)
{
	sprite_index = attackSprite;	
}
else if(!landed)
{
	if(vsp > 0)
	{
		sprite_index = fallSprite;	
	}
}
else if(landAnimation)
{
	if(abs(hsp) > 0)
	{
		sprite_index = runLandSprite;
	}
	else
	{
		sprite_index = landSprite;
	}
}
else if(abs(hsp) > 0)
{
	sprite_index = runSprite;	
}
else
{
	sprite_index = idleSprite;	
}