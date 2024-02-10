draw_set_alpha(1);
var displayedMessage = string_copy(msg, 1, j);
draw_text(x, y, displayedMessage);

var _text_width = string_width(displayedMessage);
var _text_height = string_height(displayedMessage);
if (j > string_length(msg) && point_in_rectangle(mouse_x, mouse_y, x - 7, y - 7, x + _text_width + 7, y + _text_height + 7)) {
	draw_line(x, y + _text_height, x + _text_width, y + _text_height);
	window_set_cursor(cr_handpoint);
}
else {
	window_set_cursor(cr_default);
}