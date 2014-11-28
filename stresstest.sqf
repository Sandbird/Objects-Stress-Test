private ["_amount","_log","_object","_random","_spawned"];

_amount = 100000;
_spawned = [];
_log = "------------------------------------------------------------  TEST STARTING  ------------------------------------------------------------";
diag_log _log;
systemChat _log;

// Record FPS for 60s before spawning objects
for "_i" from 0 to 30 do {
    _log = format ["CLIENT FPS: ( %1 ) BEFORE SPAWNING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    systemChat _log;
    uiSleep 2;
};

// Spawn objects
for "_i" from 0 to _amount do {
	_random = [random 14000,random 14000,0];
	_object = "land_panelak3" createVehicleLocal _random; // "Skoda" for cars, "GUE_Commander" for traders
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
	systemChat format ["SPAWNING OBJECTS PLEASE WAIT.. %1 / %2",_i,_amount];
};

// Record FPS for 60s after spawning objects
uiSleep 2;
for "_i" from 0 to 30 do {
    _log = format ["CLIENT FPS: ( %1 ) AFTER SPAWNING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    systemChat _log;
    uiSleep 2;
};

// Hide objects more than 2km away
//_objects = nearestObjects [[7840,8410,0],["AllVehicles","BuiltItems","DZE_Base_Object","DZE_Housebase","House","ModularItems"],12000]; // For all map objects //Remove "AllVehicles" to exclude drivable vehicles
{
	if (player distance _x > 2000) then {
		_x hideObject true;
		//_x enableSimulation false; //uncomment to test disabling simulation
		//deleteVehicle _x; //uncomment to test deleting (note deleting built-in map buildings will not work)
	};
} count _spawned; // Use _objects instead of _spawned to test all map objects

// Record FPS for 60s after hiding objects
uiSleep 2;
for "_i" from 0 to 30 do {
    _log = format ["CLIENT FPS: ( %1 ) AFTER HIDING: ( %2 ) OBJECTS.  TIME: %3/60s",round diag_fps,_amount,_i*2];
    diag_log _log;
    systemChat _log;
    uiSleep 2;
};

// Test complete, delete objects
{deleteVehicle _x;} count _spawned;
_log = "------------------------------------------------  TEST COMPLETE, ALL OBJECTS DELETED  ------------------------------------------------";
diag_log _log;
systemChat _log;