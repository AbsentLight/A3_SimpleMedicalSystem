params ["_text","_duration","_callback","_callbackExtraParams"];

closeDialog 1;

createDialog "ActionBar";

_display = uiNamespace getVariable "SMS_ActionBar";

// Set dialog title
(_display displayCtrl 701) ctrlSetText _text;

// Set topper color to clients menu color
(_display displayCtrl 801) ctrlSetBackgroundColor ([] call SMS_fnc_getPlayersMenuColor);

_time = 0.0;
_progressbar = (_display displayCtrl 702);

_actionCancelled = false;

_playerInitialPos = getPos player;

while {_time < _duration} do {
	// Check if player has closed dialog (cancelled action)
	if (isNull findDisplay 700) exitWith {hint "display not found"; _actionCancelled = true};

	// Has player fallen unconscious while performing action
	if ([player] call SMS_fnc_isUnconscious) exitWith {_actionCancelled = true};

	// Has target moved away from the player (cancelling)
	if (((getPos player) distance _playerInitialPos) > 0.5) exitWith {_actionCancelled = true};

	uiSleep 0.015;
	_fillAmount = _time / _duration;
	_progressbar progressSetPosition _fillAmount;
	_time = _time + 0.015;
};

// Only perform callback if not interrupted
if (!_actionCancelled) then {
	[(player getVariable "SMS_MED_TARGET"), player, _callbackExtraParams] call _callback;
} else {
	hint "Action cancelled";
};

// Close action bar
closeDialog 1;

// Re-open medical menu
[(player getVariable "SMS_MED_TARGET")] call SMS_fnc_openSetupMedicalMenu; 

