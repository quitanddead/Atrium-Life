if (isNil {INV_SavedVehLand select 0}) then {
player groupChat "You do not have any saved vehicles, currently!";

} else {
_rtv = (INV_SavedVehLand select 0) call inv_getitemname;
_rtv2 = (INV_SavedVehLand select 1) call inv_getitemname;
_rtv3 = (INV_SavedVehLand select 2) call inv_getitemname;
_rtv4 = (INV_SavedVehLand select 3) call inv_getitemname;
_rtv5 = (INV_SavedVehLand select 4) call inv_getitemname;
continue = false;
vehicle2Spawn = test;

player removeAction action2221;
reTrieve = player addaction [_rtv,"noscript.sqf",'continue = true; vehicle2Spawn = (INV_SavedVehLand select 0);',1,true,true,"",'player distance vsave1 < 25'];
reTrieve1 = player addaction [_rtv2,"noscript.sqf",'continue = true; vehicle2Spawn = (INV_SavedVehLand select 1);',1,true,true,"",'player distance vsave1 < 25'];
reTrieve2 = player addaction [_rtv3,"noscript.sqf",'continue = true; vehicle2Spawn = (INV_SavedVehLand select 2);',1,true,true,"",'player distance vsave1 < 25'];
reTrieve3 = player addaction [_rtv4,"noscript.sqf",'continue = true; vehicle2Spawn = (INV_SavedVehLand select 3);',1,true,true,"",'player distance vsave1 < 25'];
reTrieve4 = player addaction [_rtv5,"noscript.sqf",'continue = true; vehicle2Spawn = (INV_SavedVehLand select 4);',1,true,true,"",'player distance vsave1 < 25'];

player groupChat "Select a vehicle from the scroll menu!";

waituntil {continue};

player removeAction reTrieve;
player removeAction reTrieve1;
player removeAction reTrieve2;
player removeAction reTrieve3;
player removeAction reTrieve4;

player groupChat "RETRIEVING VEHICLE IN 3...";
sleep 1;
player groupChat "RETRIEVING VEHICLE IN 2...";
sleep 1;
player groupChat "RETRIEVING VEHICLE IN 1...";
sleep 1;

_v = format ["vehicle_%1_%2",player,round(time)];

	call compile format ['

	newvehicle = vehicle2spawn createVehicle %4;
	newvehicle setVehicleInit "
	this setVehicleVarName ""vehicle_%1_%2"";
	vehicle_%1_%2 = this;
	clearWeaponCargo this;
	clearMagazineCargo this;
	newvehicle lock true;
	";
	processInitCommands;
	INV_VehicleArray = INV_VehicleArray + [vehicle_%1_%2];
	"INV_ServerVclArray = INV_ServerVclArray + [vehicle_%1_%2];if (""%3"" != """") then {[""CreatedVehicle"", vehicle_%1_%2, typeOf vehicle_%1_%2, %4] execVM ""%3"";};" call broadcast;
	', player, round(time), INV_CALL_CREATVEHICLE, getpos vsavers1, getdir _logic];

INV_SavedVehLand = INV_SavedVehLand - [vehicle2Spawn];

server globalchat format ["%1",_v];

["INV_SavedVehLand",INV_SavedVehLand] spawn clientsavevar;

player groupChat format ["RETRIEVED %1",vehicle2spawn call inv_getitemname];

sleep 3;
continue = false;

action2221 = player addaction ["Retrieve Saved Vehicle","retrievevehicle.sqf",[],1,false,true,"","player distance vsave1 <= 25"];
};