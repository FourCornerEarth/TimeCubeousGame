//Control the game menu items

switch(cursorPos) {

    // If Inventory, draw inventory to screen
    case 0: 
    {
        scr_createNewMenuModule(obj_inventoryMenu, true);
        break;
    }

    // Otherwise, exit.
    case 1: game_end(); break;
    default: break;

}
