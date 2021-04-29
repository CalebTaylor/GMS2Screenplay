/// @description Insert description here
// You can write your code in this editor
var halfw = w * 0.5;

//Draw The Box
draw_set_colour(c_white);
draw_set_alpha(1);
draw_roundrect_ext(x-halfw-border-2,y-h-(border*2)-2,x+halfw+border+2,y+2,0,0,false);
draw_set_colour(c_black);
draw_set_alpha(1);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,0,0,false);

draw_sprite(sMarker,0,x,y);
draw_set_alpha(1);

//Draw text

draw_set_colour(c_white);
draw_set_font(fSign);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text(x,y-h-border,text_current);

