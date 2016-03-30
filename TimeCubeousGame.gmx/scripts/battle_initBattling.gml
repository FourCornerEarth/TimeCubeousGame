/// Initialize basic info for battling.
show_debug_message("INITIALIZING THE BATTLE.");

globalvar btlState;
show_debug_message("INITIALIZING BATTLE STATE HANDLER.");

/* Battle States */
/*
   0 = player turn
   1 = updating
   2 = enemy turn
   3 = battle ending
*/

for (var i = 0; i < 4; i++) {
    global.btlState[i] = 0;
}

show_debug_message("CREATING BATTLE REGISTRY DS LIST.");
global.btlReg = ds_list_create();


globalvar playerTurnState;
show_debug_message("INITIALIZING PLAYER TURN STATE HANDLER.");

/* Player Turn States */
/*
  0 = idling text, idling enemies, base menu
  1 = fight
  2 = synch
  3 = interact
  4 = item
  5 = cure/mercy
  6 = event running
  7 = turn over
  8 = itemOps
*/

for (var i = 0; i < 9; i++) {
    global.playerTurnState[i] = 0;
}

show_debug_message("CREATING PLAYER TURN REGISTRY DS LIST.");
global.playerTurnReg = ds_list_create();

// Should be a read in of the starting battle state.
startingBattleState = 0;


globalvar enmyTurnState;
show_debug_message("INITIALIZING ENEMY TURN STATE HANDLER.");

/* Enemy Turn States */
/*
   0 = running event
   1 = loading assets and preparing attacks
   2 = attacking
   3 = turn over
   
*/

for (var i = 0; i < 4; i++) {
    global.enmyTurnState[i] = 0;
}

//show_debug_message("CREATING BATTLE REGISTRY DS LIST.");
//global.btlReg = ds_list_create();

ableToRun = 1;
if(ableToRun) { show_debug_message("ABLE TO RUN FROM THIS BATTLE."); }
else { show_debug_message("NOT ABLE TO RUN FROM THIS BATTLE."); }

// battleEndVal = 1 if you healed all the enemies, -1 if you killed them,
// 0 if it was a mix, and "RAN" if you ran.
battleOver = 0;
battleEndVal = 0;
