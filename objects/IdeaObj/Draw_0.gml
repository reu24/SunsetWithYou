if (alpha != 1) {
	alpha -= 0.1;
	if (alpha <= 0) {
		instance_destroy(self);
	}
}

draw_set_alpha(alpha);
draw_text(x, y, idea);

var _text_width = string_width(idea);
var _text_height = string_height(idea);
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + _text_width, y + _text_height)) {
	draw_line(x, y + _text_height, x + _text_width, y + _text_height);
	window_set_cursor(cr_handpoint);
	generator.hovering = true;
}