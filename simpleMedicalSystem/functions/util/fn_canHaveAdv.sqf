params ["_target", "_caller"];

// Must be a medic to perform this action
if (!([_caller] call SMS_fnc_isMedic)) exitWith {false};

// Cannot be used unless a unit is stable
if (!([_target] call SMS_fnc_isStable)) exitWith {false};

if (!([_target] call SMS_fnc_isFresh)) exitWith {true};

// Otherwise false
false