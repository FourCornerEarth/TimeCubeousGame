/// Check the children for the base menu.

/* Is this run only by the base menu? */

for (var i = 0; i < array_length_1d(is_menuModule_ON); i++) {
    if (is_menuModule_ON[i]) {
       return 1;
    }
}

return 0;
