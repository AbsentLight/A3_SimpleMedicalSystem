#include "dialogComponents.hpp"

class MedicalMenu {
	idd=800;
	movingenable=false;
	onLoad = "uiNamespace setVariable [""SMS_MedicalMenu"", _this select 0]";

	class controls {

		// Head (Wide)
		class treatHead : RscButtonWide {
			idc = 802;
			x = 0.025;
			y = 0.15;
			text = "Head";
		};

		// Body (Wide)
		class treatBody : RscButtonWide {
			idc = 803;
			x = 0.025;
			y = 0.21;
			text = "Body";
		};

		// Treat Left Arm 
		class treatLArm : RscButton {
			idc = 804;
			x = 0.025;
			y = 0.27;
			text = "Left Arm";
		};

		// Tourniquet Left Arm
		class tournLArm : RscButton {
			idc = 805;
			x = 0.25;
			y = 0.27;
			text = "N/A";
		};

		// Treat Right Arm 
		class treatRArm : RscButton {
			idc = 806;
			x = 0.025;
			y = 0.33;
			text = "Right Arm";
		};

		// Tourniquet Right Arm
		class tournRArm : RscButton {
			idc = 807;
			x = 0.25;
			y = 0.33;
			text = "N/A";
		};

		// Treat Left Leg 
		class treatLLeg : RscButton {
			idc = 808;
			x = 0.025;
			y = 0.39;
			text = "Leg Leg";
		};

		// Tourniquet Left Leg
		class tournLLeg : RscButton {
			idc = 809;
			x = 0.25;
			y = 0.39;
			text = "N/A";
		};

		// Treat Right Leg 
		class treatRLeg : RscButton {
			idc = 810;
			x = 0.025;
			y = 0.45;
			text = "Right Leg";
		};

		// Tourniquet Right Leg
		class tournRLeg : RscButton {
			idc = 811;
			x = 0.25;
			y = 0.45;
			text = "N/A";
		};

		// Inject Morphine
		class injectMorph : RscButton {
			idc = 812;
			x = 0.025;
			y = 0.51;
			text = "Inject Morphine";
		};

		// Inject Epinephrine
		class injectEpi : RscButton {
			idc = 813;
			x = 0.25‬;
			y = 0.51;
			text = "Inject Epinephrine";
		};

		// Use Basic FAK
		class useBasic : RscButton {
			idc = 814;
			x = 0.025;
			y = 0.57;
			text = "Use Basic Aid Kit";
		};

		// Use Advanced FAK
		class useAdv : RscButton {
			idc = 815;
			x = 0.25;
			y = 0.57;
			text = "Use Advanced Aid";
		};

		// Diagnose
		class diagnose : RscButtonWide {
			idc = 816;
			x = 0.025;
			y = 0.63;
			text = "Diagnose";
			action = "[""Diagnosing..."", 1, SMS_fnc_diagnose] spawn SMS_fnc_actionBar"
		};

		// Triage category
		class triageCategory : RscTextElement {
			idc = 817;
			x = 0.55;
			y = 0.15;
			w = 0.425;
			text = "UNKNOWN";
		};
	};
	class controlsBackground {
		
		class background : RscBackgroundElement {
			idc = -1; // never needs to be changed
		};
		class title : RscTitleBar {
			idc = 801;
		};
		class headingOneTreatment : RscSectionHeading {
			idc = -1; // never needs to be changed
			text = "Treatment";
			x = 0.025;
			y = 0.05;
			w = 0.45;
		};
		class headingOneOverview : RscSectionHeading {
			idc = -1; // never needs to be changed
			text = "Overview";
			x = 0.55;
			y = 0.05;
			w = 0.45;
		};
		class headingOneBreak : RscSectionBreak {
			y = 0.11;
		};
		class headingTwoBreak : RscSectionBreak {
			y = 0.70;
		};
	};

	
};

class ActionBar {
	idd=700;
	movingenable=false;
	onLoad = "uiNamespace setVariable [""SMS_ActionBar"", _this select 0]";

	class controls {
		class actionProgress : RscProgressBar {
			idc = 702;
			x = 0.21;
			y = 0.455;
			w = 0.58;
			h = 0.06;
		};
	};

	class controlsBackground {
		class background : RscBackgroundElement {
			idc = -1; // never needs to be changed
			x = 0.2;
			y = 0.4;
			w = 0.6;
			h = 0.13;
		};
		class title : RscTitleBar {
			idc = 701;
			x = 0.2;
			y = 0.4;
			w = 0.6;
		};
	};
};