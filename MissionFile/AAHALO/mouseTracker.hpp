class ctrlParaDiag
{
	idd = 856;
	moving = false;
	movingEnable = false;
	movingEnabled = false;
	controlsBackground[ ]={ interface };
	objects[ ]={ };
	controls[ ]={  mouseField,altmeter };

	class mouseField
	{
		idc = -1;
		type = 0;
		style = 16;
		colorText[ ]={ 0,0,0,0 };
		colorBackground[ ]={ 1,1,1,0 };
		font = "Zeppelin32";
		sizeEx = 0.05;
		lineSpacing = 0;
		x = 0;
		y = 0;
		w = 1;
		h = 1;
		text = "";
		onMouseMoving = "v__float_mousePos =[ _this select 1,_this select 2 ];";
		onKeyDown = "v__int_reqKeys = v__int_reqKeys +[ _this select 1 ];";
	};
	class altmeter
	{
		idc = 857;
		type = 0;
		style = 0x01;
		colorText[ ]={ 0,0,0,1 };
		colorBackground[ ]={ 0,0,0,0 };
		font = "Zeppelin32";
		sizeEx = 0.03;
		lineSpacing = 0;
		x = 0.865;
		y = 0.55;
		w = 0.1;
		h = 0.2;
		border = 1;
		borderSize = 10;
		text = "Height";
	};
	class interface
	{
		idc = -1;
		type = 0;
		style = 48;
		colorText[ ]={ 1,1,1,1 };
		colorBackground[ ]={ 0.4,0.4,0.4,1 };
		font = "Zeppelin32";
		sizeEx = 0.01;
		lineSpacing = 0;
		x = 0.7;
		y = 0.1;
		w = 0.3;
		h = 0.8;
		border = 1;
		borderSize = 10;
		text = "AAHALO\altimeter.paa";
	};
};