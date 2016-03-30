/// Destroy the menu item running this instance.

if (menu_ON && !childMenus_ON) {
   menu_ON = 0;
   if (!is_string(parent)) {
         parent.numChildren--;
         parent.childMenus[index] = "NONE";
         with(id) {
                  instance_destroy();
         }
   }
   else {
        state_toggleStepFunc();
        cursorPos = 0;
   }
}

