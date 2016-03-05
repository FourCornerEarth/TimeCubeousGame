/// scr_battleMenuDestroy(returnBattleState)
// if this menu returns control to the base battle menu
// rather than another menu module, returnBattleState = 1, else 0.

if (argument0) {
   if (menu_ON && !childMenus_ON) {
      menu_ON = 0;
      if (!is_string(parent)) {
         parent.numChildren--;
         parent.childMenus[index] = "NONE";
      }
      else {
              menu_battleMenu.is_menuModule_ON[--menu_battleMenu.numModules] = 0;
      }
      with(id) {
          instance_destroy();
      }
   }
}
else {
    if (menu_ON && !childMenus_ON) {
      menu_ON = 0;
      if (!is_string(parent)) {
         parent.numChildren--;
         parent.childMenus[index] = "NONE";
      }
      else {
              menu_battleMenu.is_menuModule_ON[--menu_battleMenu.numModules] = 0;
      }
      with(id) {
          instance_destroy();
      }
   }
   obj_battle.currentBattleState = 0;
}
