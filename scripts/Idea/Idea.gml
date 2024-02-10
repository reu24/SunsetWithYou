function Idea() constructor {
	_romantic_ideas = ds_queue_create();
	_doubtful_ideas = ds_queue_create();
	_random_ideas = ds_queue_create();
	_moment_ideas = ds_queue_create();
	
	_romantic = 1;
	_doubtful = 1;
	_random = 1;
	_moment = 1;
	
	_ignored = 2;
	_not_ignored = 2;
	
	add_romantic = function(_idea) {
		ds_queue_enqueue(_romantic_ideas, _idea);
	}
	
	add_doubtful = function(_idea) {
		ds_queue_enqueue(_doubtful_ideas, _idea);
	}
	
	add_random = function(_idea) {
		ds_queue_enqueue(_random_ideas, _idea);
	}
	
	add_moment = function(_idea) {
		ds_queue_enqueue(_moment_ideas, _idea);
	}
	
	increase = function(_type) {
		_not_ignored++;
		
		if (_type == "ro") {
			_romantic++;	
		}
		else if (_type == "d") {
			_doubtful++;	
		}
		else if (_type == "ra") {
			_random++;
		}
		else if (_type == "m") {
			_moment++;	
		}
	}
	
	decrease = function(_type) {
		_ignored++;
	}
	
	should_make_idea = function() {
		if (_ignored + _not_ignored == 0) {
			return true;
		}
		
		var _ignored_percentage = _ignored / (_ignored + _not_ignored);
		return random(100) > min(_ignored_percentage * 100, 35);
	}
	
	// can return idea = undefined! then the game is over.
	get_random_idea = function() {
		var _ignored_percentage = (_ignored / 2) / (_ignored + _not_ignored);
		var _total = _romantic + _doubtful + _moment + _random;
		var _moment_percentage = _moment / _total;
		var _r = random(70) + 30;
		idea_struct = self;
		if (_ignored_percentage * 100 + _moment_percentage * 100 > _r) {
			return {idea_struct: idea_struct, type: "m", idea: ds_queue_dequeue(_moment_ideas)};
		}
		
		_total -= _moment;
		_r = random(100);
		if (_r < _romantic / _total * 100) return {idea_struct: idea_struct, type: "ro", idea: ds_queue_dequeue(_romantic_ideas)};
		if (_r < _doubtful / _total * 100 + _romantic / _total * 100) return {idea_struct: idea_struct, type: "d", idea: ds_queue_dequeue(_doubtful_ideas)};
		return {idea_struct: idea_struct, type: "ra", idea: ds_queue_dequeue(_random_ideas)};
	}
	
	
	initialize = function() {
		_romantic_ideas = ds_queue_create();
		_doubtful_ideas = ds_queue_create();
		_random_ideas = ds_queue_create();
		_moment_ideas = ds_queue_create();
		
		add_romantic("Huh, it's just us two.");
		add_romantic("Should I talk to her?");
		add_romantic("She's so pretty.");
		add_romantic("Should I sit next to her?");
		add_romantic("I want to talk to her.");
		add_romantic("What should I say?");
		add_romantic("Should I say 'Hi'?");
		add_romantic("I should be braver.");
		add_romantic("Can I watch the sunset with her?");
		add_romantic("Talking to her shouldn't be such a big of a deal, right?");
		add_romantic("She looks kinda cute.");
		add_romantic("Can I get close to her?");
		add_romantic("What would she feel if I talked with her?");
		
		add_doubtful("I shouldn't just stand here.");
		add_doubtful("Why am I even here? I should go home.");
		add_doubtful("She doesn't even notice me.");
		add_doubtful("What is this weird girl even doing?");
		add_doubtful("Why am I still here?");
		add_doubtful("I should just go away.");
		add_doubtful("Silly me. I'm should be heading off.");
		add_doubtful("There's no point in staying.");
		add_doubtful("She surely won't care about me.");
		add_doubtful("What am I? A creep?");
		add_doubtful("I'm ugly");
		add_doubtful("What am I doing?");
		add_doubtful("There's no way I'll achieve anything here");
		add_doubtful("I'll just go.");
		
		add_random("I haven't studied for the exam.");
		add_random("What should I eat tonight?");
		add_random("It's already this late...");
		add_random("I have an exam tomorrow.");
		add_random("I think I need to cook for myself...");
		add_random("What will happen if I don't pass the exam?");
		add_random("When is my best friends birthday again?");
		add_random("What will the future be like?");
		add_random("I hope I don't miss his birthday.");
		add_random("When does the last train go?");
		add_random("All the games are running so slow lately.");
		add_random("I really like the new hoodie I bought.");
		add_random("Maybe I should buy a new PC.");
		add_random("I'm pretty sure my friends birthday is in August.");
		add_random("I should probably buy a present.");
		add_random("But PCs cost so much money...");
		
		add_moment("This sunset is so nice.");
		add_moment("I shouldn't think so much.");
		add_moment("Certainty doesn't exist and that's fine.");
		add_moment("I don't want to leave.");
		add_moment("The sunset is beautiful.");
		add_moment("The cold breeze feels good.");
		add_moment("I did enough thinking.");
		add_moment("Don't overreact");
		add_moment("I should focus on breathing.");
		add_moment("Maybe I should just cherrish this moment.");
	}
}