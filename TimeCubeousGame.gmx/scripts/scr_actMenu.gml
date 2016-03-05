/// Control the action menu.

switch(cursorPos) {
    case 0: 
    {
        turnIsRunning = 1;
        //Run a script to control the info.
        scr_battleMenuDestroy(0);
        obj_battle.currentBattleState = -1;
        break;
    }

    // If Inventory, draw inventory to screen
    case 1: 
    {
        turnIsRunning = 1;
        //Run a script to control the chatting
        scr_battleMenuDestroy(0);
        obj_battle.currentBattleState = -1;
        break;
    }

    // Otherwise, exit.
    case 2: {

        turnIsRunning = 1;
        //Run a script to control the pecking.
        scr_battleMenuDestroy(0);
        obj_battle.currentBattleState = -1;
        break;
    }
    
    case 3: {
         // Will have the items for battle menu here.
         //scr_createNewMenuModule(obj_battleItemMenu);
         break;
    }
    default: break;


}
