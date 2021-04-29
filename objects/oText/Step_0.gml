/// @description Insert description here
// You can write your code in this editor
/// @desc Progress Text
if ((keyboard_check_pressed(ord("X")))) {
    text = "";
	leftSign = true;
}



{//draw letters one by one, from text object, with correct font, height, etc.
	letters += spd;
	text_current = string_copy(text, 1, floor(letters));
	draw_set_font(fSign);
	if (h == 0) h = string_height(text);
	if (leftSign == false) w = string_width(text_current);
}


if leftSign { //when done talking, shrink sign.
    w -= 25;
}

if w < 0 {//when sign is shrunk, remove self
    instance_destroy();
}
