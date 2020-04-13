params ["_target", "_caller"];

// Must be a medic to perform this action
if (!([_caller] call SMS_fnc_isMedic)) exitWith {false};

// Is limping (either mode)
if ((_target getVariable "SMS_LIMPING_MODE") > 0) exitWith {true};

// Has enough pain to make them unconscious
if ((_target getVariable "SMS_PAIN") >= 800) exitWith {true};

// Otherwise false
false


