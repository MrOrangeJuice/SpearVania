draw_self();

if(healing)
{
	healCursorX += healCursorSpeed;
	draw_sprite(sHealMeter,0,(x-16),y-6);
	draw_sprite(sHealZone,0,(x-16)+healZonePos,y-5);
	draw_sprite(sHealCursor,0,(x-16)+healCursorX,y-7);
	draw_sprite(sBellGrow,healBellFrame,x-16+healZonePos-2,y-18);
}