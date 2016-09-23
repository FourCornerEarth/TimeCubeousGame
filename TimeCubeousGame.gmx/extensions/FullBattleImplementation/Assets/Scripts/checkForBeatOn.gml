/// Was the beat on?

//show_debug_message("CHECK FOR BEAT ON ACTIVATED.");

// If we "hit", moving is okay.
/*if(rt_system_hasrank() && rt_system_getrank() == global.hit) {
       //show_debug_message("TRIGGER APPROVED.");
       //show_debug_message("CHKBEATON: MOVEOK = 1.");
       global.combo++;
       global.moveOK = 1;
       exit;
}
else */if (argument0 == global.hit) {
       //show_debug_message("TRIGGER APPROVED.");
       //show_debug_message("CHKBEATON: MOVEOK = 1.");
       global.moveOK = 1;
       global.combo++;
       exit;
}

else {
global.isMiss = 20;
//show_debug_message("MISSED!");
if (global.combo > global.maxCombo) {
   global.maxCombo = global.combo;
}
global.combo = 0;
}

// Moving will not become un-ok until after we've done the moving.
