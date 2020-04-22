params ["_target", "_actor","_unused"];

if (_target == _actor) exitWith {};

_target call SMS_fnc_attended;
