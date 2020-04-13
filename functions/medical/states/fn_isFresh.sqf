params ["_target"];

if (!([_target] call SMS_fnc_isStable)) exitWith {false};
if ((_target getVariable "SMS_PAIN") != 0) exitWith {false};
if ((_target getVariable "SMS_BLOOD") != 1200) exitWith {false};
true
