params ["_target"];

/*
	Status messages		  |     Predicates				|	Rating (HiHi)
		- Bleeding				Diagnosed					10
		- Blood Loss			Diagnosed or Conscious		7
		- Pain 					Diagnosed or Conscious		7
		- Cannot Run			Conscious					5
		- On Morphine			Diagnosed					3
		- On Epinephrine		Diagnosed					3
*/

_diagnosed = [_target, player] call SMS_fnc_hasDiagnosed;
_conscious = [_target] call SMS_fnc_isUnconscious;

_items = [];

if (_diagnosed) then {
	// Bleeding
	_items pushBack ([_target] call SMS_fnc_getBleedingStatusText);

	// Morphine
	_items pushBack ([_target] call SMS_fnc_getMorphStatusText);

	// Epinephrine
	_items pushBack ([_target] call SMS_fnc_getEpiStatusText);
};

if (_conscious) then {

};

if (_diagnosed || _conscious) then {
	// Blood Loss
	_items pushBack ([_target] call SMS_fnc_getBloodLossStatusText);

	// Pain
	_items pushBack ([_target] call SMS_fnc_getPainStatusText);
};

_ordered = [];

for [{_i = 10}, {_i >= 0}, {_i = _i - 1}] do {
	{
		if (_x#0 == _i) then {
			_ordered pushBack _x#1;
		};
	} forEach _items;
};


_sText = parseText (_ordered joinString "<br/>");

_sText
