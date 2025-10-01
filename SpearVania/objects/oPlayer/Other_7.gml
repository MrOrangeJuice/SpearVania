if(sprite_index == jumpStartSprite)
{
	jumpStartAnimation = false;
}

if(sprite_index == landSprite || sprite_index == runLandSprite && landAnimation)
{
	landAnimation = false;
}

if(sprite_index == attackSprite || sprite_index == stabSprite)
{
	attacking = false;	
	stabbing = false;
	if(instance_exists(oEnemy)) oEnemy.canHit = true;
	if(instance_exists(oSlashHitbox)) instance_destroy(oSlashHitbox);
	if(instance_exists(oSlashHitboxLeft)) instance_destroy(oSlashHitboxLeft);
	if(instance_exists(oStabHitbox)) instance_destroy(oStabHitbox);
	if(instance_exists(oStabHitboxLeft)) instance_destroy(oStabHitboxLeft);
	canSpawnHitbox = false;
}