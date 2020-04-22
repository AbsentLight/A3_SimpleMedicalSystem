params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];

if (_key != 219) exitWith {false};
if (player getVariable "SMS_UNCONSCIOUS") exitWith {false};

closeDialog 0;

_lookingAt = cursorObject;
if (isPlayer _lookingAt || {(cursorObject getVariable ["SMS_UNIT_NAME", ""]) != ""}) then {
	[_lookingAt] call SMS_fnc_openSetupMedicalMenu;
} else {
	[player] call SMS_fnc_openSetupMedicalMenu;
};
false
