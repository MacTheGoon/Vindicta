#define OOP_INFO
#define OOP_WARNING
#define OOP_ERROR
#define OOP_DEBUG

#define OFSTREAM_FILE "UI.rpt"
#include "..\..\OOP_Light\OOP_Light.h"

#define pr private

CLASS("RecruitDialog", "DialogBase") 

	VARIABLE("location");

	METHOD("new") {
		params [P_THISOBJECT, P_OOP_OBJECT("_loc")];

		OOP_INFO_1("NEW: %1", _this);

		T_SETV("location", _loc);

		T_CALLM2("addTab", "RecruitTab", "");
		
		T_CALLM1("enableMultiTab", false);
		T_CALLM2("setContentSize", 0.63, 0.63);
		T_CALLM1("setCurrentTab", 0);
		T_CALLM1("setHeadlineText", "Recruit Soldiers");
		T_CALLM1("setHintText", "Hint: location must have an arsenal");

	} ENDMETHOD;

ENDCLASS;