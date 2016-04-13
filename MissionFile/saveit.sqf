{(nearestobjects [getpos player,
 ["Air", "Ship", "LandVehicle"],
 3] select 0) execVM "saveVehicle.sqf";
 ',1,true,true,"",
 '_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);
 player distance _vcl < 5 and _vcl in INV_ServerVclArray and _vcl in INV_VehicleArray;'
 };