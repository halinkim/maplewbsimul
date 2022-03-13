/// @description Insert description here
// You can write your code in this editor
c_gray0 = make_color_rgb(51, 51, 51)
draw_set_alpha(0.5)
for (var i=0; i<array_length(LineX); i++) {
	draw_line_color(LineX[i], -1000, LineX[i], 1000, c_gray0, c_gray0)
}
draw_set_alpha(1)