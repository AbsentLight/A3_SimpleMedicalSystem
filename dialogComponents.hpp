class RscText {
	access = 0;			//0 - Read and Write, 1 - Read and create, 2 - Read, 3 - Read verified
	type = CT_STATIC;	//type of the control
	idc = -1;			//control ID number
	style = ST_LEFT;	//style of the control
	w = 0.8;			//width (0-1)
	h = 0.05;			//height (0-1)
	x = 0.5;			//position on X axis (0-1)
	y = 0.5;			//position on Y axis (0-1)
	font = GUI_FONT_NORMAL;		//font style
	sizeEx = 0.04;				//font size
	colorBackground[] = {0,0,0,0};		//background color, RGBA format (currently transparent)
	colorText[] = {1,1,1,1};			//background color, RGBA format (currently white)
	fixedWidth = 0;				//0,1
	shadow = 0;				//0 - none, 1 - color affected by background, 2 - black
	text = "";
};	
class RscButtonBase {
	access = 0;				//same as above
	idc = -1;				//ID number
	type = CT_BUTTON;		//type of the control
	colorText[] = {1,1,1,1};		//color of the text (currently white)
	colorDisabled[] = {1,1,1,1};		//color when disabled (currently gray)
	colorBackground[] = {0.12,0.12,0.12,0.75};
	colorBackgroundDisabled[] = {0.19,0.19,0.19,0.4};		//background color when disabled (currently light gray)
	colorBackgroundActive[] = {0.85,0.85,0.85,0.75};		//background color when active (selected, or hovered over) (currently red)
	colorFocused[] = {0.12,0.12,0.12,0.75};			//bakcground color when focused (selected) (currently green)
	colorShadow[] = {0.023529,0,0.0313725,0};		//shadow color (currently dark gray)
	colorBorder[] = {0.023529,0,0.0313725,0};		//border color (currently dark gray)
	soundEnter[] = {"",0.09,1};			//sound upon hovering over the control (sound, volume, pitch)
	soundPush[] = {"",0,0};			//sound upon pushing the button (sound, volume, pitch)
	soundClick[] = {"",0.07,1};			//sound upon clicking the button (sound, volume, pitch)
	soundEscape[] = {"",0.09,1};		//sound upon releasing the pushed button (sound, volume, pitch)
	x = 0;			//position on X axis (0-1)
	y = 0;			//position on Y axis (0-1)
	w = 0;			//width (0-1)
	h = 0;			//height (0-1)
	style = 2;		//style of the control
	shadow = 2;			//above
	font = GUI_FONT_NORMAL;	//font type
	sizeEx = 0.03;			//font size
	offsetX = 0;		//offset when not pressed on X axis
	offsetY = 0;		//offset when not pressed on Y axis
	offsetPressedX = 0;			//offset when pressed on X axis
	offsetPressedY = 0;			//offset when pressed on Y axis
	borderSize = 0;			//border size (duh)
	text = "";
};

class RscBackgroundElement {
	idc = -1;
	type = CT_STATIC;
	style = ST_HUD_BACKGROUND;
	font = GUI_FONT_NORMAL;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0.19,0.19,0.19,0.7};
	sizeEx = 0;
	text = "";
	x = 0;
	y = 0.04;
	w = 1;
	h = 0.96;
}

class RscTitleBar : RscBackgroundElement {
	style = ST_SINGLE;
	colorBackground[] = {0.7558823529,0.5019607843,0.1254901961,0.95};
	h = 0.04;
	y = 0;
	sizeEx = 0.04;
}

class RscSectionHeading : RscBackgroundElement {
	style = ST_CENTER;
	h = 0.05;
	sizeEx = 0.05;
	font = GUI_FONT_BOLD;
	colorBackground[] = {0,0,0,0};
}

class RscSectionBreak {
	access = 0;			//0 - Read and Write, 1 - Read and create, 2 - Read, 3 - Read verified
	idc = -1;			//control ID number
	type = CT_STATIC;	//type of the control
	style = ST_SINGLE;
	x = 0.025;
	h = 0.001;
	w = 0.95;
	colorText[] = {0.99,0.99,0.99,0.95};
	colorBackground[] = {0.99,0.99,0.99,0.95};
	text = "";
	font = GUI_FONT_SYSTEM;
	sizeEx = 1;
}

class RscButton : RscButtonBase {
	w = 0.2;
	h = 0.05;
};

class RscButtonWide : RscButton {
	w = 0.425;
};

class RscTextElement : RscText {
	w = 0.425;
	h = 0.05;
	style = ST_SINGLE + ST_CENTER;
	colorBackground[] = {0.12,0.12,0.12,0.75};
}

class RscProgressBar {
	idc = -1;
	type = CT_PROGRESS;
	style = ST_SINGLE;
	colorFrame[] = {0,0,0,1}; // black
	colorBar[] = {0.2,0.65,0.2,0.8};
	x = 0;
	y = 0;
	w = 0;
	h = 0;
	shadow = 2;
	texture = "#(argb,8,8,3)color(1,1,1,1)";
}