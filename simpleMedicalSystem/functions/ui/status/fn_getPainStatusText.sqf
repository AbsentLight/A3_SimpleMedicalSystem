params ["_target"];

_return = "";

_pain = [_target] call SMS_fnc_getRelativePain;

if (_pain > 600) then {
	if (_pain > 1000) then {
		_return = [9, "<t color='#ff0000'>Is in extreme pain</t>"];
	} else {
		if (_pain > 800) then {
			_return = [7, "<t color='#ff0000'>Is in severe pain</t>"];
		} else {
			_return = [5, "<t color='#ffa500'>Is in significant pain</t>"];
		};
		
	};
} else {
	if (_pain > 400) then {
		_return = [3, "<t color='#dddd00'>Is in pain</t>"];
	} else {
		_return = [-1, ""];
	};
};

_return