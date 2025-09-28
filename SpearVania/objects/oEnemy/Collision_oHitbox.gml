if(canHit)
{
	flash = 5;
	global.hitPauseTime = 8;
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
}