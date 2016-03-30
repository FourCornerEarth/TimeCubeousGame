/// Pick the enemies for this battle.
// scr_selectEnemies(isBossBattle);
// if number is 0, then this is not a boss battle.
// if 1, then it is a boss battle.

// This will do some cool voodoo magic with the location at
// some point to pick the enemies here.

// Will eventually be set from elsewhere.

show_debug_message("SELECTING ENEMIES.");
if (isBossBattle) {
   maxEnemies = 1;
   ableToRun = 0;
   //some script here to select the next available boss
   return 0;
}

maxEnemies = 1; // set for now

for (var i = 0; i < maxEnemies; i++) {
    enemies[i] = obj_birdBlob;
    enemyIDs[i] = instance_create(400, 125, enemies[i]);
    // what will go here instead of an obj is a script to build a list of enemies
    // based on location.
}


// To find the max speeded char to avoid the MC from running.
maxSpd = 0;
for (var i = 0; i < array_length_1d(enemies); i++) {
    if (enemies[i].spd > maxSpd) {maxSpd = enemies[i].spd;}
}
show_debug_message("DETERMINING MAX SPEED: " + string(maxSpd));


leadEnemy = enemies[0];
leadEnemyID = enemyIDs[0];
show_debug_message("DETERMINING LEAD ENEMY: " + object_get_name(leadEnemy));


//This will make an array storing the names of the options for enemy battles.
battle_getEnemyBattleOps();
