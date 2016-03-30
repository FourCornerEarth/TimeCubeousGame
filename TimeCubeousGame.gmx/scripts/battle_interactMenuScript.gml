/// Controls where each option in the main battle menu goes.

switch(cursorPos) {
    case 0: 
    {
        // Option 1
        show_debug_message("INTERACT MENU CALLED OPTION 1.");
        battle_setNextState(battle_playerTurn, 6);
        battle_playerTurn.turnRunning = 1;
        o = instance_create(0, 0, battle_drawBattleText);
        o.txt = "Oh uh. I DON'T TALK TO STRANGERS!!!!";
        battle_menuDestroy();
        break;
    }
    case 1: 
    {
        // Option 2
        show_debug_message("INTERACT MENU CALLED OPTION 2.");
        battle_setNextState(battle_playerTurn, 6);
        battle_playerTurn.turnRunning = 1;
        o = instance_create(0, 0, battle_drawBattleText);
        o.txt = "WOW! How f**king RUDE!!!!!!";
        battle_menuDestroy();
        break;
    }

    case 2: {
        show_debug_message("INTERACT MENU CALLED BACK.");
        battle_setNextState(battle_playerTurn, 0);
        //battle_playerTurn.stateHasChanged = 1;
        battle_menuDestroy();
        break;
    }
    
    case 3: {
        show_debug_message("INTERACT MENU CALLED RUN.");
        // REMEMBER TO IMPLEMENT A STATE CHANGE HERE.
        scr_tryToRun();
        break;
    }
    
    default: break;

}
