params ["_target"];



createDialog "MedicalMenu";

_display = uiNamespace getVariable "SMS_MedicalMenu";

player sideChat str _display;

player setVariable ["SMS_MED_TARGET", _target, true];

_name = _target getVariable "SMS_UNIT_NAME";

// Set dialog title
(_display displayCtrl 801) ctrlSetText (format ["Medical Treatment - %1", _name]);

_bandagePartControl = {
	params ["_target", "_idc", "_part", "_label", "_diagnosed"];
	_display = uiNamespace getVariable "SMS_MedicalMenu";
	_ctrl = _display displayCtrl _idc;
	_bleed = [_target, _part] call SMS_fnc_partIsBleeding;
	//player sideChat (format ["%1 has bleed of level %2 on part %3", name _target, _bleed, _part]);
	if (_diagnosed && _bleed != 0) then {
		_ctrl ctrlSetTextColor ([_bleed] call SMS_fnc_bleedAmountToColor);
		_ctrl ctrlSetText (format ["Bandage %1", _label]);

	} else {
		_ctrl ctrlSetText _label;
		ctrlEnable [_idc, false];
	};
};

_tourniquetPartControl = {
	params ["_target", "_idc", "_part", "_label", "_diagnosed"];
	_display = uiNamespace getVariable "SMS_MedicalMenu";
	_ctrl = _display displayCtrl _idc;
	_bleed = [_target, _part] call SMS_fnc_partIsBleeding;
	_hasTourn   = [_target, _part] call SMS_fnc_partHasTourniquet;
	if (! _diagnosed || {_bleed == 0 && !_hasTourn}) then {
		_ctrl ctrlSetText "N/A";
		ctrlEnable [_idc, false];
	} else {
		if (_bleed > 0 && !_hasTourn && _diagnosed) then {
			_ctrl ctrlSetText "Apply Tourniquet";
		} else {
			_ctrl ctrlSetText "Remove Tourniquet";
		};
		
	};
};

/*
	Medic is informed (has diagnosed)
*/
_isDiagnosed = [_target, player] call SMS_fnc_hasDiagnosed;


/*
	Treatment Options
*/

// Head
[_target, 802, "HEAD", "Head", _isDiagnosed] call _bandagePartControl;

// Body
[_target, 803, "BODY", "Body", _isDiagnosed] call _bandagePartControl;

// Left Arm
[_target, 804, "LARM", "Left Arm", _isDiagnosed] call _bandagePartControl;
[_target, 805, "LARM", "Left Arm", _isDiagnosed] call _tourniquetPartControl;

// Right Arm
[_target, 806, "RARM", "Right Arm", _isDiagnosed] call _bandagePartControl;
[_target, 807, "RARM", "Right Arm", _isDiagnosed] call _tourniquetPartControl;

// Left Leg
[_target, 808, "LLEG", "Left Leg", _isDiagnosed] call _bandagePartControl;
[_target, 809, "LLEG", "Left Leg", _isDiagnosed] call _tourniquetPartControl;

// Right Leg
[_target, 810, "RLEG", "Right Leg", _isDiagnosed] call _bandagePartControl;
[_target, 811, "RLEG", "Right Leg", _isDiagnosed] call _tourniquetPartControl;

// Morphine
if (_isDiagnosed) then {
	ctrlEnable [812, ([_target] call SMS_fnc_canHaveMorph)];
} else {
ctrlEnable [812, false];
};

// Epi
if (_isDiagnosed) then {
	ctrlEnable [813, ([_target] call SMS_fnc_canHaveEpi)];
} else {
	ctrlEnable [813, false];
};

// Basic
if (_isDiagnosed) then {
	ctrlEnable [814, ([_target, player] call SMS_fnc_canHaveBasic)];
} else {
	ctrlEnable [814, false];
};

// Adv
if (_isDiagnosed) then {
	ctrlEnable [815, ([_target, player] call SMS_fnc_canHaveAdv)];
} else {
	ctrlEnable [815, false];
};

// Diagnose
if (_target == player || _isDiagnosed) then {
	ctrlEnable [816, false];
};

/*
	Status / Overview
*/
if (_isDiagnosed) then {
	[_target, 817] call SMS_fnc_setTriageCategory;
};

/*
	Dialog Close Handler
*/

[] spawn {
	_displayOpen = true;
	while {_displayOpen} do {
		sleep 0.01;
		if (isNull findDisplay 800 && {isNull findDisplay 700}) exitWith {_displayOpen = false};
	};
	player setVariable ["SMS_MED_TARGET", objNull, true];
};