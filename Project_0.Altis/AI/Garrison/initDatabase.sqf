#include "garrisonWorldStateProperties.hpp"
#include "..\goalRelevance.hpp"
#include "..\parameterTags.hpp"

private _s = WSP_GAR_COUNT;

/*
Initializes costs, effects and preconditions of actions, relevance values of goals.
*/

// ---- Goal relevance values and effects ----
// The actual relevance returned by goal can be different from the one which is set below

["GoalGarrisonRelax",					1] call AI_misc_fnc_setGoalIntrinsicRelevance;

["GoalGarrisonMove",					10] call AI_misc_fnc_setGoalIntrinsicRelevance;

["GoalGarrisonRepairAllVehicles",		20] call AI_misc_fnc_setGoalIntrinsicRelevance;

["GoalGarrisonRebalanceVehicleGroups",	25] call AI_misc_fnc_setGoalIntrinsicRelevance;

["GoalGarrisonDefendPassive",			30] call AI_misc_fnc_setGoalIntrinsicRelevance;


// ---- Goal effects ----
// The actual effects returned by goal can depend on context and differ from those set below

["GoalGarrisonRelax", _s,				[]] call AI_misc_fnc_setGoalEffects;

["GoalGarrisonMove", _s,			[	[WSP_GAR_POSITION, TAG_G_POS, true],
										[WSP_GAR_VEHICLE_GROUPS_BALANCED, true]]] call AI_misc_fnc_setGoalEffects;
//["GoalGarrisonMove", _s,				[[WSP_GAR_ALL_CREW_MOUNTED, true]]] call AI_misc_fnc_setGoalEffects;

["GoalGarrisonRepairAllVehicles", _s, [	[WSP_GAR_ALL_VEHICLES_REPAIRED, true],
										[WSP_GAR_ALL_VEHICLES_CAN_MOVE, true]]] call AI_misc_fnc_setGoalEffects;
										
["GoalGarrisonMoveCargo", _s,			[[WSP_GAR_CARGO_POSITION, TAG_CARGO_POS, true],
										[WSP_GAR_HAS_CARGO, false],
										[WSP_GAR_VEHICLE_GROUPS_BALANCED, true]]] call AI_misc_fnc_setGoalEffects;
										
["GoalGarrisonDefendPassive", _s,		[[WSP_GAR_AWARE_OF_ENEMY, false]]] call AI_misc_fnc_setGoalEffects;


// ---- Predefined actions of goals ----

["GoalGarrisonRelax", "ActionGarrisonRelax"] call AI_misc_fnc_setGoalPredefinedAction;

["GoalGarrisonRepairAllVehicles", "ActionGarrisonRepairAllVehicles"] call AI_misc_fnc_setGoalPredefinedAction;

["GoalGarrisonRebalanceVehicleGroups", "ActionGarrisonRebalanceVehicleGroups"] call AI_misc_fnc_setGoalPredefinedAction;


// ---- Action preconditions and effects ----

// Repair all vehicles
["ActionGarrisonRepairAllVehicles",	_s, [	]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonRepairAllVehicles",	_s,	[	[WSP_GAR_ALL_VEHICLES_REPAIRED,	true],
											[WSP_GAR_ALL_VEHICLES_CAN_MOVE,	true]]] call AI_misc_fnc_setActionEffects;
										
// Mount crew
["ActionGarrisonMountCrew",	_s,			[	[WSP_GAR_VEHICLE_GROUPS_MERGED, true]]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonMountCrew",	_s,			[	[WSP_GAR_ALL_CREW_MOUNTED,		TAG_MOUNT, true]]] call AI_misc_fnc_setActionEffects;

// Mount infantry
["ActionGarrisonMountInfantry",	_s,		[]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonMountInfantry",	_s,		[	[WSP_GAR_ALL_INFANTRY_MOUNTED,	true]]] call AI_misc_fnc_setActionEffects;

// Move mounted
["ActionGarrisonMoveMounted", _s,		[	[WSP_GAR_ALL_CREW_MOUNTED,		true],
											[WSP_GAR_ALL_INFANTRY_MOUNTED,	true],
											[WSP_GAR_ALL_VEHICLE_GROUPS_HAVE_DRIVERS,	true]]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonMoveMounted", _s,		[	[WSP_GAR_POSITION,	TAG_POS,	true],
											[WSP_GAR_VEHICLES_POSITION,	TAG_POS,	true]]] call AI_misc_fnc_setActionEffects; // Position is defined in parameter 0 of the action
["ActionGarrisonMoveMounted", 			[TAG_RADIUS]] call AI_misc_fnc_setActionParametersFromGoal;

// Move mounted cargo
["ActionGarrisonMoveMountedCargo", _s,		[	[WSP_GAR_ALL_CREW_MOUNTED,		true],
												[WSP_GAR_ALL_INFANTRY_MOUNTED,	true],
												[WSP_GAR_HAS_CARGO,				true]]] 		call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonMoveMountedCargo", _s,		[	[WSP_GAR_POSITION,	TAG_POS,	true], 
												[WSP_GAR_CARGO_POSITION,	TAG_POS,	true],
												[WSP_GAR_VEHICLES_POSITION,	TAG_POS,	true]]] 		call AI_misc_fnc_setActionEffects; // Position is defined in parameter 0 of the action


