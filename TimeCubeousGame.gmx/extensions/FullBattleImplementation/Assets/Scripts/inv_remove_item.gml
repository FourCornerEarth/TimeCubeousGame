/// Remove an item from the inventory.
// inv_remove_item(item reference)
// itemName is a string.

// Search for the item by name. If they match, delete it from list,
// then destroy object instance.
for (var i = 1; i < ds_list_size(inv_inventory.inventory); i++) {
    var check = inv_inventory.inventory[| i];
    if (check.name == argument0) {
       game_battle.bonus = check.memType;
       ds_list_delete(inv_inventory.inventory, i);
       with(check) {
            instance_destroy();
       }
       break;
    }
}
