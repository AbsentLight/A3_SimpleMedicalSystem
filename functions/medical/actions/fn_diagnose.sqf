params ["_target", "_actor"];

player sideChat str _this;

if (_target == _actor) exitWith {};

_target call SMS_fnc_attended;
