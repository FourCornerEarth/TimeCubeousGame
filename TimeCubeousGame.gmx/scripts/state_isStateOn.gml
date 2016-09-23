/// state_isStateOn(stateHandler)

var stateHandler = argument0;
if (stateHandler[objStateID] == STATE_STATUS.ON) {
   return STATE_STATUS.ON;
}

else return STATE_STATUS.OFF;
