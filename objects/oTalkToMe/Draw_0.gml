/// @description If nearby, draw x icon
draw_self();
if nearby && alive && counter <= array_length_1d(screenplay) {
draw_sprite_ext(sControlx, 0, x, y - 32, 1, -1, 0, c_white, 1);
}

