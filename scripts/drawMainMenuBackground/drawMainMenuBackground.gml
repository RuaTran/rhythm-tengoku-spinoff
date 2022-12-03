// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function drawMainMenuBackground(){
	var img_scale = 0.5;

	if (bg_indirect_scroll >= sprite_get_width(bg_indirect)){
		bg_indirect_scroll = 0;
	}
	if (bg_indirect2_scroll >= sprite_get_width(bg_indirect2)*1.5){
		bg_indirect2_scroll = 0;
	}
	
	for (var i = -3; i <window_get_width()/(sprite_get_width(bg_indirect)*img_scale); i+=1)
	{
		for (var j = -1; j <window_get_height()/(sprite_get_height(bg_indirect)*img_scale); j+=1)
		{
			draw_sprite_ext(bg_indirect,0,bg_indirect_scroll+i*sprite_get_width(bg_indirect)* img_scale,window_get_height()-sprite_get_height(bg_indirect)*img_scale-(bg_indirect_scroll+j*sprite_get_width(bg_indirect))*img_scale,img_scale,img_scale,0,-1,1)
		}
	}
	
	for (var i = -5; i <window_get_width()/(sprite_get_width(bg_indirect2)*img_scale); i+=1.5)
	{
		for (var j = -3; j <window_get_height()/(sprite_get_height(bg_indirect2)*img_scale); j+=1.5)
		{
			draw_sprite_ext(bg_indirect2, 0,  window_get_width()-sprite_get_width(bg_indirect2)*img_scale+sprite_get_width(bg_indirect2)*img_scale-bg_indirect2_scroll-i*sprite_get_width(bg_indirect2)* img_scale, window_get_height()-sprite_get_height(bg_indirect2)*img_scale-(bg_indirect2_scroll*2+j*sprite_get_width(bg_indirect2))*img_scale,img_scale,img_scale,0,-1,1)
		}
	}
	
	
	bg_indirect_scroll+=0.8
	bg_indirect2_scroll+=1.5
}