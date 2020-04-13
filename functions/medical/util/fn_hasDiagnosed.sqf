params ["_target", "_medic"];

if (_target == _medic) exitWith {true};

_lastAttended = _target getVariable "SMS_LAST_ATTENDED";

if (serverTime - _lastAttended <= 90) exitWith {true};

// Otherwise false
false