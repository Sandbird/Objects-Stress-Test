These scripts are for stress testing large amounts of objects on Arma 2 maps.<br/>

Download:<br/>
https://github.com/ebaydayz/Objects-Stress-Test/archive/master.zip<br/>

To use on dayz mods:<br/>

1. Add to bottom of init.sqf:

`waitUntil {!isNil "PVDZE_plr_LoginRecord"};
if (!isDedicated && ((getPlayerUID player) in ["0"])) then { //Replace 0 with your UID
	if (isNil "stress_test") then {stress_test = player addAction[format ["<t color='#5882FA'>%1</t>", "Stress Test"],"stresstest.sqf","",5,false,true];};
};`

2. Place the stresstest.sqf file you wish to use in your server's Arma 2 OA root directory. 


