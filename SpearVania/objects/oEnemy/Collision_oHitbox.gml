if(canHit)
{
	flash = 5;
	global.hitPauseTime = 5;
	canHit = false;
	
	var centerX = x + (sprite_width / 2);
	var centerY = y + (sprite_height / 2);
	
	// Create VFX
	if(other.object_index == oSlashHitbox)
	{
		instance_create_layer(centerX - (sprite_width/2) - 16,other.y+2,"VFX",oHitVFX);
	}
	if(other.object_index == oSlashHitboxLeft)
	{
		instance_create_layer(centerX + (sprite_width/2),other.y+2,"VFX",oHitVFXLeft);
	}
}