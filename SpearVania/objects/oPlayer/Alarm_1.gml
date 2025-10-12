healBellFrame++;

if(healBellFrame > 8)
	healBellFrame = 0;
	
if(healing)
	alarm[1] = room_speed * 0.125;