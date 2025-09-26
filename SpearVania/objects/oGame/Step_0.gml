if(global.key_pause)
{
	if(global.paused)
	{
		global.paused = false;
	}
	else if(!global.paused)
	{
		global.paused = true;
	}
}

global.hitPauseTime--;
if(global.hitPauseTime > 0)
{
	global.hitPause = true;	
}
else
{
	global.hitPause = false;	
}