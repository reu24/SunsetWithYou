function Idea() constructor {
	_romantic_ideas = ds_queue_create();
	_doubtful_ideas = ds_queue_create();
	_random_ideas = ds_queue_create();
	_moment_ideas = ds_queue_create();
	
	_romantic = 20;
	_doubtful = 20;
	_random = 20;
	_moment = 20;
	
	_ignored = 40;
	_not_ignored = 40;
	
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
		return random(100) > _ignored_percentage * 100;
	}
	
	// can return idea = undefined! then the game is over.
	get_random_idea = function() {
		var _ignored_percentage = (_ignored / 2) / (_ignored + _not_ignored);
		var _total = _romantic + _doubtful + _moment + _random;
		var _moment_percentage = _moment / _total;
		var _r = random(1000) + 50;
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
		
		add_romantic("Should I hold her hand?");
		add_romantic("Huh, it's just us two");
		add_romantic("ro3");
		add_romantic("ro4");
		add_romantic("ro5");
		add_romantic("ro6");
		add_romantic("ro7");
		add_romantic("ro8");
		
		add_doubtful("d1");
		add_doubtful("d2");
		add_doubtful("d3");
		add_doubtful("d4");
		add_doubtful("d5");
		add_doubtful("d6");
		add_doubtful("d7");
		add_doubtful("d8");
		
		add_random("ra1");
		add_random("ra2");
		add_random("ra3");
		add_random("ra4");
		add_random("ra5");
		add_random("ra6");
		add_random("ra7");
		add_random("ra8");
		add_random("ra9");
		
		add_moment("m1");
		add_moment("m2");
		add_moment("m3");
		add_moment("m4");
		add_moment("m5");
		add_moment("m6");
		add_moment("m7");
		add_moment("m8");
		add_moment("m9");
	}
}