// onUnload for medical menu
params ["_display", "_exitCode"];

if (_display == findDisplay 800) then {

	_orgTarget = player getVariable "SMS_MED_TARGET";
	// Update medical targets last attended time
	[_orgTarget] call SMS_fnc_attended;

	if (_exitCode != 1) then {
		player setVariable ["SMS_MED_TARGET", objNull, true];
	};
};