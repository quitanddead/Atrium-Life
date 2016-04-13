if (isServer) then
{
	_myBuilding = createVehicle ["Land_Mil_ControlTower_EP1", ATCtowerborder, [], 0, "CAN_COLLIDE"];//Border
	_myBuilding2 = createVehicle ["Land_A_GeneralStore_01", supermark, [], 0, "CAN_COLLIDE"];//supermarket
	_myBuilding3 = createVehicle ["Land_House_C_3_EP1", copbuilding12, [], 0, "CAN_COLLIDE"];//Copbase
	_myBuilding4 = createVehicle ["Land_Misc_deerstand", bend, [], 0, "CAN_COLLIDE"]; //Border
	_myBuilding5 = createVehicle ["Land_A_Stationhouse_ep1", firehouseUN, [], 0, "CAN_COLLIDE"]; //UNbase
	_myBuilding setDir 110;
	_myBuilding2 setDir -70;
	_myBuilding3 setDir 173;
	_myBuilding4 setDir 200;
	_myBuilding5 setDir -17;
	_myBuilding setPosATL getpos ATCtowerborder;
	_myBuilding AllowDamage False;
	_myBuilding2 setPosATL getpos supermark;
	_myBuilding2 AllowDamage False;
	_myBuilding3 setPosATL getpos copbuilding12;
	_myBuilding3 AllowDamage False;
	_myBuilding4 setPosATL getpos bend;
	_myBuilding4 AllowDamage False;
	_myBuilding5 setPosATL getpos firehouseUN;
	_myBuilding5 AllowDamage False;
	_mybuilding2 setPos [getPos mybuilding2 select 0, getPos mybuilding2 select 1, 1];
	_myBuilding3 setObjectTexture [0,"images\forall.paa"]; 
	_bushdestroy setdamage 1;

}; 