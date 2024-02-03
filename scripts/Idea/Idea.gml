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
		show_debug_message(_r);
		show_debug_message(_romantic / _total * 100);
		show_debug_message("\n");
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
		add_romantic("She looks kinda cute.");
		add_romantic("Should I sit next to her?");
		add_romantic("I want to talk to her.");
		add_romantic("What should I say?");
		add_romantic("I'm the guy. I should make the move.");
		add_romantic("Should I say 'Hi'?");
		add_romantic("I will talk to her.");
		
		add_doubtful("I shouldn't just stand here.");
		add_doubtful("Why am I even here? I should go home.");
		add_doubtful("She doesn't even notice me.");
		add_doubtful("What is this weird girl even doing?");
		add_doubtful("Why am I still here?");
		add_doubtful("I should just go away.");
		add_doubtful("Silly me. I'm heading off.");
		add_doubtful("Bye.");
		
		add_random("I haven't studied for the exam.");
		add_random("What should I eat tonight?");
		add_random("It's already this late...");
		add_random("I have an exam tomorrow.");
		add_random("I think I need to cook for myself...");
		add_random("What will happen if I don't pass the exam?");
		add_random("What will the future be like?");
		add_random("When does the last train go?");
		add_random("What should I do in my life?");
		
		add_moment("This sunset is so nice.");
		add_moment("I shouldn't think so much.");
		add_moment("Certainty doesn't exist and that's fine.");
		add_moment("The cold breeze feels good.");
		add_moment("I did enought thinking.");
		add_moment("I should focus on breathing.");
		add_moment("Maybe I should just cherrish this moment.");
	}
}

// It was on a seamingly normal summer day... when I noticed a girl sitting all alone at the beach. I was amazed at how absorbed she was by sunset. It almost seemed like she was enchanted by the view.
/*And so I left the beach.

I said: "Umm. Hi". But it was so quiet that she didn't even hear me.

...
...
It was so much fun just sitting next to her and looking at the sunset. I should probably do this again some time later.
"The sunset is truly amazing", I suddendly hear her say, "Although you never know what will happen tomorrow, the sun will set regardless. And so will your problems eventually."

*/