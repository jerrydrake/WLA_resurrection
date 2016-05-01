//https://community.bistudio.com/wiki/Arma_3_Advanced_Hints_(Field_Manual)#Config
/*
class UnderCoverMode
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Undercover Mode";
                        // Optional hint subtitle, filled by arguments from 'arguments' param
			displayNameShort = "Undercover Mode";
			// Structured text, filled by arguments from 'arguments' param
			description = "Press %11 to step over low obstacle. Your %13 is %14";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
                        tip = "The free look represents turning the head sideways and up or down.";
			arguments[] = {
				{{"getOver"}}, // Double nested array means assigned key (will be specially formatted)
                                {"name"}, // Nested array means element (specially formatted part of text)
				"name player" // Simple string will be simply compiled and called
                                              // String is used as a link to localization database in case it starts by str_
			};
			// Optional image
			image = "\path\image_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
*/
class CfgHints
{
	class WLA
	{
		// Topic title (displayed only in topic listbox in Field Manual)
		displayName = "WLA Guide";
		class GearGathering
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Gear Gathering";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Content from very near vehicles, crates, bodies and ground can be stored by pressing %3Y-key%4 to be used later in %3Gear%4-function (%3WLA%4-Menu). To be able to use this function, the last used operative land-vehicle needs to be under 100m away";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Boarded vehicle is marked as the last used vehicle in%3 20 seconds%4";
			arguments[] = {};
			// Optional image
			image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; 
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class SpecialStructures
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Special Structures";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "%2%3STORAGE%4 enables the %3Gear%4-function to be used near the post too. (Not needed with lower difficulty levels)<br/>%2%3ANTENNA%4 lower costs of called support near the post.<br/>%2%3POW-CELL%4 allows to move surrendered unit into it (%3use Talk-function%4) which increase timed prestige<br/>%2%3FACTORY/SILO/STORAGE%4, creates factory or storage<br/>%2%3RADARS%4, CSAT AA dont block intel<br/>%2%3TRANSMITTER TOWERS%4, x0.3 Support Costs<br/>%2%3MIL OFFICE%4, Access to Air Support Calls<br/>%2%3CARGO HOUSE%4, Fix/reammo vehicle using Y at the pointed vehicle near the building";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Holding POW(s) might bring extra attacks to the post";
			arguments[] = {};
			// Optional image
			image = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\Loading_01_co.paa"; 
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class CallSupport
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Call Support";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "The %3Call Support%4-function is entered via WLA-main menu (%3Shift+1%4). Depending on progress in tasks, more options become available.<br/><br/>%2Called land support can be commanded with High Command-interface (%3Ctlr+Space%4)<br/>%2Once left much behind called Land and Air-vehicles create a new zone on a map that can be commanded on map view, and once reaching player again from High Command-interface";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "If having antenna built in guardpost, support call prices drop by half near the post";
			arguments[] = {};
			// Optional image
			image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class CustomKeys
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Custom Key Functions";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Call Mortar/Artillery: %3SHIFT + 6%4<br/>Minefield Creating System: %3Shift + L%4<br/>Construction View: %3Shift + C%4<br/>Camp Purchase Screen: %3SHIFT + 1%4<br/>VillagePurchase Screen: %3SHIFT + 1%4<br/>Talk To Civilians: %3SHIFT + Y%4<br/>Skip Time (Resting): %3SHIFT + 1%4<br/>Support Call Menu: %3SHIFT + 1%4<br/>Toggle Streetlights: Press %3SHIFT + 7%4 (when near distribution board)<br/>Steal Car/Take Objects: %3Y%4<br/>Load Crates to Truck: %3SHIFT + 9%4<br/>Change Gear: %3SHIFT + 1%4 (when near friendly camp)<br/>Change to Civ: %3Alt+Y%4<br/>(Un)holster pistol (when civilian): %3Ctrl+Y%4<br/>Toggle 3D Icons: %3Shift+U%4<br/>Use Fist (when unarmed): %3U%4<br/>YELL (To make CSAT surrender): %3U%4";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "With certain keyboards, you might need to use %3Z-key%4 instead of a Y-key";
			arguments[] = {};
			// Optional image = "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\ActionMenu_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class CustomSaveGame
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Custom Savegame Function";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "To continue your progress after mission or game updates, you need to use %3Savegame-button%4 in %3WLA-main menu (Shift+1)%4, %3WLA autosave%4 or%3 0-0-0%4 to save.<br/><br/>Overall mission progress can be then resumed, after resetting, at mission start options";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Removing addons and resuming mission progress may leave empty slots in stored gear";
			arguments[] = {};
			// Optional image
			image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class UnderCoverMode
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Undercover Mode";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Activate mode with %3ALT+Y%4 while inside any house. Exit by pressing %3ALT+Y%4 when visiting friendly camp, or return to location where mode was activated.<br/><br/>AVOID CSAT ATTENTION<br/>%2Do not keep weapon in sight, you are not allowed to carry other weapons, vests or army uniform and use only civilian vehicles<br/>%2Stay away from CSAT camps/guardposts and dont stay long near hostile soldiers<br/>%2Keep NVGoggles in backpack or 15m distance to enemies";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "(Un)holster pistol with %3Ctrl+Y%4. Use your fist with %3U-key%4 when unarmed";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Fatigue_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\Fatigue_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class OptionalTasks
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Optional Tasks";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "By talking to near civilians and friendly soldiers using %3Shift+C%4, you can commit optional tasks for them. With received perstige from succesfully finished tasks, you will improve relationship locally towards civilians. Civilian tasks also allow you to pick the prize type including extra team-mates and strategic points";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "You can only have one active task at time for a village";
			arguments[] = {};
			// Optional image
			image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class Prestige
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Prestige";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Prestige is used to construct, call support and receive assests.<br/><br/>Get more from %3gathered items%4 and %3tasks%4.<br/><br/>%3For more timed prestige flow%4, capture piers, power plants and factories. Having storages adds bonus over that. These locations are captured %3by creating guardpost%4 with at least one assigned guard or static weapon. For factories, the local relationship needs to be friendly";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "You can receive strategic locations from %3CIV-tasks%4 but only with 0.5x effect. %3Factory requires 0.5 Power Plant and 0.25 Pier to work%4";
			arguments[] = {};
			// Optional image
			image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class Construct
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Construct";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "You can use construct trucks/choppers to build own guardposts by hitting %3Shift+C%4 near the vehicle. First lay the fortress, after that more options appear. You can also place AI guards, weapons and vehicles after commiting certain tasks";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "To get more construction vehicles, visit Other-sectio in %3Call Support%4-menu or %3Military Center%4 when near camp or marked airfield via %WLA-main menu (%3Shift+1%4)";
			arguments[] = {};
			// Optional image
			image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};	
		class Battle
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Camp/Strategic Battles";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "CSAT will try commit assaults to capture camps, strategic locations and supplylines. There might be also friendly assault against CSAT camps. If the AO is far away, its possible to use %3fast-travel%4 (via WLA-main menu Shift+1) that is only available near friendly camps/guardposts on higher difficulties";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Creating guarded guardposts near camps and other important locations will help to defend the locations, even when you are not around";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\NormalDamage_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\NormalDamage_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};	
		class ConstructNotes
		{
			// Hint title, filled by arguments from 'arguments' param
			displayName = "Construct Notes";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "%11";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Once creating bunker, you area able to construct other objects. Static weapons and vehicles may be only available after certain tasks.";
			arguments[] = {
			"if (GUARDLIM) then {""For this %3LimitedForFPS%4-mode, selected in mission start options, there is more rules<br/><br/>LIMITS (Static/AI-Guard):<br/>%2%3Small BagBunker%4 - 1 / 2<br/>%2%3Tower BagBunker%4 - 2 / 3<br/>%2%3Large BagBunker%4 - 2 / 3<br/>%2%3H Barrier Tower%4 - 2 / 3<br/>%2%3Tower Bunker%4 - 3 / 4<br/>%2%3Big Steel Bunker%4 - 4 / 5""} else {""Creating guardposts near each other with much static weapons/vehicles and AI units %3may hurt FPS%4. %3Recommended%4 - max around 5 static guns/vehicle and 10 AI guards in 1km^2""};"
			};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Commanding_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\Commanding_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};	
		class CustomMods
		{
			// Hint title, filled by arguments from 'arguments' param 
			displayName = "Enabling Custom Mods";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Mod content can be enabled in WLA-main menu (%3Shift+1%4) to make them appear during mission.<br/><br/>Virtual Battles have more random results when addon vehicles are taking part in it.<br/><br/>Keep %3at least one%4 class in each section to prevent errors and only use %3working classnames%4";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "%2Click Reset Veh Zones button after changes<br/>%2Slots allow you to %3Save%4 and %3Load%4 templates even when restarting mission and not resuming progress";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class StartOptions
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "Start Options";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "%3Ambient Life%4, amount of civilians/animals<br/>%3Asset Unlocking%4, as default you have only limited support call/constructing options that expand by commiting main tasks<br/>%3Constructing%4, as default amount of allowed life in created guardpost are limited on fortress type in order to keep FPS good<br/>%3Life Range%4, the lower the more AI is met nearby<br/>%3Disable Extra%4, when FPS gets under the limit - traffic, animals and some other features are disabled<br/>%3Player Needs%4, you will need to eat, drink and rest to avoid dizzyness";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class CustomSounds
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "Custom Sounds Addon";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Custom voices and music are added into mission as %3separate addon%4.<br/><br/>You can install it from %3Workshop%4 or %3withSix%4 by searching WLA sound addon, or manually from %3BI forum%4 mission topic named [SP/MP] Dynamic Whole Map ArmA3 Missions by SaOk.<br/><br/>Having sounds in separate addon allows smaller mission updates and sharing the sounds with other same concept missions";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "If addon is installed correctly, this hint isnt displayed at mission start";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class WLAMenu
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "WLA Main Menu";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "The core functions are accessed via this %3Shift+1%4 menu<br/><br/>AVAILABILITY<br/>%3Military Center%4 near friendly camps, airfields, captured piers and basecamp<br/>%3LOCAL SHOP%4 in villages<br/>%3FAST-TRAVEL%4 near friendly camps and guardposts depending on difficulty level<br/>%3GEAR%4 near friendly camps, guardposts with storage and ammo truck (or every where with easy difficulty)";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class FactoryCreations
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "Factory Creations";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Factories allow you to create land and air vehicles, including MOD content.<br/><br/>%3STEPS%4<br/>%2One vehicle costs 3 resource points to create<br/>%2Scrap old vehicles near the factory using Y-key while pointing at the vehicle<br/>%2When having captured pier, power-plant and factory, more resources pile up slowly";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Scrapped vehicle gives one resource point";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class StarterTips
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "Starter Tips";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "To survive better, you can follow these tips<br/>%2Use hold fire (3-2) command for team-mates not to draw extra attention<br/>%2Firefights will draw more enemies slowly to your location, keep moving<br/>%2To calm area locally, CSAT camps need to be captured in 6km radius<br/>%2Finding and destroying military antennas prevent CSAT calling reinforcements and share your location between other teams";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Find more guidance from Field Manual in ESC-menu and briefing in map view - M-key";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class Surrendering
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "Enemies Surrendering";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "If CSAT soldiers get low numbered locally, they might surrender by their own will. You can also use U-key to yell at enemy which could make the surrender faster. If getting behind and close undetected, soldiers are much wounded or shocked from recent barrel explosion, yelling make them surrender very easily";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Surrendered units can be chatted using U-key. If you have POW-cell(s) created, its possible to move the surrender units in to those to get more timed prestige";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
		class GearShop
		{
			// Hint title, filled by arguments from 'arguments' param StartOptions
			displayName = "Gear Shops";
           // Optional hint subtitle, filled by arguments from 'arguments' param
			//displayNameShort = "Activate mode with ALT+Y while in any house. Exit by visiting friendly camp or return to location where mode was activated";
			// Structured text, filled by arguments from 'arguments' param
			description = "Gear shops selling weapons, magazines and other gear are only available, in gear menu, when near captured pier, airfield or factory, or everywhere if using EASY-difficulty.";
                        // Optional structured text, filled by arguments from 'arguments' param (first argument
                        // is %11, see notes bellow), grey color of text
            tip = "Pricing: Pistols 50, Rifles 100, Launchers 200, Magazines 20, Vests 100, Backpacks 100, Headgear 20, Weapons Items 50 and Other Items 30";
			arguments[] = {};
			// Optional image image = "\a3\ui_f\data\gui\cfg\hints\Miss_icon_ca.paa"; image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			image = "\a3\ui_f\data\gui\cfg\hints\VehicleGUI_ca.paa";
			// Hint scope, values as everywhere else in game. 2 means displayed, 0 and 1 not.)
			scope = 2;
		};
	};
};
