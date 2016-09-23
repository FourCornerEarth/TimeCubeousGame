/// Add an item to the inventory: inv_add_item(itemName)
// itemName should be a string

var currentItem;
currentItem = instance_create(0, 0, argument0);

// add object to the inventory
ds_list_add(inv_inventory.inventory, currentItem);
