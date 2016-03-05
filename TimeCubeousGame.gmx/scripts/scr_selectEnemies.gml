/// Pick the enemies for this battle.
// scr_selectEnemies(isBossBattle);
// if number is 0, then this is not a boss battle.
// if 1, then it is a boss battle.

// This will do some cool voodoo magic with the location at
// some point to pick the enemies here.

// Will eventually be set from elsewhere.

if (isBossBattle) {
   maxEnemies = 1;
   ableToRun = 0;
   //some script here to select the next available boss
   return 0;
}

maxEnemies = 1; // set for now
for (var i = 0; i < maxEnemies; i++) {
    enemies[i] = obj_birdBlob;
    instance_create(300, 25, enemies[i]);
    // what will go here instead of an obj is a script to build a list of enemies
    // based on location.
}

// To find the max speeded char to avoid the MC from running.
maxSpd = 0;
for (var i = 0; i < array_length_1d(enemies); i++) {
    if (enemies[i].spd > maxSpd) {maxSpd = enemies[i].spd;}
}
ableToRun = 1;

//This will make an array storing the names of the options for enemy battles.
scr_getEnemyBattleOps();
