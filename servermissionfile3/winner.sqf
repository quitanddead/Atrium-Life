whowon = {
_winner = _this select 0;
//(format ['server globalChat "DEBUG WINNER:%1";', _winner]) call broadcast;
switch (_winner) do
{
	case "Bandits":
	{
		sidewon = "Bandits";
	};
	case "Cops":
	{
		sidewon = "cops";
	};
	case "Neither":
	{
		sidewon = "Neither";
	};
};
publicvariable "sidewon";
};
