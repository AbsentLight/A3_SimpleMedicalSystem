// onUnload for medical menu
params ["_display", "_exitCode"];

if (_display == findDisplay 800) then {
	if (_exitCode != 1) then {
		player setVariable ["SMS_MED_TARGET", objNull, true];
	};
};