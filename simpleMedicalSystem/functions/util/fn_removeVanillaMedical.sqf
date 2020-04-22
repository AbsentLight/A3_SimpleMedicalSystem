params ["_target"];

_target setUnitTrait ["medic", false];

_items = items _target;

while {"FirstAidKit" in _items} do {
	_items = items _target;
	_target removeItem "FirstAidKit";
};