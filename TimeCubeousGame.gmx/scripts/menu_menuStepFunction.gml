/// Insert in a menu step function.

childMenus_ON = scr_isChildMenu_ON();

if (state_stepFuncOK(global.state) && menu_ON && !childMenus_ON)
{
    var move = 0;

// Move down
   move -= max(keyboard_check_pressed(MENU_KEY_UP_1), keyboard_check_pressed(MENU_KEY_UP_2), 0);

// Move up
   move += max(keyboard_check_pressed(MENU_KEY_DOWN_1), keyboard_check_pressed(MENU_KEY_DOWN_2), 0);

// move = 0 means that right now, we don't want to move.

// Otherwise, change the cursor position, in a circular direction.
   if (move != 0) {
      cursorPos += move;
      scr_menuMovement();
   }

// Check for the selection key push.

    var select;
    select = max(keyboard_check_released(MENU_CONFIRM_1), keyboard_check_released(MENU_CONFIRM_2), 0);

    if (select == 1) { 
       lastCursorPos = cursorPos;   
       script_execute(scriptToRun, argsToPass); 
    }

}

else { cursorPos = lastCursorPos; }

if (keyboard_check_released(MENU_BACK) || keyboard_check_released(MENU_EXIT)) {
   menu_menuDestroy();
}
