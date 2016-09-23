/// scr_addSelfToRegistry(stateHandler, registryForThatHandler, objStateID)
// Must be added to all objects that need to care directly about state

var stateHandler = argument0;
var registry = argument1;
objStateID = argument2;
//show_debug_message("Inside addSelfToReg, battle machine now: " + string(global.btlState));
stateHandler[objStateID] = STATE_STATUS.OFF;
//show_debug_message("Player Turn, before addSelfToReg, battle machine now: " + string(global.btlState));
ds_list_add(registry, id);

