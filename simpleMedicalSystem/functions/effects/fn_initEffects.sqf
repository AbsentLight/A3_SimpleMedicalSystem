_target = _this select 0;

private _fnc_createEffect = {
    params ["_type", "_layer", "_default"];

    private _effect = ppEffectCreate [_type, _layer];
    _effect ppEffectForceInNVG true;
    _effect ppEffectAdjust _default;
    _effect ppEffectCommit 0;

    _effect
};

// - Unconscious --------------------------------------------------------------
_target setVariable [
	"ppUnconsciousBlur", 
	([
		"DynamicBlur",
		814, // 135xx does not work
		[0]
	] call _fnc_createEffect),
	false
];

_target setVariable [
	"ppUnconsciousBlackout",
	([
		"ColorCorrections",
		13500,
		[1, 1, 0, [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
	] call _fnc_createEffect),
	false
];

// - Incapacitation -----------------------------------------------------------
_target setVariable [
	"ppIncapacitationGlare",
	([
		"ColorCorrections",
		13504,
		[1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0]]
	] call _fnc_createEffect),
	false
];

_target setVariable [
	"ppIncapacitationBlur",
	([
		"DynamicBlur",
		815, // 135xx does not work
		[0]
	] call _fnc_createEffect),
	false
];


// - Pain -----------------------------------------------------------

_target setVariable [
	"ppPainCC",
	([
		"ColorCorrections",
		13502,
		[1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 1], [0.33, 0.33, 0.33, 0], [0.55, 0.5, 0, 0, 0, 0, 4]]
    ] call _fnc_createEffect),
	false
];

_target setVariable [
	"ppPainBB",
	([
		"DynamicBlur",
        813, // 135xx does not work
        [0]
    ] call _fnc_createEffect),
	false
];


// UNUSED
_target setVariable [
	"ppPainRB",
	([
		"RadialBlur", // "Will not do anything if RADIAL BLUR is disabled in Video Options."
		13502,
		[0, 0, 0.25, 0.25]
    ] call _fnc_createEffect),
	false
];

// UNUSED
_target setVariable [
	"ppPainCA",
	([
		"ChromAberration",
		13502,
		[0, 0, false]
    ] call _fnc_createEffect),
	false
];

// - Blood Loss -----------------------------------------------------------
_target setVariable [
	"ppBloodDesat",
	([
		"ColorCorrections",
		13504,
		[1, 1, 0, [0, 0, 0, 0.4], [1, 1, 1, 0.4], [1, 1, 1, 0]]
	] call _fnc_createEffect),
	false
];
