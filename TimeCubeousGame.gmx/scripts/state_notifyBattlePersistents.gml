/// Used to notify battle persistents
// state_notifyBattlePersistents(stateMachine, state to set correct)
show_debug_message("NOTIFYING BATTLE PERSISTENTS.");
   show_debug_message("Before notifying, state machine is: " + string(argument0));
   for (var i = 0; i < array_length_1d(argument0); i++) {
         argument0[i] = 0;
   }
   // Turn correct one on.
   argument0[argument1] = 1;
   show_debug_message("After notifying, state machine is: " + string(argument0));
   return argument0;
