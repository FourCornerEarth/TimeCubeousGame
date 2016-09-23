/// Initialize basic info for battling.
show_debug_message("INITIALIZING THE BATTLE.");


show_debug_message("INITIALIZING BATTLE STATE HANDLER.");


for (var i = 0; i < 4; i++) {
    global.btlState[i] = 0;
}

show_debug_message("CREATING BATTLE REGISTRY DS LIST.");
global.btlReg = ds_list_create();



show_debug_message("INITIALIZING PLAYER TURN STATE HANDLER.");


for (var i = 0; i < 6; i++) {
    global.playerTurnState[i] = 0;
}

show_debug_message("CREATING PLAYER TURN REGISTRY DS LIST.");
global.playerTurnReg = ds_list_create();

// Should be a read in of the starting battle state.
startingBattleState = 0;



show_debug_message("INITIALIZING ENEMY TURN STATE HANDLER.");


for (var i = 0; i < 4; i++) {
    global.enmyTurnState[i] = 0;
}

show_debug_message("CREATING ENEMY TURN REGISTRY DS LIST.");
global.enmyTurnReg = ds_list_create();

//show_debug_message("CREATING BATTLE REGISTRY DS LIST.");
//global.btlReg = ds_list_create();

ableToRun = 1;
if(ableToRun) { show_debug_message("ABLE TO RUN FROM THIS BATTLE."); }
else { show_debug_message("NOT ABLE TO RUN FROM THIS BATTLE."); }

// battleEndVal = 1 if you healed all the enemies, -1 if you killed them,
// 0 if it was a mix, and "RAN" if you ran.
battleOver = 0;
battleEndVal = 0;


