params ["_target"];

_return = "";

_bleedRate = [_target] call SMS_fnc_getBleedRate;

if (_bleedRate > 9) then {
	if (_bleedRate > 13) then {
		_return = [10, "<t color='#ff0000'>Has severe bleeding</t>"];
	} else {
		_return = [6, "<t color='#ffa500'>Has substantial bleeding</t>"];
	};
} else {
	if (_bleedRate > 4) then {
		_return = [3, "<t color='#dddd00'>Has minor bleeding</t>"];
	} else {
		if (_bleedRate > 0) then {
			_return = [2, "<t color='#dddd00'>Has a boo-boo-bleed</t>"];
		} else {
			_return = [-1, ""];
		};
		
	};
};

_return