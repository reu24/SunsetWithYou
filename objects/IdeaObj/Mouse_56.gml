var _text_width = string_width(idea);
var _text_height = string_height(idea);

if (alpha == 1 && point_in_rectangle(mouse_x, mouse_y, x, y, x + _text_width, y + _text_height))
{
	part_particles_burst(part_system_create_layer("FX", false), mouse_x, mouse_y, ClickFx);
	audio_play_sound(Click, 0, 0);
	alpha -= 0.01;
	
	idea_struct.increase(type);
}