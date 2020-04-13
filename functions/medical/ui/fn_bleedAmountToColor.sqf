params ["_flowRate"];

_color = [];

switch (_flowRate) do {
	case 3: {
		_color = [1,0,0,1];
	};
	case 2: {
		_color = [1,0.66,0,1];
	};
	case 1: {
		_color = [0.9,0.9,0,1];
	};
	default {
		_color = [1,1,1,1];
	};
};

// Return color
_color