// Car alarm scripts by Preed

_option	= _this select 0;
_item	= _this select 1;

if (_option == "use") then
{
	_iteminfo	= _item  call INV_getitemArray;
	_vcl		= vehicle player;
	_type		= typeOf _vcl;
	_license1   = _iteminfo call INV_getitemLicense;
	_license2	= _iteminfo call INV_getitemLicense2;

	if (_item == "caralarm") then
	{
		if (!(_license1 call INV_HasLicense) and isciv) exitWith {player groupChat format["Vous avez besoin de %1 pour utiliser ceci.", (_license1 call INV_GetLicenseName)];};
		if (!(_license2 call INV_HasLicense) and iscop) exitWith {player groupChat format["Vous avez besoin de %1 pour utiliser ceci.", (_license2 call INV_GetLicenseName)];};

//		if (!(getPlayerUID player != (_vcl getVariable "owners") select 0)) exitwith{player groupChat "Vous n'etes pas le proprio de ce vehicule."};

		if (_vcl == player) exitwith{player groupChat "Vous devez etre a l'interieur du vehicule!"};

		if (player != driver _vcl) exitwith{player groupChat "Vous devez etre le conducteur pour installer le systeme d'alarme!"};

		if (_vcl iskindof "Tank" or _type call INV_getitemTypeKg > 2) exitwith{player groupchat "Vous ne pouvez pas installer le systeme d'alarme dans ce vehicule."};

		if (_vcl getVariable "hasalarm") exitwith{player groupchat "Ce vehicule dispose deja d'un systeme d'alarme."};

		_vcl setVariable ["hasalarm",true,TRUE];
		[_item, -1] call INV_AddInventoryItem;
		player groupchat "Le systeme d'alarme c'est correctement installe!";
	};

	if (_item == "alarmhack") then
	{
		if (!(_license1 call INV_HasLicense) and isciv) exitWith {player groupChat format["You need %1 to use this.", (_license1 call INV_GetLicenseName)];};
		if (!(_license2 call INV_HasLicense) and iscop) exitWith {player groupChat format["You need %1 to use this.", (_license2 call INV_GetLicenseName)];};

		if (_vcl == player) exitwith{player groupChat "Vous devez etre dans un vehicule!"};

		if (player != driver _vcl) exitwith{player groupChat "Vous devez etre le conducteur pour avoir acces au systeme d'alarme!"};

		if (!(_vcl getVariable "hasalarm")) exitwith{player groupChat "Ce vehicule n'a pas de systeme d'alarme."};

		if (!(_vcl getVariable "alarmtrig")) exitwith{player groupChat "L'alarme n'est pas activer."};

		if (_vcl getVariable "hasalarm") then
		{
			_vcl setVariable ["alarmtrig", false, TRUE];
			player groupChat "Alarme desactive!";
		};
	};
};


if (_option == "trigger") then
{
	_vcl = _item;

	_vcl setVariable ["alarmtrig", true, TRUE];

	player groupChat "Ce vehicule est equipe d'un systeme d'alarme!";

	sleep 5;

	(format['["soundalarm", %1] execVM "caralarm.sqf"',_vcl]) call broadcast;
};


if (_option == "soundalarm") then
{
	_vcl = _item;
	_alarmcycles = 0;

	while{_vcl getVariable "alarmtrig" and _alarmcycles <= 29} do
	{
		_vcl say "Car_alarm";
		sleep 2.106; // 29 cycles for 60s
		_alarmcycles = _alarmcycles + 1;
	};
};
