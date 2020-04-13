
params ["_target","_enable","_fadeIn"];

_uncBlurHandle = _target getVariable "ppUnconsciousBlur";
_uncBlacHandle = _target getVariable "ppUnconsciousBlackout";

if (_enable) then {

	_uncBlurHandle     	ppEffectEnable true;
	_uncBlacHandle 		ppEffectEnable true;

	_uncBlurHandle     	ppEffectAdjust [0];
	_uncBlacHandle 		ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
	_uncBlurHandle     	ppEffectCommit 0;
	_uncBlacHandle 		ppEffectCommit 0;

	_uncBlurHandle    	ppEffectAdjust [5];
	_uncBlacHandle 		ppEffectAdjust [1, 1, 0, [0, 0, 0, 1], [0, 0, 0, 1], [0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 1]];
	_uncBlurHandle     	ppEffectCommit 0.2;
	_uncBlacHandle 		ppEffectCommit 0.2;

	_uncBlurHandle     	ppEffectCommit _fadeIn;
    _uncBlacHandle 		ppEffectCommit _fadeIn;
	
} else {
	if (_fadeIn > 0) then {
		// Step 1: Widen eye "hole"
		_uncBlurHandle     	ppEffectAdjust [5];
		_uncBlacHandle 		ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.9], [0, 0, 0, 1], [0, 0, 0, 0], [0.51, 0.17, 0, 0, 0, 0, 1]];
		_uncBlurHandle     	ppEffectCommit (_fadeIn * 1/3);
		_uncBlacHandle 		ppEffectCommit (_fadeIn * 1/3);

		// Step 2: Open it
		_uncBlurHandle    	ppEffectAdjust [0];
		_uncBlacHandle 		ppEffectAdjust [1, 1, 0, [0, 0, 0, 0.8], [0, 0, 0, 1], [0, 0, 0, 0], [0.7, 0.78, 0, 0, 0, 0, 1]];
		_uncBlurHandle     	ppEffectCommit (_fadeIn * 2/3);
		_uncBlacHandle 		ppEffectCommit (_fadeIn * 1/3);
		sleep _fadeIn * 1/3;

		// Step 3: Fade away vignette
		_uncBlacHandle 		ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 1], [0, 0, 0, 0], [0.7, 0.78, 0, 0, 0, 0, 1]];
		_uncBlacHandle 		ppEffectCommit (_fadeIn * 1/3);
		sleep _fadeIn * 2/3;
	};
	_uncBlurHandle ppEffectEnable false;
	_uncBlacHandle ppEffectEnable false;
};

