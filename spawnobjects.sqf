private ["_amount","_log","_object","_random","_spawned"];

_amount = 10000; // Amount of objects to spawn
_spawned = [];

// Record server FPS for 60s before spawning objects
for "_i" from 0 to 30 do {
    _log = format ["SERVER FPS: ( %1 ) BEFORE SPAWNING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    uiSleep 2;
};

// Spawn objects
for "_i" from 0 to _amount do {
	_random = [random 14000,random 14000,0];
	_object = createVehicle ["land_panelak3",_random,[],0,"CAN_COLLIDE"]; // "GUE_Commander" for AI, "Skoda" for cars
	//if (simulationEnabled _object) then {diag_log format ["Simulation is enabled for global %1",typeOf _object];} else {diag_log format ["Simulation is disabled for global %1",typeOf _object];}; 
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
	/* //Use for cars
	_uniqueid = str(round(random 999999));
	_object setVariable ["CharacterID",_uniqueid,true];
	_object setVariable ["ObjectID",_uniqueid,true];
	_object setVariable ["ObjectUID",_uniqueid,true];
	_object setVariable ["lastUpdate",time,true];
	if (!isNil "dayz_serverObjectMonitor") then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
	if (!isNil "PVDZE_serverObjectMonitor") then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
	*/
	_spawned set [count _spawned,_object];
};

// Send array of objects to client for testing
spawnedObjectsArray = _spawned;
publicVariable "spawnedObjectsArray";

// Record server FPS for 60s after spawning objects
uiSleep 2;
for "_i" from 0 to 30 do {
    _log = format ["SERVER FPS: ( %1 ) AFTER SPAWNING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    uiSleep 2;
};