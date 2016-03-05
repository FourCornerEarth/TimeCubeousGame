/// Try to run from battle.
// Will prob need to pass some stuff here.

if (!obj_battle.ableToRun) {
   draw_set_color(c_white);
   draw_text(250, 450, "YOU CANNOT RUN FROM THIS BATTLE!");
   obj_battle.currentBattleState = -1;
}


else {
   var canRun = irandom(100);
   if (obj_battle.maxSpd > canRun) {
      draw_set_color(c_white);
      draw_text(250, 450, "Couldn't escape!");
      obj_battle.currentBattleState = -1;
   }
   
   else {
        draw_set_color(c_white);
        draw_text(250, 450, "YOU RAN FROM BATTLE!");
        obj_battle.battleOver = 1;
        obj_battle.battleEndVal = "RAN";
   }

   
}




