// Call this function as scr_inventoryOptions(obj)
// where obj is the ID of an instance of any sort of item object

// For while we scroll up and down the inventory selections



// CursorPos holds the number of the selection the user makes
switch(cursorPos) {

    case 0: 
    {
        //The Info option, after you select an item
        show_debug_message("INFO CHOSEN.");
        break;
    }
    
    case 1: 
    {
        // The Drop option for your selected item
        show_debug_message("DROP ITEM CHOSEN.");
        // Find the item in question and delete from the global list
        var i = ds_list_find_index(global.inventory, argument0);
        ds_list_delete(global.inventory, i);
        
        // Set the item menu selection off.
        menu_ON = 0;

        // Delete the inventory options GUI and the inventory GUI entirely
        with(menu_inventoryOptions) {
             instance_destroy(); 
        }
        with(menu_inventoryMenu) {
            parent.childMenus[index] = "NONE";
            ds_list_destroy(menu);
            instance_destroy();
        }
        
        // Recreate the inventory GUI so it redraws the new list reactively.
        with (menu_baseMenu) {
             menu_makeNewModule(menu_inventoryMenu, true);
        }
        
        break;
    }
    
    default: break;

}
