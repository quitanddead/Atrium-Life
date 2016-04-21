//===========================================================================
_loadFromDBClient =
"
	_array = _this;
	_uid = _array select 0;
	if((getPlayerUID player) != _uid) exitWith {};
	_varName = _array select 1;
	_varValue = (_array select 2) select 0;
	_success = (_array select 2) select 1;
	if(isNil '_varValue') exitWith {};


	if(playerSide == west) then
	{
		if(_varName == 'moneyAccountCop' && _success) then {Kontostand  = _varValue;};
		if(_varName == 'WeaponsPlayerWest') then {{player addWeapon _x} forEach _varValue;};
		if(_varName == 'MagazinesPlayerWest') then {{player addMagazine _x} forEach _varValue;};
		if(_varName == 'LicensesWest') then {INV_LizenzOwner = _varValue;};
		if(_varName == 'InventoryWest') then {INV_InventarArray = _varValue;};
		if(_varName == 'savedVehiclesCop') then {INV_SavedVehLandCop = _varValue;};
		if(_varName == 'savedVehiclesBoatCop') then {INV_SavedVehWater = _varValue;};
		if(_varName == 'savedAircraftCop') then {INV_SavedVehicleAir = _varValue;};
		};
	if(playerSide == civilian) then
	{
		if(_varName == 'moneyAccountCiv' && _success) then {Kontostand  = _varValue;};
		if(_varName == 'WeaponsPlayerCiv') then {{player addWeapon _x} forEach _varValue;};
		if(_varName == 'MagazinesPlayerCiv') then {{player addMagazine _x} forEach _varValue;};
		if(_varName == 'LicensesCiv') then {INV_LizenzOwner = _varValue;};
		if(_varName == 'InventoryCiv') then {INV_InventarArray = _varValue;};
		if(_varName == 'savedVehiclesCiv') then {INV_SavedVehLand = _varValue;};
		if(_varName == 'savedVehiclesBoatCiv') then {INV_SavedVehWater = _varValue;};
		if(_varName == 'savedAircraftCiv') then {INV_SavedVehicleAir = _varValue;};
	    if(_varName == 'privateStorageCiv') then {private_storage = _varValue;};
	};
	if(playerSide == resistance) then
	{
		if(_varName == 'moneyAccountRes' && _success) then {Kontostand  = _varValue;};
		if(_varName == 'WeaponsPlayerRes') then {{player addWeapon _x} forEach _varValue;};
		if(_varName == 'MagazinesPlayerRes') then {{player addMagazine _x} forEach _varValue;};
		if(_varName == 'LicensesRes') then {INV_LizenzOwner = _varValue;};
		if(_varName == 'InventoryRes') then {INV_InventarArray = _varValue;};
	};
";

loadFromDBClient = compile _loadFromDBClient;
//===========================================================================
_sendToServer =
"
	accountToServerLoad = _this;
	publicVariableServer 'accountToServerLoad';
";

sendToServer = compile _sendToServer;
//===========================================================================
"accountToClient" addPublicVariableEventHandler
{
	player groupchat format["%1", _this];
	(_this select 1) spawn loadFromDBClient;
};
//===========================================================================

statFunctionsLoaded = 1;

