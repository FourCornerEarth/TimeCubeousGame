/// Make any object into an enemy.

enemyState = 0; 
//0 for idle, positive numbers for attacks, negative numbers for hurt/dying animations
HP = 50; //default HP for now
synchLVL = 0; //0 if neutral, negative if sick, positive if synch level rising.

numOfAttacks = 1; //minNumOfAttacks
maxSynch = 0; //user can set these if necessary.
minSynch = 0; //user can set if necessary.
atkStrength = 1;
baseDMG = atkStrength*(synchLVL+1); //Absolute basic damage done.
