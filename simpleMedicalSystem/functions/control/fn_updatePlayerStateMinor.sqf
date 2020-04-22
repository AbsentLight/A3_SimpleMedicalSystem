params ["_target", "_tick"];

_blood = _target getVariable "SMS_BLOOD";
_bloodMod = _target getVariable "SMS_BLOOD_MOD";

/*
	Death Conditions
*/
if (_blood <= 0) then {
	_target setDamage 1;
};

/*
	Unconscious Checks
*/
_unconscious = _target getVariable "SMS_UNCONSCIOUS";

// Get relative pain/blood after meds are accounted for
_relPain = [_target] call SMS_fnc_getRelativePain;
_relBlood = (_blood + _bloodMod) min 1200;


if (!_unconscious && {_relPain > 800 || _relBlood < 600}) then {
	[_target, true] call SMS_fnc_setIncapacitated;
	[false, 0] call SMS_fnc_painEffect;
	_unconscious = true;
} else {
	if (_unconscious && {_relPain < 700 && {_relBlood > 700}}) then {
		[_target, false] call SMS_fnc_setIncapacitated;
	};
};

/*
	Pain Animation
*/
if (!_unconscious && {_relPain > 400}) then {
	[true, _relPain] call SMS_fnc_painEffect;
} else {
	[false, 0] call SMS_fnc_painEffect;
};

/*
	Blood Loss Animation (Cancel on full heal)
*/
if (_blood == 1200) then {
	[false, true] call SMS_fnc_bloodLossEffect;
};

/*
	Aim Shake -- based on pain
*/
_handShake = linearConversion [0,1200,_relPain,0,1,true];
_target setHit ["hands", _handShake];



/*
	Morphine & Limping
*/
_painMod = _target getVariable "SMS_PAIN_MOD";
_painModCap = _target getVariable "SMS_PAIN_MOD_CAP";

_onMorph = false;
if (_painMod >= 200 || {_painModCap > 0}) then {
	_onMorph = true;
};

_limping = _target getVariable "SMS_LIMPING";
_limpingMode = _target getVariable "SMS_LIMPING_MODE";
switch (_limpingMode) do {
    case 0: {
		if (_target getHit "legs" > 0) then {
			[_target,0] call SMS_fnc_setLimping;
		};
	};
	case 1: {
		if (_onMorph && {_limping}) then {
			[_target,2] call SMS_fnc_setLimping;
		};
	};
	case 2: {
		if (!_onMorph && {!_limping}) then {
			[_target,1] call SMS_fnc_setLimping;
		};
	};
    default {};
};
