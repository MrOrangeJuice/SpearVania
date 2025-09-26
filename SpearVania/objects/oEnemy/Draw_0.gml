/// @description Hitflash

draw_self();

if(flash > 0)
{
	shader_set(shHit);
	draw_self();
	shader_reset();
}