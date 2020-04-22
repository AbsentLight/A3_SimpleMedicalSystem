params ["_newUnit", "_oldUnit", "_respawn",	"_respawnDelay"];

[_newUnit, false, 0] spawn SMS_fnc_unconsciousEffect;
[false] call SMS_fnc_hideAllHud;

_newUnit setVariable ["SMS_UNIT_NAME", name player, true];

_newUnit setVariable ["SMS_PAIN", 0, true];
_newUnit setVariable ["SMS_PAIN_TEMP", 0, true];
_newUnit setVariable ["SMS_BLOOD", 1200, true];

_newUnit setVariable ["SMS_HEAD_BLEED", 0, true];
_newUnit setVariable ["SMS_BODY_BLEED", 0, true];

_newUnit setVariable ["SMS_RARM_TOURN", false, true];
_newUnit setVariable ["SMS_RARM_BLEED", 0, true];

_newUnit setVariable ["SMS_LARM_TOURN", false, true];
_newUnit setVariable ["SMS_LARM_BLEED", 0, true];

_newUnit setVariable ["SMS_RLEG_TOURN", false, true];
_newUnit setVariable ["SMS_RLEG_BLEED", 0, true];

_newUnit setVariable ["SMS_LLEG_TOURN", false, true];
_newUnit setVariable ["SMS_LLEG_BLEED", 0, true];

_newUnit setVariable ["SMS_PAIN_MOD", 0, true];
_newUnit setVariable ["SMS_BLOOD_MOD", 0, true];

_newUnit setVariable ["SMS_PAIN_MOD_CAP", 0, true];
_newUnit setVariable ["SMS_BLOOD_MOD_CAP", 0, true];

_newUnit setVariable ["SMS_UNCONSCIOUS", false, true];
_newUnit setVariable ["SMS_LIMPING", false, true];
_newUnit setVariable ["SMS_LIMPING_MODE", 0, true];

_newUnit setVariable ["SMS_LAST_ATTENDED", 0, true];
_newUnit setVariable ["SMS_MED_TARGET", objNull, true];

_newUnit setVariable ["SMS_TICK", 0, false];

// Unit update loop
[_newUnit] spawn {
	params ["_unit"];
	while {alive _unit} do {
		sleep 0.031;
		[_unit, serverTime] call SMS_fnc_updatePlayerState;
	};
};