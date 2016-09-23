///inv_copy_item(itemToCopy)

var p = instance_create(0, 0, obj_food);
p.name = argument0.name;
p.description = argument0.description;
p.bonus = argument0.bonus;
p.cost= argument0.cost;
p.sellP = argument0.sellP;
p.isBtlUsable = argument0.sellP;
p.flagNum = argument0.flagNum;
ds_list_add(inv_inventory.inventory, p);
