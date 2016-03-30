/// Must be added to all objects that need to care directly about state
// scr_addSelfToRegistry(stateHandler, registryForThatHandler, objStateID)

objStateID = argument2;
//show_debug_message("Inside addSelfToReg, battle machine now: " + string(global.btlState));
argument0[objStateID] = 0;
//show_debug_message("Player Turn, before addSelfToReg, battle machine now: " + string(global.btlState));
ds_list_add(argument1, id);

