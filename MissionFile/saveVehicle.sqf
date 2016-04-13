_saveVehiclesList = _this select 1;

_ArryLength = count _saveVehiclesList;

if(_ArryLength >= 5) then {

player groupChat "You can not save more than 3 vehicles, to get more please remove a vehicle at the retrieve vehicle box...";

} else {

_vcl = _this select 0;

_vclClass = typeOf _vcl;

player globalchat format ["VEHICLE ARRAY : %1",_vcl]; // debug


_saveVehiclesList set [count _saveVehiclesList, _vclClass];

player globalchat format ["SAVED ARRAY : %1",_saveVehiclesList]; // debug

deleteVehicle _vcl;

player groupChat "VEHICLE SAVED, YOU MAY RETRIEVE IT AT THE VEHICLE RETRIEVE POINT!";


["INV_SavedVehicle",INV_SavedVehicle] spawn clientsavevar;

};