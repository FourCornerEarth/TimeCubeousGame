// Get parent ID and name
var p = object_get_parent(object_index);

// If 
//p = object_get_name(p);
if (p == -1) {
   parent = p;
   index = global.numModules;
}
else {
     parent = p; // set parent to the parent's real ID
     index = parent.numChildren++; // tell which index this child is
     parent.childMenus[index] = 0; // set this variable to off, originally.
}
