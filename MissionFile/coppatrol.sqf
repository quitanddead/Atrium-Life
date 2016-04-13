// script by eddiev223 and cobra

_selection = ((_this select 3)select 0);

_moneyearned = 0;
_distance = 0;


if (_selection == "start") then
{

pmissionactive = true;
deleteMarkerLocal "patrolmarker";


_newmarker = (floor(random(count coppatrolarray)));
_markerlocation = (coppatrolarray select _newmarker);

_markerobj = createmarkerlocal ["patrolmarker",[0,0]];
_markername = "patrolmarker";
_markerojb setmarkershapelocal "Icon";
//"patrolmarker" setMarkerBrushLocal "solid";
"patrolmarker" setmarkertypelocal "warning";
"patrolmarker" setmarkercolorlocal "coloryellow";
"patrolmarker" setmarkersizelocal [1, 1];
"patrolmarker" setmarkertextlocal "Patrol point";
_markername Setmarkerposlocal _markerlocation;

player sidechat "Votre mission de patrouille sera disponible dans quelques instant, il vous suffit d'aller au point de patrouille, le temps n'est pas un facteur par rapport à la grosseur du payment.";

sleep 2;
_plocation = getpos player;
_distance = _plocation distance _markerlocation;

while {pmissionactive} do

	{

	if (player distance _markerlocation <= 30) then
		{
		deleteMarkerLocal "patrolmarker";
		_moneyearned = (ceil(_distance * patrolmoneyperkm));
		Kontostand = Kontostand + _moneyearned;
		player sidechat format["Vous avez reçu $%1 pour avoir patrouiller", _moneyearned];
		player sidechat "Veuillez attendre un moment pour un nouveau point de patrouille";

		sleep 5;

		_newmarker = (floor(random(count coppatrolarray)));
		_markerlocation = (coppatrolarray select _newmarker);

		_markerobj = createmarkerlocal ["patrolmarker",[0,0]];
		_markername = "patrolmarker";
		_markerojb setmarkershapelocal "icon";
		//"patrolmarker" setMarkerBrushLocal "solid";
		"patrolmarker" setmarkertypelocal "warning";
		"patrolmarker" setmarkercolorlocal "coloryellow";
		"patrolmarker" setmarkersizelocal [1, 1];
		"patrolmarker" setmarkertextlocal "Patrol point";
		_markername Setmarkerposlocal _markerlocation;
		player sidechat "New Patrol point added";

		_plocation = getpos player;
		_distance = _plocation distance _markerlocation;


		};

	sleep 5;
	};
deleteMarkerLocal "patrolmarker";



};

if (_selection == "end") then
{
pmissionactive = false;
deleteMarkerLocal "patrolmarker";
player sidechat "La mission de patrouille est terminée, vous devez attendre 60 secondes pour en avoir un autre";
patrolwaittime = true;
sleep 60;
patrolwaittime = false;

};


if (_selection == "start1") then
{

pmissionactive1 = true;
deleteMarkerLocal "patrolmarker1";


_newmarker1 = (floor(random(count coppatrolarray1)));
_markerlocation1 = (coppatrolarray1 select _newmarker1);

_markerobj1 = createmarkerlocal ["patrolmarker1",[0,0]];
_markername1 = "patrolmarker1";
_markerojb1 setmarkershapelocal "Icon";
//"patrolmarker" setMarkerBrushLocal "solid";
"patrolmarker1" setmarkertypelocal "warning";
"patrolmarker1" setmarkercolorlocal "colorred";
"patrolmarker1" setmarkersizelocal [1, 1];
"patrolmarker1" setmarkertextlocal "Guard point";
_markername1 Setmarkerposlocal _markerlocation1;

player sidechat "Votre mission de garde sera disponible dans quelques instant, il vous suffit d'aller à la zone de garde et attendre que l'on vous demande de vous déplacer au prochain";

sleep 2;
_plocation1 = getpos player;
_distance1 = _plocation1 distance _markerlocation1;
_time1 = 0;
while {pmissionactive1} do

	{

	if (player distance _markerlocation1 <= 10) then
		{
		player sidechat "Gardez cette zone pour 5 minutes, zone de 50m, si vous quittez cette zone, la mission va échouer";
		while {_time1 <= 300} do
		{
			_time1 = _time1 + 1;
			if (player distance _markerlocation1 >= 51) exitWith {
			player groupchat "Vous avez quitté la zone";
			pmissionactive1 = false;
			deleteMarkerLocal "patrolmarker1";
			};
			if (_time1 == 300) then
			{
			_moneyearned1 = (ceil(5000 * patrolmoneyperkm1));
			Kontostand = Kontostand + _moneyearned1;
			player sidechat format["You earned $%1 for guarding the area", _moneyearned1];
			player sidechat "Vous pouvez aller prendre un autre mission de garde";
			deleteMarkerLocal "patrolmarker1";
			pmissionactive1 = false;
			};
		sleep 1;
		};
		sleep 1;
		deleteMarkerLocal "patrolmarker1";
		pmissionactive1 = false;
		};

	sleep 5;
	};
deleteMarkerLocal "patrolmarker1";



};

if (_selection == "end1") then
{
pmissionactive1 = false;
deleteMarkerLocal "patrolmarker1";
player sidechat "Vous avez abandonner la mission, vous devez attendre 5 minutes pour en prendre une autre";
patrolwaittime1 = true;
sleep 300;
patrolwaittime1 = false;

};


