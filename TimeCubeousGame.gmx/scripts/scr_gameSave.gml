// Save game values.

// Player stats
ini_open("game_settings.ini"); //ini_open(string) where string is the file name (must be *.ini) 
ini_write_string("PlayerInfo", "Name", global.name); //ini_write_real(section,key,value) 
ini_write_real("Settings", "Saved", 1);
ini_write_real("PlayerInfo", "HP", global.HP); //ini_write_string(section,key,value) 
ini_write_real("PlayerInfo", "MP", global.MP); 
ini_write_real("PlayerInfo", "Atk", global.atk);
ini_write_real("PlayerInfo", "Def", global.def); 
ini_write_real("PlayerInfo", "syncBonus", global.syncBonus);
ini_write_string("PlayerInfo", "equippedWeapon", global.equippedWeapon); //ini_write_real(section,key,value) 
ini_write_string("PlayerInfo", "equippedArmor", global.equippedArmor); //ini_write_real(section,key,value) 


// Player positions
ini_write_real("PlayerPosition", "X", obj_neku.x);
ini_write_real("PlayerPosition", "Y", obj_neku.y);
ini_close(); //Closes the current open ini file. Be sure to do this!
