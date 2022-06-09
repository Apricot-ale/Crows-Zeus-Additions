/*/////////////////////////////////////////////////
Author: Crowdedlight
			   
File: fnc_addZeusTextDisplayEH.sqf
Parameters: 
Return: none

Adds the drawEvent handlers to zeus to show the helper text for modules applied to players

*///////////////////////////////////////////////

// only if zeus, add draw3D handler for zeus-labels
crowsZA_unit_icon_drawEH = addMissionEventHandler ["Draw3D", {
	// if zeus display is null, exit. Only drawing when zeus display is open
	//if (isNull(findDisplay 312)) exitWith {};
	if (isNull _x) exitWith {};
	if (!crowsZA_zeusTextDisplay) exitWith {};

	// cam position
	private _zeusPos = positionCameraToWorld [0,0,0];

	// Medic 
	{
		_x params["_player", "_color", "_color2", "_woundNum", "_hr", "_bleedingRate", "_inCRDC", "_inPain", "_txt", "_txt2", "_txt3"];

		// calculate distance from zeus camera to unit
		private _dist = _zeusPos distance _player;

		// // if not within 500m, we don't draw it as the text does not scale and disappear with distance
		if (_dist > 500) then {continue;};

		

		// draw icon on relative pos 
		// offset: z: +2
		private _pos = ASLToAGL getPosASL _player;
		if (crowsZA_zeusTextLine1) then { drawIcon3D ["", _color, [_pos#0, _pos#1, _pos#2+2.10], 0, 0, 0, _txt, 1, 0.03, "RobotoCondensed", "center", false] };
		if (crowsZA_zeusTextLine2) then { drawIcon3D ["", _color2, [_pos#0, _pos#1, _pos#2+1.95], 0, 0, 0, _txt2, 1, 0.03, "RobotoCondensed", "center", false] };
		if (crowsZA_zeusTextLine3) then { drawIcon3D ["", _color2, [_pos#0, _pos#1, _pos#2+1.80], 0, 0, 0, _txt3, 1, 0.03, "RobotoCondensed", "center", false] };
	} forEach crowsZA_medical_status_players;
}];