params ["_target", "_caller"];

_unconscious	= _target getVariable "SMS_UNCONSCIOUS";

// If they are unconscious then they'll need attention
if ([_target] call SMS_fnc_isUnconscious) exitWith {true};

// If they're not stable they need medical attention
if (!([_target] call SMS_fnc_isStable)) exitWith {true};

// If they can have basic aid
if (([_target, _caller] call SMS_fnc_canHaveBasic)) exitWith {true};

// If they can have advanced aid
if (([_target, _caller] call SMS_fnc_canHaveAdv)) exitWith {true};

// If they can have Epi
if ([_target] call SMS_fnc_canHaveEpi) exitWith {true};

// If they can have Morphine
if ([_target] call SMS_fnc_canHaveMorph) exitWith {true};

// Otherwise false
false