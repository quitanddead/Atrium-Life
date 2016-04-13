_art = _this select 0;

if (_art == "use") then
{
	_item   = _this select 1;
	_anzahl = _this select 2;
	_closeVcl   = dummyobj;
	_closest    = -1;
	_incarpark = false;
	_chance = 0;

	{
		if (not(isNull(_x))) then
		{
			if (player distance _x < 7 and (player distance _x < _closest or _closest == -1)) then
			{
				_closest  = (player distance _x);
				_closeVcl = _x;
			};
		};
	} forEach INV_ServerVclArray;

	if (not(_closest == -1)) then
	{
		if(_closeVcl isKindOf "Tank" || _closeVcl isKindOf "Air")exitwith{player groupchat "You cannot lockpick this vehicle!"};

		if (_closeVcl in INV_VehicleArray) then
		{
			player groupchat localize "STRS_inventar_lockpick_already";
		} else
		{
			{
				if ((player distance (_x select 0)) < (_x select 1)) then {_incarpark = true};
			} forEach INV_VehicleGaragen;

			_alarm = _closeVcl getVariable "hasalarm";
			if (_alarm) then
			{
				_chance = lockpickchance / 4;
			}
			else
			{
				_chance = lockpickchance;
			};

			if ((random 100) < _chance) then
			{
				INV_VehicleArray = INV_VehicleArray + [_closeVcl];
				_closeVcl setVariable ["owners", (_closeVcl getVariable "owners") + [getPlayerUID player], TRUE];

				if (_closeVcl getVariable "hasalarm") then
				{
					["trigger", _closeVcl] execVM "caralarm.sqf"; player globalChat format["%1", _closeVcl];
				};

				player groupChat localize "STRS_inventar_lockpick_success";

				if (([player, (civarray + coparray), 40] call INV_Seen or _incarpark) and !iscop) then
				{
					format [' ["StoleVcl", %1, %4] spawn Isse_AddCrimeLogEntry; if(!("vehicle theft" in %1_reason)) then {%1_reason = %1_reason + ["vehicle theft"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 10000; hint format["%2(%1) was seen stealing a vehicle. (Registration plate: %4)"]', player, name player, longrolenumber, _closeVcl] call broadcast;
				};

			} else
			{
				player groupChat localize "STRS_inventar_lockpick_noluck";

				if (([player, (civarray + coparray), 40] call INV_Seen or _incarpark) and !iscop) then
				{
					format [' ["AttemptedStoleVcl", %1, %4] spawn Isse_AddCrimeLogEntry; if(!("attempted vehicle theft" in %1_reason)) then {%1_reason = %1_reason + ["attempted vehicle theft"]}; %1_wanted = 1; kopfgeld_%1 = kopfgeld_%1 + 5000; hint format["%2(%1) was seen attempting to lockpick a vehicle. (Registration plate: %4)"]', player, name player, longrolenumber, _closeVcl] call broadcast;
				};
			};

			[_item, -1] call INV_AddInventoryItem;
		};
	} else
	{
		player groupChat localize "STRS_inventar_lockpick_zuweit";
	};
};
