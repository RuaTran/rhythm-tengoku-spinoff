// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawFadeIn()
{
	draw_set_colour(c_black);
	draw_set_alpha(menu_start_alpha);
	draw_rectangle(0,0,window_get_width(),window_get_height(),false)
	if(menu_start_alpha > 0)
	{
		menu_start_alpha -= 0.06;
	}
	else 
	{	
		menu_start = false;
	}
	draw_set_alpha(1);
}