/// Remove an item from the inventory.
// scr_remove_item(itemName)
// itemName is a string.

// Search for the item by name. If they match, delete it from list,
// then destroy object instance.
for (var i = 0; i < ds_list_size(global.inventory); i++) {
    var check = global.inventory[| i];
    if (check.name == argument0) {
       ds_list_delete(global.inventory, i);
       with(check) {
            instance_destroy();
       }
       break;
    }
}
