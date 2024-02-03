i = 0;
j = 0;
msgs = string_split(msgs, "|");
msg = msgs[0];

time_source = time_source_create(time_source_game, 0.05, time_source_units_seconds, function() {
	do {
		j++;
	} until (string_char_at(msg, j) != " ")
	
}, [], 99999999);

time_source_start(time_source);