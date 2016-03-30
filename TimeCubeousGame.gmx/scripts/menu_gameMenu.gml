//Control the base menu items

switch(cursorPos) {

    // Show player status
    case 0: 
    {
        menu_makeNewModule(menu_status, true);
        break;
    }

    // If Inventory, draw inventory to screen
    case 1: 
    {
        menu_makeNewModule(menu_inventoryMenu, true);
        break;
    }

    // Otherwise, exit.
    case 2: game_end(); break;
    default: break;

}
