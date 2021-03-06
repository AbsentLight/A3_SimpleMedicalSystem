params ["_target"];

/*
	Tick
*/

_tick = _target getVariable ["SMS_TICK",0];
_tickMajor = false;
if (_tick == 0) then {
	_tickMajor = true;
};

// Run minor tick actions
[_target, _tick] call SMS_fnc_updatePlayerStateMinor;

// Increase Tick
_tick = _tick + 1;
if (_tick >= 32) then {
	_tick = 0
};
_target setVariable ["SMS_TICK", _tick, false];

if (!_tickMajor) exitWith {};

/*
	Vars
*/

// Pain and Blood in the Patient
_pain = _target getVariable "SMS_PAIN";
_painTemp = _target getVariable "SMS_PAIN_TEMP";
_blood = _target getVariable "SMS_BLOOD";

// Medication currently acting
_painMod = _target getVariable "SMS_PAIN_MOD";
_bloodMod = _target getVariable "SMS_BLOOD_MOD";

// Amount of medication that are still to take effect
_painModCap = _target getVariable "SMS_PAIN_MOD_CAP";
_bloodModCap = _target getVariable "SMS_BLOOD_MOD_CAP";

//["face_hub","neck","head","pelvis","spine1","spine2","spine3","body","arms","hands","legs","body"]
// spine1: Abdomen, spine2: Diaphragm, spine3: Chest



/*
	Temp pain
*/
_painTemp = (_painTemp - 5) max 0;
_target setVariable ["SMS_PAIN_TEMP", _painTemp, true];

/*
	Blood Loss and Pain from injuries
*/

_headBleed = _target getVariable "SMS_HEAD_BLEED";
_bodyBleed = _target getVariable "SMS_BODY_BLEED";
_blood = _blood - _headBleed;
_blood = _blood - _bodyBleed;

_rArmTourn = _target getVariable "SMS_RARM_TOURN";
_rArmBleed = _target getVariable "SMS_RARM_BLEED";
if (_rArmTourn) then {
	if (_rArmBleed > 0) then {
		_blood = _blood - 1;
	};
	_pain = _pain + 3;
} else {
	_blood = _blood - _rArmBleed;
};

_lArmTourn = _target getVariable "SMS_LARM_TOURN";
_lArmBleed = _target getVariable "SMS_LARM_BLEED";
if (_lArmTourn) then {
	if (_lArmBleed > 0) then {
		_blood = _blood - 1;
	};
	_pain = _pain + 3;
} else {
	_blood = _blood - _lArmBleed;
};

_rLegTourn = _target getVariable "SMS_RLEG_TOURN";
_rLegBleed = _target getVariable "SMS_RLEG_BLEED";
if (_rLegTourn) then {
	if (_rLegBleed > 0) then {
		_blood = _blood - 1;
	};
	_pain = _pain + 3;
} else {
	_blood = _blood - _rLegBleed;
};

_lLegTourn = _target getVariable "SMS_LLEG_TOURN";
_lLegBleed = _target getVariable "SMS_LLEG_BLEED";
if (_lLegTourn) then {
	if (_lLegBleed > 0) then {
		_blood = _blood - 1;
	};
	_pain = _pain + 3;
} else {
	_blood = _blood - _lLegBleed;
};

// Store new values of pain and blood
_target setVariable ["SMS_PAIN", _pain min 1200, true];
_target setVariable ["SMS_BLOOD", _blood max 0, true];

/*
	Medication spreading and taking effect
*/
// Effect loss (if not increasing)
if (_bloodModCap == 0 && {_bloodMod > 0}) then {
	_bloodMod = _bloodMod - (_bloodMod min 4);
};
if (_painModCap == 0 && {_painMod > 0}) then {
	_painMod = _painMod - (_painMod min 4);
};

// Morphine & Pain
_painMod = _painMod + (_painModCap min 20);
_painModCap = _painModCap - (_painModCap min 20);
_target setVariable ["SMS_PAIN_MOD", _painMod, true];
_target setVariable ["SMS_PAIN_MOD_CAP", _painModCap, true];

// Epi & Blood Pressure
_bloodMod = _bloodMod + (_bloodModCap min 20);
_bloodModCap = _bloodModCap - (_bloodModCap min 20);
_target setVariable ["SMS_BLOOD_MOD", _bloodMod, true];
_target setVariable ["SMS_BLOOD_MOD_CAP", _bloodModCap, true];



/*
	Animations
*/

// Bleeding animation
_bleedRate = [_target] call SMS_fnc_getBleedRate;
if (_bleedRate > 0) then {
	[true, false, _bleedRate] call SMS_fnc_bleedEffect;
} else {
	[false, false, 0] call SMS_fnc_bleedEffect;
};

// Blood Loss animation
if (_blood < 1200) then {
	[true, false] call SMS_fnc_bloodLossEffect;
};




