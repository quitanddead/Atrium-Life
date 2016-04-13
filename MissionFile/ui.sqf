/*
The Roleplay Project: Reloaded
Copyright (C) 2011  Matthew Simms
*/
[] spawn
{

    disableSerialization;
    100 cutRsc ["RPP_Dlg_ui", "PLAIN"];
    while {true} do
    {
        _money = (('geld' call INV_GetItemAmount) call ISSE_str_IntToStr);
        _weight = [] call INV_GetOwnWeight;
        _maxWeight = INV_Tragfaehigkeit;
        _hunger = round(INV_hunger);
        _health = 100-(round((damage player) * 100));
        _id = getPlayerUID player;
        _maxbank = (konToStand call ISSE_str_IntToStr);
        ((RPP_display_ui select 0) displayCtrl 1) ctrlSetStructuredText parseText format["<t align='center'><t shadow='1'shadowColor='#000000'><t color='#37B1E6'>Atrium<t color='#FFFFFF'> | <t color='#858585'>Argent en inventaire <t color='#68C900'>$%1<t color='#FFFFFF'> | <t color='#858585'>Argent en banque <t color='#68C900'>$%7<t color='#FFFFFF'> | <t color='#858585'>Poids/Max: %2/%3 <t color='#FFFFFF'>|<t color='#858585'> Santé: %4 <t color='#FFFFFF'>|<t color='#858585'> Faim: %6 <t color='#FFFFFF'>|<t color='#858585'> ID: %5</t> <t color='#FFFFFF'></t> ", _money, _weight, _maxWeight, _health, _id, _hunger, _maxbank];
        sleep 1;
    };
};