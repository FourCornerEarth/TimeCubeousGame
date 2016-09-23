/// Used to notify persistent objects
// state_notifyPersistent(stateMachine, state)
show_debug_message("NOTIFYING BATTLE PERSISTENTS.");
   var currentStateMachine = argument0;
   var nextState = argument1;
   show_debug_message("Before notifying, state machine is: " + string(currentStateMachine));
   for (var i = 0; i < array_length_1d(currentStateMachine); i++) {
         currentStateMachine[i] = STATE_STATUS.OFF;
   }
   // Turn correct one on.
   currentStateMachine[nextState] = STATE_STATUS.ON;
   show_debug_message("After notifying, state machine is: " + string(currentStateMachine));
   return currentStateMachine;
