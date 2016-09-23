/// state_toggleStepFunc(stateMachine)

// Turn the object's step function on and off


var stateHandler = argument0;

if (!stateHandler[objStateID] && state_stepFuncOK(stateHandler)) {
   stateHandler[objStateID] = STATE_STATUS.ON;
}

else {stateHandler[objStateID] = STATE_STATUS.OFF;}

return stateHandler;
