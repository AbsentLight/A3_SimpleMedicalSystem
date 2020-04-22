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
			action = "[""Bandaging..."", missionNamespace getVariable ""SMS_CONFIG_BANDAGETIME"", SMS_fnc_applyBandage,[""HEAD""]] spawn SMS_fnc_actionBar";
		};

		// Body (Wide)
		class treatBody : RscButtonWide {
			idc = 803;
			x = 0.025;
			y = 0.21;
			text = "Body";
			action = "[""Bandaging..."", missionNamespace getVariable ""SMS_CONFIG_BANDAGETIME"", SMS_fnc_applyBandage,[""BODY""]] spawn SMS_fnc_actionBar";
		};

		// Treat Left Arm 
		class treatLArm : RscButton {
			idc = 804;
			x = 0.025;
			y = 0.27;
			text = "Left Arm";
			action = "[""Bandaging..."", missionNamespace getVariable ""SMS_CONFIG_BANDAGETIME"", SMS_fnc_applyBandage,[""LARM""]] spawn SMS_fnc_actionBar";
		};

		// Tourniquet Left Arm
		class tournLArm : RscButton {
			idc = 805;
			x = 0.25;
			y = 0.27;
			text = "N/A";
			action = "[[""LARM""] call SMS_fnc_getTourniquetActionText, missionNamespace getVariable ""SMS_CONFIG_TOURNTIME"", SMS_fnc_applyTourniquet,[""LARM""]] spawn SMS_fnc_actionBar";
		};

		// Treat Right Arm 
		class treatRArm : RscButton {
			idc = 806;
			x = 0.025;
			y = 0.33;
			text = "Right Arm";
			action = "[""Bandaging..."", missionNamespace getVariable ""SMS_CONFIG_BANDAGETIME"", SMS_fnc_applyBandage,[""RARM""]] spawn SMS_fnc_actionBar";
		};

		// Tourniquet Right Arm
		class tournRArm : RscButton {
			idc = 807;
			x = 0.25;
			y = 0.33;
			text = "N/A";
			action = "[[""RARM""] call SMS_fnc_getTourniquetActionText, missionNamespace getVariable ""SMS_CONFIG_TOURNTIME"", SMS_fnc_applyTourniquet,[""RARM""]] spawn SMS_fnc_actionBar";
		};

		// Treat Left Leg 
		class treatLLeg : RscButton {
			idc = 808;
			x = 0.025;
			y = 0.39;
			text = "Leg Leg";
			action = "[""Bandaging..."", missionNamespace getVariable ""SMS_CONFIG_BANDAGETIME"", SMS_fnc_applyBandage,[""LLEG""]] spawn SMS_fnc_actionBar";
		};

		// Tourniquet Left Leg
		class tournLLeg : RscButton {
			idc = 809;
			x = 0.25;
			y = 0.39;
			text = "N/A";
			action = "[[""LLEG""] call SMS_fnc_getTourniquetActionText, missionNamespace getVariable ""SMS_CONFIG_TOURNTIME"", SMS_fnc_applyTourniquet,[""LLEG""]] spawn SMS_fnc_actionBar";
		};

		// Treat Right Leg 
		class treatRLeg : RscButton {
			idc = 810;
			x = 0.025;
			y = 0.45;
			text = "Right Leg";
			action = "[""Bandaging..."", missionNamespace getVariable ""SMS_CONFIG_BANDAGETIME"", SMS_fnc_applyBandage,[""RLEG""]] spawn SMS_fnc_actionBar";
		};

		// Tourniquet Right Leg
		class tournRLeg : RscButton {
			idc = 811;
			x = 0.25;
			y = 0.45;
			text = "N/A";
			action = "[[""RLEG""] call SMS_fnc_getTourniquetActionText, missionNamespace getVariable ""SMS_CONFIG_TOURNTIME"", SMS_fnc_applyTourniquet,[""RLEG""]] spawn SMS_fnc_actionBar";
		};

		// Inject Morphine
		class injectMorph : RscButton {
			idc = 812;
			x = 0.025;
			y = 0.51;
			text = "Inject Morphine";
			action = "[""Injecting Morphine..."", missionNamespace getVariable ""SMS_CONFIG_INJECTTIME"", SMS_fnc_injectMorphine,[]] spawn SMS_fnc_actionBar";
		};

		// Inject Epinephrine
		class injectEpi : RscButton {
			idc = 813;
			x = 0.25‬;
			y = 0.51;
			text = "Inject Epinephrine";
			action = "[""Injecting Epinephrine..."", missionNamespace getVariable ""SMS_CONFIG_INJECTTIME"", SMS_fnc_injectEpinephrine,[]] spawn SMS_fnc_actionBar";
		};

		// Use Basic FAK
		class useBasic : RscButton {
			idc = 814;
			x = 0.025;
			y = 0.57;
			text = "Use Basic Aid Kit";
			action = "[""Giving Basic Aid..."", missionNamespace getVariable ""SMS_CONFIG_BASICAIDTIME"", SMS_fnc_useBasicAid,[]] spawn SMS_fnc_actionBar";
		};

		// Use Advanced FAK
		class useAdv : RscButton {
			idc = 815;
			x = 0.25;
			y = 0.57;
			text = "Use Advanced Aid";
			action = "[""Giving Advanced Aid..."", missionNamespace getVariable ""SMS_CONFIG_ADVAIDTIME"", SMS_fnc_useAdvancedAid,[]] spawn SMS_fnc_actionBar";
		};

		// Diagnose
		class diagnose : RscButtonWide {
			idc = 816;
			x = 0.025;
			y = 0.63;
			text = "Diagnose";
			action = "[""Diagnosing..."", 1, SMS_fnc_diagnose,[]] spawn SMS_fnc_actionBar";
		};

		// Triage category
		class triageCategory : RscTextElement {
			idc = 817;
			x = 0.55;
			y = 0.15;
			w = 0.425;
			text = "UNKNOWN";
		};

		// Status Messages
		class statusMessages : RscStructuredText {
			idc = 818;
			x = 0.55;
			y = 0.21;
			w = 0.425;
			h = 0.41;
			text = "Under the effect of Morphine";
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
			y = 0.44;
			w = 0.6;
			h = 0.09;
		};
		class title : RscTitleBar {
			idc = 701;
			x = 0.2;
			y = 0.4;
			w = 0.6;
		};
	};
};