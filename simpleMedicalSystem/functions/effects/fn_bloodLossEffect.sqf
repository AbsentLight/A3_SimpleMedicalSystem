params ["_enable", "_instant"];

_effect = player getVariable "ppBloodDesat";

if (!_enable) exitWith {
	_effect ppEffectEnable false;
};

_effect ppEffectEnable true;

_blood = player getVariable "SMS_BLOOD";

_desatIntensity = linearConversion [400,1200,_blood,1,0,true];
_alphaB = linearConversion [400,1200,_blood,0.4,0,true];
_alphaC = linearConversion [400,1200,_blood,0.4,1,true];

_desatArray = [_desatIntensity,_desatIntensity,_desatIntensity,0];

_effect ppEffectAdjust [1, 1, 0, [0, 0, 0, _alphaB], [1, 1, 1, _alphaC], _desatArray];

if (_instant) then {
	_effect ppEffectCommit 0.3;
} else {
	_effect ppEffectCommit 1;
};