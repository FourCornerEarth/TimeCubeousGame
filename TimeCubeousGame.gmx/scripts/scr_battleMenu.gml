switch(cursorPos) {

    // Show player status
    case 0: 
    {
        scr_setTurn(1, 1);
        scr_runFightTurn();
        break;
    }

    case 1: 
    {
        scr_setTurn(2, 1);
        scr_runSyncTurn();
        break;
    }

    case 2: {

        scr_setTurn(3, 0);
        menu_makeNewModule(obj_actMenu, true);
        break;
    }
    
    case 3: {
         scr_setTurn(4, 1);
         scr_tryToRun();
         break;
    }
    default: break;

}
