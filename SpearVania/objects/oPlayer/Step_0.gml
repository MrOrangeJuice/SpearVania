if(!global.paused && !global.hitPause)
{
	image_speed = 1;
	
	hsp = (global.key_right - global.key_left) * hSpeed;

	vsp = vsp + grv;

	if(canJump-- > 0 && global.key_jump)
	{
		vsp = jumpVel;
		canJump = 0;
		if(!attacking)
		{
			jumpStartAnimation = true;
			image_index = 0;
		}
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
	
		if(!landed && !attacking) 
		{
			landed = true;
			landAnimation = true;
			image_index = 0;
		}
	}
	else
	{
		landed = false;
		landAnimation = false;
	}

	canAttack--;

	// Attack
	if(!attacking && global.key_attack && canAttack < 0)
	{
		attacking = true;
		jumpStartAnimation = false;
		canAttack = attackCooldown;
		image_index = 0;
		alarm[0] = room_speed * 0.0625;
	}
	
	// Attack hitbox
	if(attacking && canSpawnHitbox)
	{
		if(sprite_index == sPlayerSlash)
		{
			if(!instance_exists(oSlashHitbox))
			{
				instance_create_layer(x,y,"Instances",oSlashHitbox);
			}
		}
		else if(sprite_index == sPlayerSlashLeft)
		{
			if(!instance_exists(oSlashHitboxLeft))
			{
				instance_create_layer(x,y,"Instances",oSlashHitboxLeft);
			}
		}
	}
}
else
{
	image_speed = 0;
	alarm[0]++;
}

// Animate
// Check Sides

if(hsp > 0 && !attacking)
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
else if(hsp < 0 && !attacking)
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
else if(jumpStartAnimation)
{
	sprite_index = jumpStartSprite;	
}
else if(!landed)
{
	if(vsp < 0)
	{
		sprite_index = jumpSprite;	
	}
	else
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
else if(!(global.key_left || global.key_right))
{
	sprite_index = idleSprite;	
}