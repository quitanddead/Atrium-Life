_secondcounter = 0;
_minutecounter = 0;
_art = (_this select 3) select 0;

if (isNil "workplacejob_assassin_serverarray") then {workplacejob_assassin_serverarray = []};

if (_art == "serverloop") then

{

while {true} do

	{

	for [{_i=0}, {_i < (count workplacejob_assassin_serverarray)}, {_i=_i+1}] do

		{

		if (isNull ((workplacejob_assassin_serverarray select _i) select 0)) then

			{

			if (!(isNull ((workplacejob_assassin_serverarray select _i) select 1))) then

				{

				deleteVehicle ((workplacejob_assassin_serverarray select _i) select 1);
				deletemarker "targetmarker";

				};

			workplacejob_assassin_serverarray set [_i,""];
			workplacejob_assassin_serverarray = workplacejob_assassin_serverarray - [""];
			"if(iscop)then{player sidechat ""La menace au VIP a été enlevé""}" call broadcast;
			sleep ((workplacejob_assassin_break)*60);
			workplacejob_assassin_active = false;
			publicvariable "workplacejob_assassin_active";

			};

		};
	sleep 10;

	};

};

if (_art == "getajob_assassin") then

{

if(workplacejob_assassin_active)exitWith{player groupChat "Il n'a pas de personne a assasinee pour l'instant.";};
if(workplacejob_assassion_failed)exitWith{player groupChat "Vous avez echoue votre mission, peut-etre que vous serez engager plus tard.";};

_array  = [[VIPspawn1, 10], [VIPspawn2, 10], [VIPspawn3, 10], [VIPspawn4, 10], [VIPspawn5, 10]];
_city   = (floor(random(count _array)));
_pos    = (_array select _city) select 0;
_radius = (_array select _city) select 1;
_a1	= 0;

//delete any left overs from last time this ran
deletemarker "targetmarker";
deletevehicle VIPtarget;
deletevehicle assveh;
deletevehicle VIPbodyguard1;
deletevehicle VIPbodyguard2;

//creating VIP
_group = createGroup west;
VIPtarget = _group createUnit ["Functionary1_EP1", _pos, [], _radius, "FORM"];
VIPtarget setvehicleinit 'VIPtarget = this;this setVehicleVarName "VIPtarget";';
//give vip weapon and clips
VIPtarget addweapon "M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";
VIPtarget addmagazine "15Rnd_9x19_M9";

//creating body guards
VIPbodyguard1 = _group createUnit ["Functionary2_EP1", _pos, [], _radius, "FORM"];
VIPbodyguard1 setvehicleinit 'VIPbodyguard1 = this;this setVehicleVarName "VIPbodyguard1";';
VIPbodyguard1 addweapon "m9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";
VIPbodyguard1 addmagazine "15Rnd_9x19_M9";

VIPbodyguard2 = _group createUnit ["Functionary2_EP1", _pos, [], _radius, "FORM"];
VIPbodyguard2 setvehicleinit 'VIPbodyguard2 = this;this setVehicleVarName "VIPbodyguard2";';
VIPbodyguard2 addweapon "m9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";
VIPbodyguard2 addmagazine "15Rnd_9x19_M9";



processInitCommands;

// make viptargets car
assveh = createVehicle ["VolhaLimo_TK_CIV_EP1", _pos, [] , 3, "NONE"];
assveh setVehicleInit
"assveh = this;
this setVehicleVarName ""assveh"";
this setVehicleLock ""locked"";
this setAmmoCargo 0;
  ";
  publicvariable "assveh";
processInitCommands;
// put vip inside the car
if ((!(VIPtarget in assveh)) and (alive VIPtarget))
	then{
		VIPtarget moveInDriver assveh;
		VIPbodyguard1 doFollow VIPtarget;
		VIPbodyguard2 doFollow VIptarget;

		//VIPtarget assignAsDriver assveh;
		VIPbodyguard1 moveInCargo assveh;
		//VIPbodyguard1 assignAsCargo assveh;
		VIPbodyguard2 moveInCargo assveh;
		//VIPbodyguard2 assignAsCargo assveh;


	};











format["workplacejob_assassin_serverarray = workplacejob_assassin_serverarray + [[%1, VIPtarget]];", player] call broadcast;

_markerobj = createMarker ["targetmarker",[0,0]];
_markername= "targetmarker";
_markerobj setMarkerShape "ICON";
"targetmarker" setMarkerType "Marker";
"targetmarker" setMarkerColor "ColorRed";
"targetmarker" setMarkerText "Assassination target";
_markername SetMarkerPos _start;

workplacejob_assassin_active = true; publicvariable "workplacejob_assassin_active";

player groupChat "La personne VIP a ete indique sur votre map. Tuer le avant que la police l'amene en lieu sur.";

"if (iscop) then {player sideChat ""Quelqu'un a tentez de tuer un VIP. La cible a ete marquer sur votre map. Aller la secourir avant qu'elle ne soit morte!""};" call broadcast;

player groupchat "Les policiers sont sur ​​vous et le VIP connait votre venue, depechez-vous!!";
(format['if(!("Assassin" in %1_reason))then{%1_reason = %1_reason + ["Assassin"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 50000;', player]) call broadcast;
VIPtarget domove getmarkerpos "policebase";
while {true} do

	{

	/* removed this so the mission keeps going even if assassin dies
	if(!alive player)exitwith
		{
		deletevehicle VIPtarget;
		deletemarker "targetmarker";

		};
	*/
	"if(alive player and isciv and player distance assveh <= 150)then{titleText [""Le Gouvernement travail dans le coin! Retroussez le chemin ou il vous tuera!"", ""plain down""]};" call broadcast;
	"targetmarker" setmarkerpos getpos VIPtarget;
	if (_secondcounter >= 15) then
		{
		_group setBehaviour "AWARE";
		_group setSpeedMode "NORMAL";
		VIPtarget domove getmarkerpos "policebase";
		_secondcounter = 0;
		};

	if (_minutecounter >= 1200) exitWith

		{
		"server globalchat ""Si la mission d'assassinat n'est pas terminee dans les 20 minutes, la mission prendera fin."";" call broadcast;
		sleep 3;
		deletevehicle VIPtarget;
		deletemarker "targetmarker";
		deletevehicle assveh;
		deletevehicle VIPbodyguard1;
		deletevehicle VIPbodyguard2;
		_minutecounter = 0;
		};

	if (!alive VIPtarget and alive player) exitWith

		{

		kontostand = kontostand + 10000;
		player groupchat "Bravo bon travail. La cible est morte. 10000$ a ete transferer dans votre compte.";
		sleep 10;
		"server globalchat ""La cible VIP est morte!!"";" call broadcast;
		(format['if(!("Assassinated VIP" in %1_reason))then{%1_reason = %1_reason + ["Assassinated VIP"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 2500;', player]) call broadcast;
		deletevehicle VIPtarget;
		deletemarker "targetmarker";
		deletevehicle assveh;
		deletevehicle VIPbodyguard1;
		deletevehicle VIPbodyguard2;

		};

	if(VIPtarget distance getmarkerpos "policebase" < 100) exitwith

		{

		"
		server globalchat ""La cible VIP est vivante!"";
		_copplayernumber = playersNumber west;
		_copbonus = 8000;
		if (iscop) then {Kontostand = (Kontostand + _copbonus); player sidechat format[""Vous recevez $%1 pour avoir sauve le VIP"", _copbonus];};
		" call broadcast;
		sleep 2;
		player groupchat "La cible est vivante, mission echouee!";
		workplacejob_assassion_failed = true;
		deletevehicle VIPtarget;
		deletemarker "targetmarker";
		deletevehicle assveh;
		deletevehicle VIPbodyguard1;
		deletevehicle VIPbodyguard2;

		};
	_minutecounter = _minutecounter + 1;
	_secondcounter = _secondcounter + 1;
	sleep 1;

	};
deletevehicle VIPtarget;
deletemarker "targetmarker";
deletevehicle assveh;
deletevehicle VIPbodyguard1;
deletevehicle VIPbodyguard2;
sleep ((workplacejob_assassin_break)*60);
workplacejob_assassin_active = false;
publicvariable "workplacejob_assassin_active";

if (workplacejob_assassion_failed) then

	{

	sleep ((workplacejob_assassin_break)*60);
	workplacejob_assassion_failed = false;

	};

};








// written by Atrium Staff.