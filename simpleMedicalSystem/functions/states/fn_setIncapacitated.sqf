params ["_target","_enable"];

if (_enable) then {
	_target setVariable ["SMS_UNCONSCIOUS", true, true];
	_target setUnconscious true;
	_target setCaptive true;
	[2] remoteExec ["closeDialog", _target, false];

	[true] call SMS_fnc_hideAllHud;
	[_target, _enable, 1] spawn SMS_fnc_unconsciousEffect;
	
} else {
	_wakeTime = 10;

	// Vain attempt to fix bug in `setUnconscious`
	if (weapons _target isEqualTo []) then {
		_target addWeapon "Binocular";
		_target selectWeapon "Binocular";
	};

	_target setVariable ["SMS_UNCONSCIOUS", false, true];
	_target setUnconscious false;
	_target setCaptive false;
	[_target, _enable, _wakeTime] spawn SMS_fnc_unconsciousEffect;
	[_wakeTime] spawn {
		params ["_wakeTime"];
		sleep (_wakeTime / 2);
		[false] call SMS_fnc_hideAllHud;
	}
};