if(canHit)
{
	flash = 5;
	hp--;
	shieldHp--;
	canHit = false;
	
	var centerX = x + (sprite_width / 2);
	var centerY = y + (sprite_height / 2);
	
	// Create VFX
	if(other.object_index == oSlashHitbox)
	{
		instance_create_layer(centerX - (sprite_width/2) - 14,other.y+2,"VFX",oHitVFX);
		for(var i = 0; i < 5; i++)
		{
			instance_create_layer(centerX + (sprite_width/2),other.y+9,"VFX",oParticleVFXRight);
		}
	}
	if(other.object_index == oSlashHitboxLeft)
	{
		instance_create_layer(centerX + (sprite_width/2) - 2,other.y+2,"VFX",oHitVFXLeft);
		for(var i = 0; i < 5; i++)
		{
			instance_create_layer(centerX - (sprite_width/2),other.y+9,"VFX",oParticleVFXLeft);
		}
	}
	
	if(hp == 0)
	{
		for(var i = 0; i < 20; i++)
		{
			instance_create_layer(centerX,centerY,"VFX",oShieldParticle);
		}
		global.hitPauseTime = 20;
		ScreenShake(5,20);
		instance_create_layer(x,y,"VFX",oDeathVFX);
		instance_destroy();
	}
	else if(shieldHp == 0)
	{
		for(var i = 0; i < 20; i++)
		{
			instance_create_layer(centerX,centerY,"VFX",oShieldParticle);
		}
		global.hitPauseTime = 16;
		ScreenShake(4,20);
	}
	else
	{
		global.hitPauseTime = 8;
		ScreenShake(2,10);
	}
}