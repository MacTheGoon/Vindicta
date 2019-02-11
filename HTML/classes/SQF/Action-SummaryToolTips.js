NDSummary.OnToolTipsLoaded("SQFClass:Action",{2:"<div class=\"NDToolTip TClass LSQF\"><div class=\"TTSummary\">Action represents something which an agent can do over some period of time.&nbsp; Action can be in many states, see ACTION_STATE.</div></div>",4:"<div class=\"NDToolTip TVariable LSQF\"><div class=\"TTSummary\">Holds a reference to AI object which owns this action</div></div>",5:"<div class=\"NDToolTip TVariable LSQF\"><div class=\"TTSummary\">State of this action. Can be one of ACTION_STATE</div></div>",6:"<div class=\"NDToolTip TVariable LSQF\"><div class=\"TTSummary\">holds a reference to timer which sends PROCESS messages to this Action, if it\'s autonomous</div></div>",9:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Creates this action.</div></div>",11:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Sets the goal to autonomous mode.&nbsp; Autonomous goals have a timer which generate a message to call the goal\'s process method.&nbsp; By default actions are processed in the process method of their AI (&lt;AI.process&gt;).</div></div>",12:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">See MessageReceiver.handleMessage.</div></div>",13:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Calls the Activate method of this action if it\'s inactive.</div></div>",14:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Calls the Activate method of this action if it\'s in failed state.</div></div>",15:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Logic to run when the goal is activated. You should set the action state inside.</div></div>",16:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Logic to run each update-step. Remember to set the state variable of the action here as well!</div></div>",17:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">logic to run when the goal is satisfied, or before it is deleted.</div></div>",18:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">an Action is atomic and cannot aggregate subactions yet we must implement this method to provide the uniform interface required for the action hierarchy.</div></div>",19:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">an Action is atomic and cannot aggregate subactions yet we must implement this method to provide the uniform interface required for the action hierarchy.</div></div>",20:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns the list of subactions (for debug purposes).</div></div>",21:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns: true if action is in completed state, false otherwise</div></div>",22:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns: true if action is in active state, false otherwise</div></div>",23:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns: true if action is in inactive state, false otherwise</div></div>",24:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns: true if action is in failed state, false otherwise</div></div>",25:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns the cost of taking this action in current situation By default it returns the value of &quot;cost&quot; static variable You can redefine it for inherited action if the returned cost needs to depend on something</div></div>",26:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Returns preconditions of this action depending on parameters By default it tries to apply parameters to preconditions, if preconditions reference any parameters</div></div>",451:"<div class=\"NDToolTip TFunction LSQF\"><div class=\"TTSummary\">Takes an array with parameters and returns value of parameter with given tag, or nil if such a parameter was not found.&nbsp; If the parameter is not found, it will diag_log an error message.</div></div>",29:"<div class=\"NDToolTip TEnumeration LSQF\"><div class=\"TTSummary\">These are possible action states</div></div>"});