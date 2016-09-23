/// Resets global variables upon game restart.

global.HP = 50;
global.sync = 0;
global.bonus = 0;
with(inv_inventory) { instance_destroy(); }
instance_create(0, 0, inv_inventory);


