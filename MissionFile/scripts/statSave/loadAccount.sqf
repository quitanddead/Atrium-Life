statsLoaded = 0;
sleep 5;
player groupChat "Chargement des données du joueur, si cela ne fonctionne pas, reconnectez-vous.";
sleep 2;
hint "Chargement 0%";
sleep 2;
//Requests info from server in order to download stats
if(playerSide == west) then
{
	//["whitelist", "police", "list", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "moneyAccountCop", "SCALAR"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "WeaponsPlayerWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "MagazinesPlayerWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "LicensesWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "InventoryWest", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedVehiclesCop", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedVehiclesBoatCop", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedAircraftCop", "ARRAY"] call sendToServer;
};
if(playerSide == resistance) then
{
	[getPlayerUID player, getPlayerUID player, "moneyAccountRes", "SCALAR"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "WeaponsPlayerRes", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "MagazinesPlayerRes", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "LicensesRes", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "InventoryRes", "ARRAY"] call sendToServer;
};
if(playerSide == civilian) then
{
	[getPlayerUID player, getPlayerUID player, "moneyAccountCiv", "SCALAR"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "WeaponsPlayerCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "MagazinesPlayerCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "LicensesCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "InventoryCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedVehiclesCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedVehiclesBoatCiv", "ARRAY"] call sendToServer;
	[getPlayerUID player, getPlayerUID player, "savedAircraftCiv", "ARRAY"] call sendToServer;
    [getPlayerUID player, getPlayerUID player, "privateStorageCiv", "ARRAY"] call sendToServer;
    [getPlayerUID player, getPlayerUID player, "MaxWeight", "SCALAR"] call sendToServer;
};
sleep 2;
hint "Chargement 100%";

//===========================================================================

sleep 2;
//END
statsLoaded = 1;
statsAreLoadedForReal = true;
hint "Loading COMPLETE!";
player groupChat "Chargement des données du joueur terminé, si cela ne fonctionne pas, reconnectez-vous immédiatement pour éviter de perdre vos données.";