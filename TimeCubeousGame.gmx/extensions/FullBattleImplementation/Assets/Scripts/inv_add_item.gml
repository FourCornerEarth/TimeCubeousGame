/// Add an item to the inventory: inv_add_item(itemName)
// itemName should be a string

var currentItem;
// Create the object
if (argument0 == "healItem") {
   currentItem = instance_create(0, 0, inv_healItem);
}

else if (argument0 == "defItem") {
     currentItem = instance_create(0, 0, inv_defItem);
}

else if (argument0 == "atkItem") {
     currentItem = instance_create(0, 0, inv_atkItem);
}

else {
     currentItem = instance_create(0, 0, inv_eventItem);
}

// add object to the inventory
ds_list_add(inv_inventory.inventory, currentItem);