// Move dismounted
["ActionGarrisonMoveDismounted", _s,	[	[WSP_GAR_ALL_CREW_MOUNTED,		false],
											[WSP_GAR_ALL_INFANTRY_MOUNTED,	false]]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonMoveDismounted", _s,	[	[WSP_GAR_POSITION,	TAG_POS,	true]]]			call AI_misc_fnc_setActionEffects; // Position is defined in parameter 0 of the action

// Load cargo
["ActionGarrisonLoadCargo", _s,			[	[WSP_GAR_HAS_CARGO,	false],
											[WSP_GAR_VEHICLES_POSITION, [1, 1, 1]]]]	call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonLoadCargo", _s,			[	[WSP_GAR_HAS_CARGO, true]]]		call AI_misc_fnc_setActionEffects;
["ActionGarrisonLoadCargo", 			[TAG_CARGO]] call AI_misc_fnc_setActionParametersFromGoal;

// Unload cargo
["ActionGarrisonUnloadCurrentCargo", _s,	[	[WSP_GAR_HAS_CARGO,	true]]]		call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonUnloadCurrentCargo", _s,	[	[WSP_GAR_HAS_CARGO,	false]]]	call AI_misc_fnc_setActionEffects;

// Defend passive
["ActionGarrisonDefendPassive", _s,	[	]]		call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonDefendPassive", _s,	[	[WSP_GAR_AWARE_OF_ENEMY,	false]]]	call AI_misc_fnc_setActionEffects;

// Merging and splitting vehicle groups
["ActionGarrisonMergeVehicleGroups", _s, [ ]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonMergeVehicleGroups", _s, [ [WSP_GAR_VEHICLE_GROUPS_MERGED, TAG_MERGE, true] ]] call AI_misc_fnc_setActionEffects;

// Rebalancing vehicle groups
["ActionGarrisonRebalanceVehicleGroups", _s, [ ]] call AI_misc_fnc_setActionPreconditions;
["ActionGarrisonRebalanceVehicleGroups", _s, [ [WSP_GAR_VEHICLE_GROUPS_BALANCED, true] ]] call AI_misc_fnc_setActionEffects;

// ---- Action costs ----
["ActionGarrisonMountCrew",					0.4]	call AI_misc_fnc_setActionCost;
["ActionGarrisonMountInfantry",				0.6]	call AI_misc_fnc_setActionCost;
["ActionGarrisonMoveMounted",				2.0]	call AI_misc_fnc_setActionCost;
["ActionGarrisonMoveMountedCargo",			3.0]	call AI_misc_fnc_setActionCost;
["ActionGarrisonMoveDismounted",			6.0]	call AI_misc_fnc_setActionCost;
["ActionGarrisonLoadCargo",					2.0] 	call AI_misc_fnc_setActionCost;
["ActionGarrisonUnloadCurrentCargo", 		0.3]	call AI_misc_fnc_setActionCost;
["ActionGarrisonDefendPassive", 			1.0]	call AI_misc_fnc_setActionCost;
["ActionGarrisonMergeVehicleGroups", 		0.1]	call AI_misc_fnc_setActionCost;
["ActionGarrisonRebalanceVehicleGroups", 	0.1]	call AI_misc_fnc_setActionCost;
["ActionGarrisonRepairAllVehicles", 		0.1]	call AI_misc_fnc_setActionCost;

// ---- Action precedence ----
["ActionGarrisonMountCrew",					5]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonMountInfantry",				6]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonMoveMounted",				20]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonMoveMountedCargo",			20]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonMoveDismounted",			20]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonLoadCargo",					10] call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonUnloadCurrentCargo", 		30]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonDefendPassive", 			20]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonMergeVehicleGroups", 		1]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonRebalanceVehicleGroups", 	2]	call AI_misc_fnc_setActionPrecedence;
["ActionGarrisonRepairAllVehicles", 		1]	call AI_misc_fnc_setActionPrecedence;