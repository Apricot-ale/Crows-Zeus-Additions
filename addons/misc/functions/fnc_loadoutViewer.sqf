#include "script_component.hpp"
/*/////////////////////////////////////////////////
Author: Crowdedlight
			   
File: fnc_loadoutViewer.sqf
Parameters: Hovered Entity
Return: none

shows the loadout of the unit in an quick view

*///////////////////////////////////////////////
params ["_entity"];

//create display 
if (!createDialog "crowsza_loadout_display") exitWith {};

//get display
private _display = uiNamespace getVariable "crowsza_loadout_display";

// save object that is selected 
_display setVariable ["crowsza_loadout_viewer_unit", _entity];

//use ZENs method to init display posisions. I can use it as I should have same base setup as ZEN uses in their gui
[_display] call zen_common_fnc_initDisplayPositioning;

//get common info, weight, name etc.
private _displayName = name _entity;
private _groupName = groupId (group _entity);
private _groupLeader = leader group _entity;

// Set the display's title to the object name
private _ctrlTitle = _display displayCtrl IDC_TITLE;
_ctrlTitle ctrlSetText toUpper format ["Loadout - %1", _displayName];

//fill out group and groupleader info
private _ctrlTitleGroup = _display displayCtrl IDC_TITLE_GROUP;
_ctrlTitleGroup ctrlSetText format ["Group: %1", _groupName];

private _ctrlTitleGroupLeader = _display displayCtrl IDC_TITLE_GROUP_LEADER;
_ctrlTitleGroupLeader ctrlSetText format ["SL: %1", _groupLeader];

// Initially populate the list with items
[_display] call FUNC(loadoutRefresh);