/// Try to run from battle.
// Will prob need to pass some stuff here.

if (!game_battle.ableToRun) {
   //draw_set_color(c_white);
   //draw_text(250, 450, "YOU CANNOT RUN FROM THIS BATTLE!");
   game_battle.currentBattleState = -1;
}


else {
   var canRun = irandom(100);
   if (game_battle.maxSpd > canRun) {
      //draw_set_color(c_white);
      //draw_text(250, 450, "Couldn't escape!");
      game_battle.currentBattleState = -1;
   }
   
   else {
        //draw_set_color(c_white);
        //draw_text(250, 450, "YOU RAN FROM BATTLE!");
        game_battle.battleOver = 1;
        game_battle.battleEndVal = "RAN";
   }

   
}




