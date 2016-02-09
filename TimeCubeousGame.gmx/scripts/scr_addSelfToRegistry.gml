/// Must be added to all objects that need to care directly about state
// scr_addSelfToRegistry(objStateID)

objStateID = argument0;
global.state[objStateID] = 0;
ds_list_add(registry, id);

