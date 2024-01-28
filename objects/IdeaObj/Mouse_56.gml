var _text_width = string_width(idea);
var _text_height = string_height(idea);

if point_in_rectangle(mouse_x, mouse_y, x, y, x + _text_width, y + _text_height)
{
	idea_struct.increase(type);
	instance_destroy(self)
}