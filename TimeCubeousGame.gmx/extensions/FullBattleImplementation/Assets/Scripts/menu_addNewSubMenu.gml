/// menu_addNewSubMenu([string name]|[object name]|[object instance ID], isCountingMenu)
// In the case that the new menu is handled by a singleton object, use the object name.
// If there is no object, use a string representation, remember to handle the string.
// If the object is not a singleton, use the instance ID.
// MUST return the menu this will deal with.'
// Called by main

if (object_exists(argument0)) {
   if (instance_exists(argument0)) {
      if (argument1) {
         with(argument0) { //call up menu for something that needs count
            menu_makeCountingMenuFromObj();
         }
         temp_menu = argument0.menu;
         count = argument0.count;
         itemList = argument0.itemList;
      }
      else {
         with(argument0) { //call up menu
            menu_makeMenuFromObj();
         }
            menu = argument0.menu;
      
      }
   }
   else { show_debug_message(
        "Instance of " + object_get_name(argument0) + " doesn't exist.");}
}

else {
     show_debug_message(
        "Named object " + string(argument0) + " is not a valid game object.");
}
