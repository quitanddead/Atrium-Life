//AntiHack Script by Darky Edited by Griffin to actually do something if it finds someone hacking
_whiteList = [];

_hackdetect = false;
_whiteUser = false;

for "_i" from 0 to ((count _whiteList) - 1) do
{
    _curUID = (_whiteList select _i);
    if (getPlayerUID player == _curUID) then
    {
        _whiteUser = true;
    };
};

if !(_whiteUser) then
{
    //Global Variable Scanner
    _glHackVars = ["ifFuelok", "tHight"];
    for "_i" from 0 to ((count _glHackVars) - 1) do
    {
        _curVarName = (_glHackVars select _i);
        if !(isnil _curVarName) then
        {
            _hackdetect = true;
            if (_hackdetect) exitWith {};
        };
    };

    //Class Scanner
    _glClassesNames = ["carpetbomb_menu","playerhijack_menu","zargabad_menu","joker_menu","endgame_menu",
                        "AlexAdmin_menu","Alexander_menu","ChernoRape_menu","MightyGerk_menu","SpawnSoldier_menu",
                        "AtackPlanes","GrkTeleport","crpbmb_menu","Delete_menu","Verbal_menu","playerhijack_menu"];
    for "_i" from 0 to ((count _glClassesNames) - 1) do
    {
        _curClassName = (_glClassesNames select _i);
        if (isClass (configFile >> _curClassName)) then
        {
            _hackdetect = true;
            if (_hackdetect) exitWith {};
        };
    };

    if (_hackdetect) then
    {
        haxorname = name player;
        publicVariable "haxorname";
	hint format ["Hacker: %1", haxorname];
	disableuserinput True;
    };
};