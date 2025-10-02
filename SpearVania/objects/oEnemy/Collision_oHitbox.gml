if(canHit)
{
	canHit = false;
	
	var centerX = x + (sprite_width / 2);
	var centerY = y + (sprite_height / 2);
	
	var hitBlocked = false;
	
	// Create VFX
	if(other.object_index == oSlashHitbox)
	{
		hp--;
		shieldHp--;
		flash = 5;
		PlayRandomSpearHitSound();
		instance_create_layer(centerX - (sprite_width/2) - 14,other.y+2,"VFX",oHitVFX);
		for(var i = 0; i < 5; i++)
		{
			instance_create_layer(centerX + (sprite_width/2),other.y+9,"VFX",oParticleVFXRight);
		}
	}
	if(other.object_index == oSlashHitboxLeft)
	{
		hp--;
		shieldHp--;
		flash = 5;
		PlayRandomSpearHitSound();
		instance_create_layer(centerX + (sprite_width/2) - 2,other.y+2,"VFX",oHitVFXLeft);
		for(var i = 0; i < 5; i++)
		{
			instance_create_layer(centerX - (sprite_width/2),other.y+9,"VFX",oParticleVFXLeft);
		}
	}
	if(other.object_index == oStabHitbox)
	{
		instance_create_layer(centerX - (sprite_width/2) - 14,other.y+2,"VFX",oHitStabVFX);
		if(shieldBroken)
		{
			hp -= 5;
			flash = 5;
			PlayRandomStabHitSound();
			for(var i = 0; i < 5; i++)
			{
				instance_create_layer(centerX + (sprite_width/2),other.y+9,"VFX",oParticleStabVFXRight);
			}
		}
		else
		{
			hitBlocked = true;	
		}
	}
	if(other.object_index == oStabHitboxLeft)
	{
		instance_create_layer(centerX + (sprite_width/2) - 2,other.y+2,"VFX",oHitStabVFXLeft);
		if(shieldBroken)
		{
			hp -= 5;
			flash = 5;
			PlayRandomStabHitSound();
			for(var i = 0; i < 5; i++)
			{
				instance_create_layer(centerX - (sprite_width/2),other.y+9,"VFX",oParticleStabVFXLeft);
			}
		}
		else
		{
			hitBlocked = true;
		}
	}
	if(hp <= 0)
	{
		for(var i = 0; i < 20; i++)
		{
			instance_create_layer(centerX,centerY,"VFX",oShieldParticle);
		}
		global.hitPauseTime = 20;
		ScreenShake(5,20);
		instance_create_layer(x,y,"VFX",oDeathVFX);
		audio_play_sound(sndExplosion2,5,false);
		instance_destroy();
	}
	else if(shieldHp <= 0 && !shieldBroken)
	{
		for(var i = 0; i < 20; i++)
		{
			instance_create_layer(centerX,centerY,"VFX",oShieldParticle);
		}
		global.hitPauseTime = 16;
		ScreenShake(4,20);
		PlayRandomShieldExplosionSound();
		shieldBroken = true;
	}
	else
	{
		if(!hitBlocked)
		{
			global.hitPauseTime = 8;
			ScreenShake(2,10);
		}
		else
		{
			audio_play_sound(sndKlang,5,false);	
		}
	}
}