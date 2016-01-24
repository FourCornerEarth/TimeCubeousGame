/// Add an item to the inventory: scr_add_item(itemName)
// itemName should be a string

var currentItem;
// Create the object
if (argument0 == "healItem") {
   currentItem = instance_create(0, 0, obj_healItem);
}

else if (argument0 == "defItem") {
     currentItem = instance_create(0, 0, obj_defItem);
}

else if (argument0 == "atkItem") {
     currentItem = instance_create(0, 0, obj_atkItem);
}

else {
     currentItem = instance_create(0, 0, obj_eventItem);
}


ds_list_add(global.inventory, currentItem);
