params ["_target"];

_painMod 		= _target getVariable "SMS_PAIN_MOD";
_painModCap		= _target getVariable "SMS_PAIN_MOD_CAP";
_unmedLimp		= _target getVariable "SMS_LIMPING_MODE";


_relPain = _target call SMS_fnc_getRelativePain;

if (_painModCap > 0) exitWith {false}; 	  	// Already have M recently
if (_painMod > 200)  exitWith {false};    	// Still under effects of morphine
if (_unmedLimp == 1) exitWith {true};		// Can have morphine to treat legs
if (_relPain < 400)  exitWith {false};		// Pain below threshhold

// Otherwise true
true