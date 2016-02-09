/// Turn the object's step function on and off

if (!global.state[objStateID] && scr_stepFuncOK()) {
   global.state[objStateID] = 1;
}

else {global.state[objStateID] = 0;}
