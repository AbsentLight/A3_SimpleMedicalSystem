params ["_part"];

_target = player getVariable "SMS_MED_TARGET";

_targetHasTourn = [_target, _part] call SMS_fnc_partHasTourniquet;

if (_targetHasTourn) exitWith {"Removing Tourniquet..."};
if (!_targetHasTourn) exitWith {"Applying Tourniquet..."};
"Error"