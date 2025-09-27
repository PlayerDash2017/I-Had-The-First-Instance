/// @description scrUsesTrigger(script)
/// @param script
function scrUsesTrigger(argument0) {
	//Called from objTriggerManager, returns true if a trigger script is used by the trigger.

	return (ds_list_find_index(doTriggers, argument0) != -1);



}
