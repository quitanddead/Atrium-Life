//"Dos Equis": // supersimple..
//allow the cheater to play as long as he dosent use the cheat menu..

waituntil {alive player};
waituntil{(dialog)};
_dcm = (findDisplay Darky Menu) displayAddEventHandler ["MouseButtonDown","IamAlooser=[true,name player]; publicVariable ""IamaLooser"""];
_dck = (findDisplay Darky Menu) displayAddEventHandler ["KeyDown","IamAlooser=[true,name player]; publicVariable ""IamaLooser"""];
nil = [] execvm "path\player-anti-darky.sqf";
//end