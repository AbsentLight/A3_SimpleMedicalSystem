params ["_target"];

if ([_target] call SMS_fnc_isBleeding) exitWith {false};
if (([_target] call SMS_fnc_getTourniquetCount) > 0) exitWith {false};
true

