///menu_makeCountingMenuFromObj();

// For objects that have counting menus.

  temp = ds_list_create();
  menu = ds_list_create();
  ds_list_add(menu, "DUMMY");
  ds_list_copy(temp, menuObj);
  var p = 1;
    for (var i = 1; i < ds_list_size(temp); i++) {
        var item = temp[| i];
        var iName = temp[| i].name;
        var ind = ds_list_find_index(menu, iName);
        if (ind > -1) {
           count[ind]++;
        }
        else {
         itemList[p] = item; // Store the item ID so we can access it for the remove function
         ds_list_add(menu, iName);
         count[p++] = 1;
        }
    }
  ds_list_add(menu, "Back");

  ds_list_clear(temp);
  ds_list_destroy(temp);

