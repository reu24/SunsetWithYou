start_left = irandom(1) == 0;
if (!start_left) {
	x = room_width;
}

x_speed = random(3) + 1;
y_speed = random(35) + 10;
y_height = random(70) + 20;
y_offset = max(min(random(room_height), room_height - y_speed - string_height(idea)), y_speed + string_height(idea));