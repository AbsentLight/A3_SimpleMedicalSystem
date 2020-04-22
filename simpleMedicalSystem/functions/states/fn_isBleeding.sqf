params ["_target"];

_headBleed 		= _target getVariable "SMS_HEAD_BLEED";
_bodyBleed 		= _target getVariable "SMS_BODY_BLEED";
_rArmBleed 		= _target getVariable "SMS_RARM_BLEED";
_lArmBleed 		= _target getVariable "SMS_LARM_BLEED";
_rLegBleed 		= _target getVariable "SMS_RLEG_BLEED";
_lLegBleed 		= _target getVariable "SMS_LLEG_BLEED";

if (_headBleed > 0) exitWith {true};
if (_bodyBleed > 0) exitWith {true};
if (_rArmBleed > 0) exitWith {true};
if (_lArmBleed > 0) exitWith {true};
if (_rLegBleed > 0) exitWith {true};
if (_lLegBleed > 0) exitWith {true};
false