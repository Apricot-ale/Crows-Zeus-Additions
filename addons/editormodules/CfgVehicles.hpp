class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;					// Default edit box (i.e. text input field)
			class EditShort;
			class Combo;				// Default combo box (i.e. drop-down menu)
			class Checkbox;				// Default checkbox (returned value is Boolean)
			class CheckboxNumber;		// Default checkbox (returned value is Number)
			class ModuleDescription;	// Module description
			class Units;				// Selection of units on which the module is applied
		};

		// // Description base classes (for more information see below):
		class ModuleDescription
		{
			class Anything;
		};

		// class ArgumentsBaseUnits;
        // class ModuleDescription;
	};

	// Helping pages 
	// https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes:_Controls#Slider
	// https://community.bistudio.com/wiki/Modules 
	// https://github.com/acemod/ACE3/blob/62055d2605839c1254a75c33eacaecef0d414873/addons/fortify/CfgVehicles.hpp 

	class GVAR(moduleDrawbuild): Module_F
	{
		// Standard object definitions:
		scope = 2;										// Editor visibility; 2 will show it in the menu, 1 will hide it.
		displayName = "DrawBuild";				// Name displayed in the menu
		icon = QPATHTOEF(drawbuild,data\drawbuild.paa);	// Map icon. Delete this entry to use the default icon.
		vehicleClass = "Modules";
		category = "crowsza_modules";
		function = QFUNC(startDrawbuild);	// Name of function triggered once conditions are met
		functionPriority = 1;				// Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
		isGlobal = 0;						// 0 for server only execution, 1 for global execution, 2 for persistent global execution
		isTriggerActivated = 1;				// 1 for module waiting until all synced triggers are activated
		isDisposable = 1;					// 1 if modules is to be disabled once it is activated (i.e. repeated trigger activation won't work)
		is3DEN = 0;							// 1 to run init function in Eden Editor as well
		// curatorInfoType = "RscDisplayAttributeModuleNuke"; // Menu displayed when the module is placed or double-clicked on by Zeus

		// Module attributes (uses https://community.bistudio.com/wiki/Eden_Editor:_Configuring_Attributes#Entity_Specific):
	};
};
