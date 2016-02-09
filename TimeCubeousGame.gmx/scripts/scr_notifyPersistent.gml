/// scr_notifyPersistent()

// I'll leave this function here.
// The idea for this function is that it will be used in the case of an event
// that needs to immediately override anything the player wants to do.
// Thus, it will turn itself on and immediately shut off any other states.

// Should not be needed in toggle-able objects like inventory.

global.state[objStateID] = 1;
for (var i = 0; i < array_length_1d(global.state); i++) {

    if(i != objStateID && global.state[i]) {
         global.state[i] = 0;
    }
}
