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