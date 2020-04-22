params ["_enable", "_painLevel"];

_frequency = linearConversion [400, 800, _painLevel, 1, 0.2];

_lastCalled = player getVariable ["SMS_UI_PAIN_LASTCALLED", 0];
// Exit early, too early to act
if (_enable && {serverTime - _lastCalled < (_frequency * 2.5)}) exitWith {};
player setVariable ["SMS_UI_PAIN_LASTCALLED", serverTime, false];

/*
	Basic Handling
*/

_ppPain = player getVariable "ppPainCC";
_ppPainBlur = player getVariable "ppPainBB";

if (!_enable || {_painLevel == 0}) exitWith {
    _ppPain ppEffectEnable false;
    _ppPainBlur ppEffectEnable false;
};
_ppPain ppEffectEnable true;
_ppPainBlur ppEffectEnable true;

/*
	Blur
*/
_blurIntensity = linearConversion [400, 800, _painLevel, 0.2, 0.5, true];
_blurAdj = linearConversion [400, 800, _painLevel, 0.0, 0.2, true];
_ppPainBlur ppEffectAdjust [_blurIntensity];
_ppPainBlur ppEffectCommit 0.1;


/*
	White Flash
*/
_intensity     = linearConversion [400, 800, _painLevel, 0.2, 0.25, true];
_closeInSize   = linearConversion [400, 800, _painLevel, 0.5, 0.05, true];
_desatFactor   = linearConversion [400, 800, _painLevel, 0.5, 0.9, true];
_initialAdjust = [1, 1, 0, [1, 1, 1, _intensity      ], [1, 1, 1, 1], [_desatFactor, _desatFactor, _desatFactor, 0], [_closeInSize + 0.05, _closeInSize,  0.0, 0, 0, 0, 4]];
_delayedAdjust = [1, 1, 0, [1, 1, 1, _intensity * 0.1], [1, 1, 1, 1], [0.5, 0.5, 0.5, 0], [_closeInSize + 0.25, _closeInSize + 0.2, 0, 0, 0, 0, 4]];

_ppPain ppEffectAdjust _initialAdjust;
_ppPain ppEffectCommit _frequency;

[_ppPain, _ppPainBlur, _delayedAdjust, _blurAdj, _frequency] spawn {
	params ["_ppPain", "_ppPainBlur", "_ccAdj", "_bbAdj", "_freq"];
	sleep _freq;
	if ([player] call SMS_fnc_isUnconscious) exitWith {};
	_ppPain ppEffectAdjust _ccAdj;
	_ppPain ppEffectCommit _freq;

	_ppPainBlur ppEffectAdjust [_bbAdj];
	_ppPainBlur ppEffectCommit _freq;
};

