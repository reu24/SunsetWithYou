if (start_left) {
	x += x_speed;	
}
else {
	x -= x_speed;	
}
y = sin(x / y_height) * y_speed + y_offset;