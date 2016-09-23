/// Initialize a menu module.

/** ONLY CHANGE THESE VARS IF YOU KNOW WHAT YOU ARE DOING! **/
show_debug_message("Entered menu_startNewModule function, starting: " + object_get_name(object_index));
// Change this to store the number of children in this object.
numChildren = 0;

// Store all the instances of children for this object.
childMenus[0] = "NONE";

// Menu will start as off. Turn on when you create child.
menu_ON = 0;

// Declare the index within the move array where the cursor should be.
cursorPos = 0;

lastCursorPos = 0;

// Menu is array by default. If 0, menu is assumed to be ds_list.
menu_IsArray = 1;

// Set to off.
childMenus_ON = 0;

// The script should be overwritten by the child create event.
scriptToRun = "";

// Declare names of args to pass to script. Default = 0 means none.
argsToPass = 0;

// The menu for this module. Overwrite by child create event.
//menu[0] = "";

// Declare the amount of vertical space between menu items.
space = 50;

//Declare this objStateID to be main menu's.
objStateID = 1;

// Now start the new module to declare the keys used here.
menu_setMenuOptions();

