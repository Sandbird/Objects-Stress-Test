private ["_amount","_log","_object","_random","_spawned"];

_amount = 10000; // Amount of objects to spawn
_spawned = [];

// Record Server FPS for 60s before spawning objects
uiSleep 90;
for "_i" from 0 to 30 do {
    _log = format ["SERVER FPS: ( %1 ) BEFORE SPAWNING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    uiSleep 2;
};

// Spawn objects
for "_i" from 0 to _amount do {
	_random = [random 14000,random 14000,0];
	_object = createVehicle ["land_panelak3",_random,[],0,"CAN_COLLIDE"]; // "GUE_Commander" for AI, "Skoda" for cars
	_object setDir 0;
	_object setPos _random;
	_object allowDamage false;
	/* //Use for traders
	if (_object isKindOf "Man") then {
		_object setUnitAbility 0.6;
		_object disableAI "ANIM";
		_object disableAI "AUTOTARGET";
		_object disableAI "FSM";
		_object disableAI "MOVE";
		_object disableAI "TARGET";
		_object setBehaviour "CARELESS";
		_object forceSpeed 0;
		_object enableSimulation false;
	};
	*/
	_spawned set [count _spawned,_object];
};

// Send array of objects to client for testing
spawnedArray = _spawned;
publicVariable "spawnedArray";

// Record FPS for 60s after spawning objects
uiSleep 2;
for "_i" from 0 to 30 do {
    _log = format ["SERVER FPS: ( %1 ) AFTER SPAWNING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    uiSleep 2;
};