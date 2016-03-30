/// Turn the object's step function on and off

if (!global.state[objStateID] && state_stepFuncOK(global.state)) {
   global.state[objStateID] = 1;
}

else {global.state[objStateID] = 0;}
