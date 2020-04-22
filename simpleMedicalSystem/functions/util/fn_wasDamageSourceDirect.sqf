params ["_projectile"];

// Based on ACE
if (_projectile isKindOf "BulletBase") exitWith {true};			// bullet
if (_projectile isKindOf "ShotgunBase") exitWith {true};		// bullet
if (_projectile isKindOf "GrenadeCore") exitWith {false};		// grenade
if (_projectile isKindOf "TimeBombCore") exitWith {false};		// explosive
if (_projectile isKindOf "MineCore") exitWith {false};			// explosive
if (_projectile isKindOf "FuelExplosion") exitWith {false};	// explosive
if (_projectile isKindOf "ShellBase") exitWith {false};		// shell
if (_projectile isKindOf "RocketBase") exitWith {false};		// explosive
if (_projectile isKindOf "MissileBase") exitWith {false};		// explosive
if (_projectile isKindOf "LaserBombCore") exitWith {false};	// explosive
if (_projectile isKindOf "BombCore") exitWith {false};			// explosive
if (_projectile isKindOf "Grenade") exitWith {false};			// grenade

// Otherwise assume indirect
false