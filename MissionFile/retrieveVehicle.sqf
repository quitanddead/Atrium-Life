player groupChat "test";

_saveVehiclesList = _this select 0;
_sourceCoords = _this select 1;
_sourceDistance = _this select 2;
_destination = _this select 3;

if (isNil {_saveVehiclesList select 0}) then {
player groupChat "You do not have any saved vehicles, currently!";

} else {
_rtv = (_saveVehiclesList select 0) call inv_getitemname;
_rtv2 = (_saveVehiclesList select 1) call inv_getitemname;
_rtv3 = (_saveVehiclesList select 2) call inv_getitemname;
continue = false;
vehicle2Spawn = test;

switch (_this select 4) do {
    case 2221: { player removeAction action2221; };
    case 2222: { player removeAction action2222; };
};

reTrieve = player addaction [_rtv,"noscript.sqf",'continue = true; vehicle2Spawn = (_saveVehiclesList select 0);',1,true,true,""];
reTrieve1 = player addaction [_rtv2,"noscript.sqf",'continue = true; vehicle2Spawn = (_saveVehiclesList select 1);',1,true,true,""];
reTrieve2 = player addaction [_rtv3,"noscript.sqf",'continue = true; vehicle2Spawn = (_saveVehiclesList select 2);',1,true,true,""];

player groupChat format["%1", player distance _sourceCoords];
player groupChat format["%1", _sourceDistance];

player groupChat "Select a vehicle from the scroll menu!";

waituntil {continue};

player removeAction reTrieve;
player removeAction reTrieve1;
player removeAction reTrieve2;

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
	', player, round(time), INV_CALL_CREATVEHICLE, getpos _destination, getdir _logic];

_saveVehiclesList = _saveVehiclesList - [vehicle2Spawn];

server globalchat format ["%1",_v];

["_saveVehiclesList",_saveVehiclesList] spawn clientsavevar;

player groupChat format ["RETRIEVED %1",vehicle2spawn call inv_getitemname];

sleep 3;
continue = false;

//switch (_this select 4) do {
//    case 2221: { action2221 = player addaction ["Retrieve Saved Vehicle","retrievevehicle.sqf",_this,1,false,true,"","player distance _sourceCoords <= _sourceDistance"]; };
//    case 2222: { action2222 = player addaction ["Retrieve Saved Vehicle","retrievevehicle.sqf",_this,1,false,true,"","player distance _sourceCoords <= _sourceDistance"]; };
//};
};