params ["_target"];

_return = "";

_bloodMod = _target getVariable "SMS_BLOOD_MOD";
_bloodCap = _target getVariable "SMS_BLOOD_MOD_CAP";

if (_bloodMod > 0 || {_bloodCap > 0}) then {
	_return = [0, "<t color='#008800'>Is under the effect of Epinephrine</t>"];
} else {
	_return = [-1, ""];
};

_return