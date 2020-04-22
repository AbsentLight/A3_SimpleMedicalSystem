params ["_target", "_idc"];
_display = uiNamespace getVariable "SMS_MedicalMenu";
_ctrl = _display displayCtrl _idc;

_cat = [_target] call SMS_fnc_getTriageCategory;

switch (_cat) do {
    case 0: {
		_ctrl ctrlSetText "DECEASED";
		_ctrl ctrlSetBackgroundColor [0,0,0,0.8];
	};
	case 1: {
		_ctrl ctrlSetText "Cat 1 - Critical";
		_ctrl ctrlSetBackgroundColor [1,0,0,0.8];
	};
	case 2: {
		_ctrl ctrlSetText "Cat 2 - Urgent";
		_ctrl ctrlSetBackgroundColor [1,0.66,0,0.8];
	};
	case 3: {
		_ctrl ctrlSetText "Cat 3 - Minor";
		_ctrl ctrlSetBackgroundColor [0.9,0.9,0,0.8];
	};
	case 4: {
		_ctrl ctrlSetText "Stable";
		_ctrl ctrlSetBackgroundColor [0,0.7,0,0.8];
	};

    default {};
};