if (j > string_length(msg)) {
	if (++i == array_length(msgs)) {
		time_source_stop(time_source);
		if (room == Intro) {
			room_goto(Sunset);
		}
		else if (room == EndRoom) {
			room_goto(Intro);
		}
		else {
			room_goto(EndRoom);
		}
	}
	else {
		msg = msgs[i];
		j = 0;
	}
}