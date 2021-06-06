/*/////////////////////////////////////////////////
Author: Crowdedlight
			   
File: fn_tfarJammingZeus.sqf
Parameters: pos, _unit
Return: none

The script that gets run on each client locally, spawned from zeus module. Each jammer created spawns this script, but the script doesn't start the loop if it detects one loop already running

*///////////////////////////////////////////////
params [["_pos",[0,0,0],[[]],3], ["_unit",objNull,[objNull]]];

//ZEN dialog, just ignore ARES, as that mod itself is EOL and links to ZEN
private _onConfirm =
{
	params ["_dialogResult","_in"];
	_dialogResult params
	[
		"_rad",
		"_strength"
	];
	//Get in params again
	_in params [["_pos",[0,0,0],[[]],3], ["_unit",objNull,[objNull]]];
	
	// if object is null, we can't start the jamming
	if (_unit == objNull) exitWith {["You have to put jammer on a object", false] call crowsZA_fnc_showHint;};

	//Run jam local script, true for JIP, sent to everyone but server
	[_unit, _rad, _strength] remoteExec ["crowsZA_fnc_tfarJammingLocal", -2, true];
};
[
	"TFAR Jammer", 
	[
		["SLIDER","Jamming Radius",[50,5000,500,0]], //5 to 5000, default 500 and showing 0 decimal.
		["SLIDER","Jamming Strength",[0,100,50,0]] //0 to 100, default 50 and showing 0 decimal
	],
	_onConfirm,
	{},
	_this
] call zen_dialog_fnc_create;
