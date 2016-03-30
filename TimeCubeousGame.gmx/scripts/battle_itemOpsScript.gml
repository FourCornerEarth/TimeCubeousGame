// Call this function as scr_inventoryOptions(obj)
// where obj is the ID of an instance of any sort of item object

// For while we scroll up and down the inventory selections



// CursorPos holds the number of the selection the user makes
switch(cursorPos) {

    case 0: 
    {
        //The Use Option.
        show_debug_message("ITEM OPS CALLED USE.");
        battle_setNextState(battle_playerTurn, 6);
        battle_playerTurn.turnRunning = 1;
        o = instance_create(0, 0, battle_drawBattleText);
        o.txt = selectedItem.btlUseText;
        // Delete all the stuffs.
        var i = ds_list_find_index(global.inventory, argument0);
        ds_list_delete(global.inventory, i);
        
        // Set the item menu selection off.
        menu_ON = 0;

        // Delete the inventory options GUI and the inventory GUI entirely
        with(battle_itemOps) {
             instance_destroy(); 
        }
        with(battle_itemMenu) {
            parent.childMenus[index] = "NONE";
            ds_list_destroy(menu);
            instance_destroy();
        }

        break;
    }
    
    case 1: 
    {
       show_debug_message("ITEM OPS CALLED BACK.");
    // Return to original menu.
        battle_setNextState(battle_playerTurn, 4);
        battle_menuDestroy();
        break;
    }
    
    default: break;

}
