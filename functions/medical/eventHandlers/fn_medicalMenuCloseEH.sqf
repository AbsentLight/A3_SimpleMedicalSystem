// onUnload for medical menu
params ["_display", "_exitCode"];

player sideChat (format ["%1 : %2", str _display, str _exitCode]);

if (_display == findDisplay 800) then {
	if (_exitCode != 1) then {
		player setVariable ["SMS_MED_TARGET", objNull, true];
	};
};