params ["_part"];

_target = player getVariable "SMS_MED_TARGET";

_targetHasTourn = [_target, _part] call SMS_fnc_partHasTourniquet;

_caller sideChat str _targetHasTourn;
_target sideChat str _targetHasTourn;

if (_targetHasTourn) exitWith {"Removing Tourniquet..."};
if (!_targetHasTourn) exitWith {"Applying Tourniquet..."};
"Error"