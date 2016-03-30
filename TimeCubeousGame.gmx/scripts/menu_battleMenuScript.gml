/// Controls where each option in the main battle menu goes.
switch(cursorPos) {
    case 0: 
    {
        show_debug_message("FIGHT OPTION CHOSEN.");
        battle_setNextState(battle_playerTurn, 6);
        battle_playerTurn.turnRunning = 1;
        o = instance_create(0, 0, battle_drawBattleText);
        o.txt = "You chose the FIGHT option!";
        //battle_playerTurn.stateHasChanged = 1;
        // Start fighting option here.
        break;
    }
    case 1: 
    {
        show_debug_message("SYNCH OPTION CHOSEN.");
        battle_setNextState(battle_playerTurn, 6);        
        battle_playerTurn.turnRunning = 1;
        o = instance_create(0, 0, battle_drawBattleText);
        o.txt = "You chose the SYNCH option";
        //battle_playerTurn.stateHasChanged = 1;
        // Start sync option here.
        break;
    }

    case 2: {
         show_debug_message("CURE OR MERCY.");
        battle_setNextState(battle_playerTurn, 6);        
        battle_playerTurn.turnRunning = 1;
        o = instance_create(0, 0, battle_drawBattleText);
        o.txt = "You chose the CURE option!";
        //battle_playerTurn.stateHasChanged = 1;
        // If available, cure or mercy here.
        break;
    }
    
    case 3: {
        show_debug_message("INTERACT OPTION CHOSEN.");
        menu_makeNewModule(battle_interactMenu, true);
        battle_setNextState(battle_playerTurn, 3);
        //battle_playerTurn.stateHasChanged = 1; 
        break;
    }
    
    case 4: {
        show_debug_message("ITEM OPTION CHOSEN.");
        menu_makeNewModule(battle_itemMenu, true);
        battle_setNextState(battle_playerTurn, 4);
        //battle_playerTurn.stateHasChanged = 1;
        break;
    }
    default: break;

}


