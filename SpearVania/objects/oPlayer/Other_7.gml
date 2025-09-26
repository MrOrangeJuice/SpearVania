if(sprite_index == jumpStartSprite)
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

if(sprite_index == landSprite || sprite_index == runLandSprite && landAnimation)
{
	landAnimation = false;
}

if(sprite_index == attackSprite)
{
	attacking = false;	
	oEnemy.canHit = true;
	if(instance_exists(oSlashHitbox)) instance_destroy(oSlashHitbox);
	if(instance_exists(oSlashHitboxLeft)) instance_destroy(oSlashHitboxLeft);
	canSpawnHitbox = false;
}