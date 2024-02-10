var _text_width = string_width(msg);
var _text_height = string_height(msg);

if point_in_rectangle(mouse_x, mouse_y, x - 7, y - 7, x + _text_width + 7, y + _text_height + 7)
{
	audio_stop_sound(sound);
	if (j > string_length(msg)) {
		if (++i == array_length(msgs)) {
			time_source_stop(time_source);
			if (room == Intro) {
				room_goto(Sunset);
			}
			else {
				room_goto(Intro);
			}
		}
		else {
			msg = msgs[i];
			j = 0;
			sound = audio_play_sound(Type, 0, 100);
			x = room_width / 2  - string_width(msg) / 2;
			y = room_height / 2 - string_height(msg) / 2;
		}
	}
}