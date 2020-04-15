params[ "_unit" ];

[_unit] call SMS_fnc_initEffects;

[_unit] call SMS_fnc_removeVanillaMedical;

_unit addEventHandler ["InventoryOpened", {
	params ["_unit", "_container", "_secondaryContainer"];
	if (_unit != objNull) then {
		[_unit] call SMS_fnc_removeVanillaMedical;
	};
	if (_container != objNull) then {
		[_container] call SMS_fnc_removeVanillaMedical;
	};
	if (_secondaryContainer != objNull) then {
		[_secondaryContainer] call SMS_fnc_removeVanillaMedical;
	};
}];

// Add unit damage EH after built-ins
[_unit] spawn {
	params ["_unit"];

	waitUntil {time > 0};
	_ehRef = _unit addEventHandler ["HandleDamage", SMS_fnc_handleDamageEH];
	_unit setVariable ["SMS_DAMAGE_EH", _ehRef, true];
};

// UI event handlers
[] spawn {
	waituntil {!isnull (finddisplay 46)};
	_medicalSystemMenuKeybind = findDisplay 46 displayAddEventHandler ["KeyDown", SMS_fnc_medicalMenuKeybindEH];
	_medicalMenuCloseEH = (findDisplay 800) displayAddEventHandler ["onUnload", SMS_fnc_medicalMenuCloseEH];
};

// Unit update loop
[_unit] spawn {
	params ["_unit"];
	while {alive _unit} do {
		sleep 1;
		[_unit, serverTime] call SMS_fnc_updatePlayerState;
	};
};