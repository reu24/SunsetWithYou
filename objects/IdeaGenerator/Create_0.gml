idea = new Idea();
idea.initialize();

time_source = time_source_create(time_source_game, 1.2, time_source_units_seconds, function() {
	if (idea.should_make_idea()) {
		new_idea = idea.get_random_idea();
		if (is_undefined(new_idea.idea)) {
			time_source_stop(time_source);
			instance_destroy(IdeaObj);
			
			if (new_idea.type == "m") {
				room_goto(GoodEnd);
			}
			if (new_idea.type == "ro") {
				room_goto(PushyEnd);
			}
			if (new_idea.type == "ra" || new_idea.type == "d") {
				room_goto(NotDoingAnythingEnd);
			}
		}
		else {
			new_idea.generator = self;
			instance_create_layer(0, 0, "Instances", IdeaObj, new_idea);
		}
	}
}, [], 99999999);

time_source_start(time_source);