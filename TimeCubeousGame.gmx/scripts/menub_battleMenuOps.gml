/// Controls where each option in the main battle menu goes.
show_debug_message("Menupage is " + string(menuPage));
show_debug_message("MenuSelected is " + string(menuSelected));
switch(menuPage) {
    case 0: 

       /*if (menuSelected == 1) {
                show_debug_message("IMPORT OPTION CHOSEN.");
                battle_setNextState(battle_playerTurn, PLAYER_TURN_STATE.EVENT);
                battle_playerTurn.turnRunning = 1;
                o = instance_create(0, 0, battle_drawBattleText);
                o.txt = "Importing code...";
                //battle_setNextState(battle_playerTurn, PLAYER_TURN_STATE.EVENT);
           }*/
       if (menuSelected == 1) {
                show_debug_message("IMPORT OPTION CHOSEN.");
                //battle_setNextState(battle_playerTurn, PLAYER_TURN_STATE.ITEM);
                with (menub_battleMenu) menu[1, 0] = menu_addNewSubMenu(inv_inventory, 1);
                menuPage = 2; menuSelected = 1;
           }
       else if (menuSelected == 2) {  
                show_debug_message("RUN OPTION CHOSEN! EXITING!");
                //add run condition
                battleEndVal = ENDBATTLE_STATUS.RAN;
                battle_setNextState(game_battle, BATTLE_STATE.ENDBATTLE);
           }
    break;
    
    case 2: 
         if (menuSelected == ds_list_size(temp_menu)-1) { menuPage = 0; menuSelected = 1; } // Back
         else {
           battle_setNextState(battle_playerTurn, PLAYER_TURN_STATE.EVENT);
           battle_playerTurn.turnRunning = 1;
           o = instance_create(0, 0, battle_drawBattleText);
           o.txt = "Load Memory: " + string(temp_menu[| menuSelected]); 
           inv_use_memory(temp_menu[| menuSelected]);
           menuPage = 0; 
           menuSelected = 1;
           ds_list_destroy(temp_menu);
         }
    break;
    
    default: break;

}


