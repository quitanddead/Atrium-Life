_art = _this select 0;
if (_art == "use") then 
{
_item == _this select 1;
_anzahl = _this select 2;

player groupChat "Scratching! ";
sleep 1;
	if ((random 275) < 2) then 
	{
	player groupChat "You Have Won The Jackpot! ";
	player groupChat "Play Again!";
	//Playsound "Carallarm";
	Kontostand = Kontostand + 1500000;
	["lticket", (5)] call INV_addinventoryitem;
	}
	
	else
	{
		if ((random 150) < 2) then 
		{
		player groupChat "You Have Won 500 Thousand Dollars!  ";
		player groupChat "Play Again!";
		Kontostand = Kontostand + 500000;
		["lticket", (-1)] call INV_addinventoryitem;
		["lticket", (4)] call INV_addinventoryitem;
		}
		else
		{
			if ((random 100) < 2) then 
			{
			player groupChat "You Have Won 250 Thousand Dollars! ";
			player groupChat "Play Again!";
			Kontostand = Kontostand + 250000;
			["lticket", (-1)] call INV_addinventoryitem;
			["lticket", (3)] call INV_addinventoryitem;
			}
			else
			{
				if ((random 75) < 3) then 
				{
				player groupChat "You Have Won 100 Thousand Dollars ";
				player groupChat "Play Again!";
				Kontostand = Kontostand + 100000;
				["lticket", (-1)] call INV_addinventoryitem;
				["lticket", (2)] call INV_addinventoryitem;
				}
				else
				{
					if ((random 60) < 3) then 
					{
					player groupChat "You Have Won 50 Thousand Dollars ";
					player groupChat "Play Again!";
					Kontostand = Kontostand + 50000;
					["lticket", (-1)] call INV_addinventoryitem;
					["lticket", (1)] call INV_addinventoryitem;
					}
					else
					{
						if ((random 30) < 4) then 
						{
						player groupChat "You Have Won 25 Thousand Dollars ";
						player groupChat "Play Again!";
						Kontostand = Kontostand + 25000;
						["lticket", (-1)] call INV_addinventoryitem;
						}
						else
						{
							if ((random 20) < 4) then 
							{
							player groupChat "You Have Won 10 Thousand Dollars ";
							player groupChat "Play Again!";
							Kontostand = Kontostand + 10000;
							["lticket", (-1)] call INV_addinventoryitem;
							}
							else
							{
								if ((random 30) < 5) then 
								{
								player groupChat "You Have Won 5 Thousand Dollars ";
								player groupChat "Play Again!";
								Kontostand = Kontostand + 5000;
								["lticket", (-1)] call INV_addinventoryitem;
								}
								else
								{
									if ((random 12) < 8) then 
									{
									player groupChat "You Have Won A Free Play! ";
									player groupChat "Play Again!";
									["lticket", (1)] call INV_addinventoryitem;
									["lticket", (-1)] call INV_addinventoryitem;
									}
									else
									{
										player groupChat "Regretfully You Have Won Nothing";
										player groupChat "Play Again!";
										["lticket", (-1)] call INV_addinventoryitem;
									};																																																																
								};
							};
						};
					};
				};
			};
		};
	};
};