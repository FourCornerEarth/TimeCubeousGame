/// scr_isChildMenu_ON()

// childMenus[i] holds the id of the child instance
// if it's "NONE", it holds nothing
// otherwise, it's an object


for (var i = 0; i < array_length_1d(childMenus); i++) {
    if (!is_string(childMenus[i]) && childMenus[i].menu_ON) {
       return 1;
    }
}

return 0;
