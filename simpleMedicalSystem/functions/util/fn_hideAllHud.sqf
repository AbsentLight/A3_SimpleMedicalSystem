params ["_hide"];

if (_hide) then {
	showHUD [false, false, false, false, false, false, false, false, false];
} else {
	showHUD [true, true, true, true, true, true, true, true, true];
};
