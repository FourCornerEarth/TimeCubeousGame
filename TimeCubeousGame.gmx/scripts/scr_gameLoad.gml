/// Load from an ini file.

// Load Player Info
ini_open("game_settings.ini"); 
global.name = ini_read_string("PlayerInfo", "Name", "");
global.savedGame_EXISTS = ini_read_real("Settings", "Saved", 0);
global.HP = ini_read_real("PlayerInfo", "HP", 20);
global.MP = ini_read_real("PlayerInfo", "MP", 5); 
global.atk = ini_read_real("PlayerInfo", "Atk", 10);
global.def = ini_read_real("PlayerInfo", "Def", 5); 
global.syncBonus = ini_read_real("PlayerInfo", "syncBonus", 2);
global.equippedWeapon = ini_read_string("PlayerInfo", "equippedWeapon", "Nothing"); 
global.equippedArmor = ini_read_string("PlayerInfo", "equippedArmor", "Nothing");

// Player location
global.player_x = ini_read_real("PlayerPosition", "X", 450);
global.player_y = ini_read_real("PlayerPosition", "Y", 375);

ini_close();
