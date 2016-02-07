//Control the base menu items

switch(cursorPos) {

    // Show player status
    case 0: 
    {
        scr_createNewMenuModule(obj_status, true);
        break;
    }

    // If Inventory, draw inventory to screen
    case 1: 
    {
        scr_createNewMenuModule(obj_inventoryMenu, true);
        break;
    }

    // Otherwise, exit.
    case 2: game_end(); break;
    default: break;

}
