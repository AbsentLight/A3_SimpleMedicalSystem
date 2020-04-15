params ["_target", "_actor","_unused"];

player sideChat str _this;

if (_target == _actor) exitWith {};

_target call SMS_fnc_attended;
