This script is for stress testing large amounts of objects on Arma 2 maps.<br/>

Download:<br/>
https://github.com/ebaydayz/Objects-Stress-Test/archive/master.zip<br/>

To use:<br/>

```javascript
waitUntil {!isNil "PVDZE_plr_LoginRecord"}; //Use PVDZ_plr_LoginRecord for 1.8.3. For non-dayz mods use: waitUntil {!(isNull (findDisplay 46))};
if (!isDedicated && ((getPlayerUID player) in ["0"])) then { //Replace 0 with your UID
	if (isNil "stress_test") then {stress_test = player addAction[format ["<t color='#5882FA'>%1</t>", "Stress Test"],"stresstest.sqf","",5,false,true];};
};
```
1. Add above code to very bottom of init.sqf
2. Place stresstest.sqf in your client Arma 2 OA root directory.
3. Use scroll wheel to execute in-game. Make sure the mission is fully loaded and your FPS has stabilized first.

Do not alt-tab out or minimize while the test is running. Doing so will cap your FPS to 20.<br/>
Results can be found in your client RPT:<br/>
C:\Users\YourName\AppData\Local\ArmA 2 OA\arma2oa.RPT


