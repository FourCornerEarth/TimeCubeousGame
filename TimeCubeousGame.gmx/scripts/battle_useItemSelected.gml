/// Try to use an item selected in battle.
if (cursorPos < ds_list_size(menu)) {
   show_debug_message("ITEM MENU TRYING TO USE ITEM SELECTED.");
   selectedItem = itemList[cursorPos];
   battle_setNextState(battle_playerTurn, 8);
   //battle_playerTurn.stateHasChanged = 1;
   menu_makeNewModule(battle_itemOps, true);
}

else {
     show_debug_message("ITEM MENU CALLED BACK.");
    // Return to original menu.
        battle_setNextState(battle_playerTurn, 0);
        //battle_playerTurn.stateHasChanged = 1;
        battle_menuDestroy();

}
