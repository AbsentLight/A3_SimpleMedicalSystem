params ["_text","_duration","_callback","_callbackExtraParams"];

closeDialog 1;

createDialog "ActionBar";

_display = uiNamespace getVariable "SMS_ActionBar";

// Set dialog title
(_display displayCtrl 701) ctrlSetText _text;

// Set topper color to clients menu color
(_display displayCtrl 801) ctrlSetBackgroundColor ([] call SMS_fnc_getPlayersMenuColor);

_time = 0.0;
_duration = 1 max _duration;
_progressbar = (_display displayCtrl 702);

_displayOpen = true;

while {_time < _duration} do {
	if (isNull findDisplay 700) exitWith {hint "display not found"; _displayOpen = false};
	sleep 0.01;
	_fillAmount = _time / _duration;
	_progressbar progressSetPosition _fillAmount;
	_time = _time + 0.01;
};

// Only perform callback if not interrupted
if (_displayOpen) then {
	[(player getVariable "SMS_MED_TARGET"), player, _callbackExtraParams] call _callback;
};

// Close action bar
closeDialog 1;

// Re-open medical menu
[(player getVariable "SMS_MED_TARGET")] call SMS_fnc_openSetupMedicalMenu; 

