//Control the game menu items

switch(cursorPos) {

    // If Inventory, draw inventory to screen
    case 0: 
    {
        global.inventoryGUI_ON = 1;
        instance_create(0, 0, obj_inventoryGUI);
        break;
    }
    
    case 1: 
    {
        //draw status
        //draw_sprite(spr_menuItem, 0, 226, 16);
        break;
    }
    
    case 2:
    {
        //save game
        break;
    }

    // Otherwise, exit.
    case 3: game_end(); break;
    default: break;

}
