_art 	= _this select 0;
_item 	= _this select 1;
_vcl	= vehicle player;
_type	= typeof _vcl;

if(_art == "use")then

{

if(_vcl == player)exitwith{player groupchat "Vous devez etre dans un vehicule"};
if(_vcl iskindof _type call INV_getitemTypeKg > 2)exitwith{player groupchat "Vous ne pouvez pas modifier cette voiture"};
if(_vcl iskindof "Motorcycle")exitwith{player groupchat "Vous ne pouvez pas ameliorer cela!"};
if(_vcl iskindof "land")exitwith{player groupchat "Vous ne pouvez pas modifier cette voiture avec ceci!"};
if(_vcl iskindof "air")exitwith{player groupchat "Vous ne pouvez pas ameliorer les Avions/Helico!"};
if (!(player == driver vehicle player)) exitWith {player groupChat "Vous devez etre le conducteur pour ameliorer le vehicule";};
_check = _vcl getVariable "tuning";

	if(_item == "boatupgrade1") then
	{
	player groupchat "Amelioration du Bateau...";
	_vcl setfuel 0;
	sleep 6;
	_vcl setfuel 1;
	_vcl setvariable ["tuning", 1, true];
	player groupchat "Bateau ameliorer!";
	};

	if(_item == "boatupgrade2") then
	{
	if(isNil "_check") exitwith {player groupchat "Vous devez utiliser une autre modification"};
	player groupchat "Amelioration du vehicule...";
	_vcl setfuel 0;
	sleep 7;
	_vcl setfuel 1;
	_vcl setvariable ["tuning", 2, true];
	player groupchat "Vehicule ameliorer!";
	};

//if(_item == "supgrade3")then{player groupchat "Amelioration du vehicule..."; _vcl setfuel 0; sleep 8; _vcl setfuel 1; _vcl setvariable ["tuning", 3, true]; player groupchat "Vehicule ameliorer!";};
//if(_item == "supgrade4")then{player groupchat "Amelioration du vehicule..."; _vcl setfuel 0; sleep 9; _vcl setfuel 1; _vcl setvariable ["tuning", 4, true]; player groupchat "Vehicule ameliorer!";};
//if(_item == "supgrade5")then{player groupchat "Amelioration du vehicule..."; _vcl setfuel 0; sleep 10; _vcl setfuel 1; _vcl setvariable ["tuning", 5, true]; player groupchat "Vehicule ameliorer!";};
[_item, -1] call INV_AddInvItem;
};
