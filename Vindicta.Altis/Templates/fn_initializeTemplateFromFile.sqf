#include "..\config\global_config.hpp"

#ifdef _SQF_VM
#define IS_SERVER true
#else
#define IS_SERVER isServer
#endif

params [["_filePath", "", [""]]];

// Call compile the file as usual...
_t = call compile preprocessFileLineNumbers _filePath;

// Set mission namespace variable
private _tName = _t select T_NAME;
if (isNil "_tName") exitWith {
	diag_log format ["[Template] error: tempalte name was not specified for %1", _filePath];
};

diag_log "";
diag_log "";
diag_log "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -";
diag_log format ["[Template] Initializing template from file: %1", _filePath];

// Check for errors, inexistent class names or loadouts, etc
private _errorCount = [_t] call t_fnc_validateTemplate;
if (_errorCount > 0) exitWith {
	_t = []; // Break it completely so that whole scenario fails horribly and we can see the errors in RPT
	missionNamespace setVariable [_tName, _t];
	diag_log format ["[Template] ERROR: %1", _filePath];

	// If it's run in SQF VM, return an error code to the validation script
	#ifdef _SQF_VM
	exitcode__ _errorCount;
	#endif
};

diag_log format ["[Template] File %1 seems correct!", _filePath];

#ifndef _SQF_VM
// Convert class names to numbers, so that t_fnc_numberToClassName can work later
// Makes no use for tests with SQF VM
[_t] call t_fnc_convertTemplateClassNamesToNumbers;
#endif

// Process inventory items
#ifndef _SQF_VM
#define __PROCESS_ITEMS
#endif

// To speed things up when game mode is disabled, we don't process items
#ifdef GAME_MODE_DISABLE
#undef __PROCESS_ITEMS
#endif

#ifdef __PROCESS_ITEMS
if (isServer) then {
	private _result = [_t] call t_fnc_processTemplateItems;
	_result params ["_templateItems", "_loadoutWeapons"];
	_t set [T_INV, _templateItems];
	_t set [T_LOADOUT_WEAPONS, _loadoutWeapons];
};
#endif

if (IS_SERVER) then {
	missionNamespace setVariable [_tName, _t, true];
	t_validTemplates pushBack _tName; // It will be publicVariable'd later
};

// Return the array
_t