params ["_target"];

_return = "";

_blood = _target getVariable "SMS_BLOOD";

if (_blood < 600) then {
	if (_blood < 300) then {
		_return = [8, "<t color='#ff0000'>Suffering from critical blood loss</t>"];
	} else {
		_return = [5, "<t color='#ffa500'>Suffering from significant blood loss</t>"];
	};
} else {
	if (_blood < 900) then {
		_return = [3, "<t color='#dddd00'>Suffering from minor blood loss</t>"];
	} else {
		_return = [-1, ""];
	};
};

_return