/// Destroy the menu item running this instance.

if (menu_ON && !childMenus_ON) { // && !global.textbox_ON
   menu_ON = 0;
   if (!is_string(parent)) {
         parent.numChildren--;
         parent.childMenus[index] = "NONE";
   }
   else {
        menu_baseMenu.is_menuModule_ON[--menu_baseMenu.numModules] = 0;
   }
   with(id) {
          instance_destroy();
   }
}

