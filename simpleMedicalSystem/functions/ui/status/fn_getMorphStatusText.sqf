params ["_target"];

_return = "";

_painMod = _target getVariable "SMS_PAIN_MOD";
_painCap = _target getVariable "SMS_PAIN_MOD_CAP";

if (_painMod > 0 || {_painCap > 0}) then {
	_return = [0, "<t color='#008800'>Is under the effect of Morphine</t>"];
} else {
	_return = [-1, ""];
};

_return