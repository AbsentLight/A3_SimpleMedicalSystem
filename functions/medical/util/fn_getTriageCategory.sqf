params ["_target"];

// Cat 1 - Critical - Less than 90 seconds until death
// Cat 2 - Urgent   - Death within 5 mins
// Cat 3 - Minor    - Not stable
// Cat 4 - Stable   - Patient is not at risk
// DEAD

// Patient is dead
if (!(alive _target)) exitWith {0};

// Patient is stable
if ([_target] call SMS_fnc_isStable) exitWith {4};

_bloodVol  = _target getVariable "SMS_BLOOD";
_bleedRate = [_target] call SMS_fnc_getBleedRate;

_tournCount = [_target] call SMS_fnc_getTourniquetCount;
_painLevel  = _target getVariable "SMS_PAIN";

// Patient has Cat 1 bleeding
if (_bleedRate * 90 > _bloodVol) exitWith {1};

// Patient has Cat 2 bleeding
if (_bleedRate * 300 > _bloodVol) exitWith {2};


3 // Return Cat 3 (Minor)