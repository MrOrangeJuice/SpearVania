hsp = (global.key_right - global.key_left) * hSpeed;

vsp = vsp + grv;

if(canJump-- > 0 && global.key_jump)
{
	vsp = jumpVel;
	canJump = 0;
}

// Horizontal collision
move_and_collide(hsp,0,oWall,abs(ceil(hsp)));

// Vertical collision
if(array_length(move_and_collide(0,vsp,oWall,abs(ceil(vsp)),0,0)) > 0)
{
	if (vsp > 0) canJump = 10;
	vsp = 0;
}

// Animate

// Check Sides

if(hsp > 0)
{
	idleSprite = sPlayer;
	runSprite = sPlayerRun;
}
else if(hsp < 0)
{
	idleSprite = sPlayerLeft;
	runSprite = sPlayerRunLeft;
}


if(abs(hsp) > 0)
{
	sprite_index = runSprite;	
}
else
{
	sprite_index = idleSprite;	
}