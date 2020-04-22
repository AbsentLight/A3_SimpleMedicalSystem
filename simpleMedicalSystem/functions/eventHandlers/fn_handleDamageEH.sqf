params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];

_ffEnabled = missionNamespace getVariable "SMS_friendlyFireEnabled";
if (side _unit == side _instigator && !_ffEnabled) exitWith {0};

_addBleed = {
	params ["_unit", "_damage", "_part"];

	_bleed = _unit getVariable _part;
	_bleedMod = 0;
	if (_damage > 0.7) then {_bleedMod = 3}; 
	if (_damage > 0.4) then {_bleedMod = 2};
	if (_damage > 0.1) then {_bleedMod = 1};
	_bleed = (_bleed + _bleedMod) min 3;
	_unit setVariable [_part, _bleed, true];
};

_addPain = {
	params ["_unit", "_damage", "_rawMod", "_tempMod"];
	_pain = _unit getVariable "SMS_PAIN";
	_painTemp = _unit getVariable "SMS_PAIN_TEMP";
	_painMod = floor (_damage * _rawMod);
	_painTempMod = floor (_damage * _tempMod);

	_pain = (_pain + _painMod) min 1200;
	_unit setVariable ["SMS_PAIN", _pain, true];

	_painTemp = (_painTemp + ( _painTempMod min (1200 - _pain))) min 1200;
	_unit setVariable ["SMS_PAIN_TEMP", _painTemp, true];
};

_handleToMulti = {
	params ["_unit", "_damage", "_direct", "_parts", "_rawPainMod", "_tempPainMod"];

	if (_direct) then {
		_part = selectRandom _parts;
		[_unit, _damage, _part] call _addBleed;
		[_unit, _damage, _rawPainMod, _tempPainMod] call _addPain;
	} else {
		{
			_damage = _damage * 2; 
			[_unit, _damage, _x] call _addBleed;
			[_unit, _damage, _rawPainMod, _tempPainMod] call _addPain;
		} forEach _parts;
	};
};

_takeHit = {
	params ["_unit", "_damage"];
	_blood = _unit getVariable "SMS_BLOOD";
	_bloodMod = floor (_damage * 40);
	_blood = (_blood - _bloodMod) max 0;
	_unit setVariable ["SMS_BLOOD", _blood, true];
};

_wasDirect = [_projectile] call SMS_fnc_wasDamageSourceDirect;

switch (_selection) do {
	case "": {
		[_unit, _damage] call _takeHit;
		[_unit, _damage, 40, 0] call _addPain;
	};
	case "face_hub": {
		if (_wasDirect) then {
			[_unit, _damage, "SMS_HEAD_BLEED"] call _addBleed;
			[_unit, _damage, 40, 100] call _addPain;
		};
	};
	case "neck": {
		if (_wasDirect) then {
			[_unit, _damage, "SMS_HEAD_BLEED"] call _addBleed;
			[_unit, _damage, 40, 100] call _addPain;
		};

	};
	case "head": {
		[_unit, _damage, "SMS_HEAD_BLEED"] call _addBleed;
		[_unit, _damage, 40, 100] call _addPain;
	};
	case "pelvis": {
		[_unit, _damage, _wasDirect, ["SMS_LLEG_BLEED","SMS_RLEG_BLEED"], 30, 80] call _handleToMulti;
	};
	case "spine1": {
		if (_wasDirect) then {
			[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
			[_unit, _damage, 30, 80] call _addPain;
		} else {
			_damage = floor (_damage / 3);
			[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
			[_unit, _damage, 30, 80] call _addPain;
		};
	};
	case "spine2": {
		if (_wasDirect) then {
			[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
			[_unit, _damage, 30, 80] call _addPain;
		} else {
			_damage = floor (_damage / 3);
			[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
			[_unit, _damage, 30, 80] call _addPain;
		};

	};
	case "spine3": {
		if (_wasDirect) then {
			[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
			[_unit, _damage, 30, 80] call _addPain;
		} else {
			_damage = floor (_damage / 3);
			[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
			[_unit, _damage, 30, 80] call _addPain;
		};

	};
	case "body": {
		[_unit, _damage, "SMS_BODY_BLEED"] call _addBleed;
		[_unit, _damage, 30, 80] call _addPain;
	};
	case "arms": {
		[_unit, _damage, _wasDirect, ["SMS_LARM_BLEED","SMS_RARM_BLEED"], 30, 80] call _handleToMulti;
	};
	case "hands": {
		[_unit, _damage, _wasDirect, ["SMS_LARM_BLEED","SMS_RARM_BLEED"], 30, 80] call _handleToMulti;
	};
	case "legs": {
		
		if (_damage > 0.7) then {
			[_unit, 1] call SMS_fnc_setLimping;
		};


		[_unit, _damage, _wasDirect, ["SMS_LLEG_BLEED","SMS_RLEG_BLEED"], 30, 80] call _handleToMulti;
	};
};

// return zero - we manage damage values as part of the module
0

