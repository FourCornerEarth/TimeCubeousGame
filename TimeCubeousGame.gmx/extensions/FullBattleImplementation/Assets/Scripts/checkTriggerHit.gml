//show_debug_message("PTOK, moveOK: " + string(global.moveOK));
// Set variables for movement.
var mLt = 0;
var mRt = 0;
var mUp = 0;
var mDn = 0;

// Move up
   mUp -= max(keyboard_check_pressed(MENU_KEY_UP_1), keyboard_check_pressed(MENU_KEY_UP_2), 0);
   //show_debug_message("mUp: "+ string(mUp));
// Move left
   mLt -= max(keyboard_check_pressed(MENU_KEY_LEFT_1), keyboard_check_pressed(MENU_KEY_LEFT_2), 0);
   
   
// Move down
   mDn += max(keyboard_check_pressed(MENU_KEY_DOWN_1), keyboard_check_pressed(MENU_KEY_DOWN_2), 0);
// Move rt
   mRt += max(keyboard_check_pressed(MENU_KEY_RIGHT_1), keyboard_check_pressed(MENU_KEY_RIGHT_2), 0);

   if (mUp != 0 || mDn != 0 || mRt != 0 || mLt != 0) {
        rt_return_true();
        ds_queue_enqueue(global.move, (mUp+mDn));
        ds_queue_enqueue(global.move, (mRt+mLt));
        //show_debug_message("TRIGGER ACTIVATED.");
        //rt_return_true();
   }

else {
     //show_debug_message("TRIGGER NOT ACTIVATED.");
    rt_return_false();
}
