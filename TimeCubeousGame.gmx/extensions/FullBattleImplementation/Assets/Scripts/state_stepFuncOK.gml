/// state_stepFuncOK(stateMachine)
// Is it okay to run this state?

var stateMachine = argument0;
for (var i = 0; i < array_length_1d(stateMachine); i++) {
        if (i != objStateID && stateMachine[i]) {return STATE_STATUS.OFF;}
}

return STATE_STATUS.ON; //Ok to do step function

