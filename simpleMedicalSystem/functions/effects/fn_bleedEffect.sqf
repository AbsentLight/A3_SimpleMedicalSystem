params ["_enable", "_instant", "_bleedRate"];

// Exit if game display doesn't exist
if (isNull findDisplay 46) exitWith {};

_commitEffect = {
	params ["_instant", "_blood1", "_blood2"];
	if (_instant) then {
		_blood1 ctrlCommit 0;
		_blood2 ctrlCommit 0;
	} else {
		_blood1 ctrlCommit 3;
		_blood2 ctrlCommit 3;
	};
};

_blood1 = uiNamespace getVariable ["SMS_RSC_BLOOD1", controlNull];
_blood2 = uiNamespace getVariable ["SMS_RSC_BLOOD2", controlNull];

// Initialise resources
if (isNull _blood1 || {isNull _blood2}) then {

	player sideChat "Init Resources";

	_blood1 = findDisplay 46 ctrlCreate ["RscFullScreenPicture", -1];
    _blood2 = findDisplay 46 ctrlCreate ["RscFullScreenPicture", -1];

	_blood1 ctrlSetText "simpleMedicalSystem\data\blood1.paa";
    _blood2 ctrlSetText "simpleMedicalSystem\data\blood2.paa";

	uiNamespace setVariable ["SMS_RSC_BLOOD1", _blood1];
	uiNamespace setVariable ["SMS_RSC_BLOOD2", _blood2];
};

// On disable
if (!_enable) exitWith {
	player setVariable ["SMS_UI_BLEED_TICK", 0, false];

	_blood1 ctrlSetFade 1;
    _blood2 ctrlSetFade 1;

	[_instant, _blood1, _blood2] call _commitEffect;
};

/*
	Blood Effect
*/

_bleedTick = player getVariable ["SMS_UI_BLEED_TICK",0];



// Act every three seconds to allow effect transitions
if (_bleedTick % 3 == 0) then {
	_fade = linearConversion [0,18,_bleedRate,1,0];
	if (_bleedTick % 6 == 0) then {
		if (ctrlFade _blood1 > ctrlFade _blood2) then {
			_blood1 ctrlSetFade 0.5 * _fade;
			_blood2 ctrlSetFade _fade;
		} else {
			_blood1 ctrlSetFade _fade;
			_blood2 ctrlSetFade 0.5 * _fade;
		};
	} else {
		if (ctrlFade _blood1 > ctrlFade _blood2) then {
			_blood1 ctrlSetFade 1;
			_blood2 ctrlSetFade _fade;
		} else {
			_blood1 ctrlSetFade _fade;
			_blood2 ctrlSetFade 1;
		};
	};
};

if (_bleedTick >= 6) then {
	_bleedTick = 0;
} else {
	_bleedTick = _bleedTick + 1;
};

player setVariable ["SMS_UI_BLEED_TICK", _bleedTick, false];

[_instant, _blood1, _blood2] call _commitEffect;

