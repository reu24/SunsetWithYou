idea = new Idea();
idea.initialize();

time_source = time_source_create(time_source_game, 1.2, time_source_units_seconds, function() {
	if (idea.should_make_idea()) {
		new_idea = idea.get_random_idea();
		if (is_undefined(new_idea.idea)) {
			time_source_stop(time_source);
			instance_destroy(IdeaObj);
		}
		else {
			instance_create_layer(0, 0, "Instances", IdeaObj, new_idea);
		}
	}
}, [], 99999999);

time_source_start(time_source);