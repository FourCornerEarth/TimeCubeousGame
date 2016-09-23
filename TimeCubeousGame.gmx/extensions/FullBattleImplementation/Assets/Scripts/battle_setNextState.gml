///battle_setNextState(stateMachineObject, newState);
// for player turns it's battle_playerTurn
// for battling it's obj_battle
argument0.stateHasChanged = 1;
argument0.nextState = argument1;
//show_debug_message(object_get_name(argument0.object_index) + " STATE CHANGE: " + string(argument1));
