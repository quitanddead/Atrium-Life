_this    = _this select 3;
_number  = _this select 0;
_art     = _this select 1;
if ((_art == "remove") or (_art == "add")) then

{

if (_art == "add") then

	{
	_uid = getPlayerUID vehicle  player;
	_license = ((INV_Lizenzen select _number) select 0);
	_name    = ((INV_Lizenzen select _number) select 2);
	_cost    = ((INV_Lizenzen select _number) select 3);
	if (_license call INV_HasLicense) exitWith {player groupChat localize "STRS_inv_buylicense_alreadytrue";};
	if (('geld' call INV_GetItemAmount) < _cost) exitWith {player groupChat localize "STRS_inv_buylicense_nomoney";};
	if(_license == "car" or _license == "truck")then{demerits = 15};
	if(_license == "Donator_licence" and !(_uid in vipdonators)) exitWith { player groupChat "restreint aux Super Donateurs"};
	if(_license == "mafial" and streetrep < 15) exitWith { player groupChat "Votre reputation n'est pas assez eleve, vous avez besoin de 15 au minimun."};
	if(_license == "mafial" and !(isciv)) exitWith { player groupChat "Vous devez etre un Civil!"};
	if(_license == "mayorlic" and !(ismayor)) exitWith { player groupChat "Restreint au Maire"};
	if(_license == "probator" and !(iscop)) exitWith { player groupChat "Restreint a la police"};
	if(_license == "patrol_training" and !(iscop)) exitWith { player groupChat "Restreint a la police"};
	if(_license == "sobr_training" and !(iscop)) exitWith { player groupChat "Restreint a la police"};
	if(_license == "air_support_training" and !(iscop)) exitWith { player groupChat "Restreint a la police"};
	if(_license == "cg_air" and !(iscop)) exitWith { player groupChat "Restreint a la police"};
	if(_license == "cg_boat" and !(iscop)) exitWith { player groupChat "Restreint a la police"};
    if(_license == "pmcl" and !(_uid in specarray)) exitWith { player groupChat "Restreint au PMC"};
    if(_license == "millis" and !(_uid in specarray)) exitWith { player groupChat "Restreint au NG"};
	if(_license == "bounh" and !(_uid in specarray) and !(isciv)) exitWith { player groupChat "Restreint aux Chasseurs de Primes"};
	['geld', -(_cost)] call INV_AddInvItem;
	player groupChat format[localize "STRS_inv_buylicense_gottraining", (_cost call ISSE_str_IntToStr), _name];

	if(_license == "mafial") then {
	[] call invitationadd;
	};

	INV_LizenzOwner = INV_LizenzOwner + [_license];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

	}
	else
	{

	_license = ((INV_Lizenzen select _number) select 0);
	name    = ((INV_Lizenzen select _number) select 2);
	if (not(_license call INV_HasLicense)) exitWith {player groupChat localize "STRS_inv_buylicense_alreadyfalse";};
	INV_LizenzOwner = INV_LizenzOwner - [_license];
	player groupChat format[localize "STRS_inv_buylicense_losttraining", _name];
	["INV_LizenzOwner", INV_LizenzOwner] spawn ClientSaveVar;

	};

};