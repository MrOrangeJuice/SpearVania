function PlayRandomExplosionSound()
{
	var rand = irandom_range(1,3);
	
	switch(rand)
	{
		case 1:
			audio_play_sound(sndExplosion1,5,false);
			break;
		case 2:
			audio_play_sound(sndExplosion2,5,false);
			break;
		case 3:
			audio_play_sound(sndExplosion3,5,false);
			break;
	}
}