  /// menu_makeNewModule (name, parent)
// Called by the parent object when they create the new module.
/* NOT TO BE CONFUSED WITH STARTNEWMODULE WHICH IS RUN BY THE CHILD MODULE */

/* name is the name of the module to create
  parent --> 0 if no parent, 1 if parent. */


// Makes the child object.

o = instance_create(0, 0, argument0);
show_debug_message("Entered menu_makeNewModule function, making a: " + object_get_name(argument0.object_index));

// If no parent, declare no parent.
if (!argument1) { 
   o.parent = "NONE";
}
// Otherwise declare one.
else {
     o.parent = id;
     
}

// Increment the number of children in the parent object, set current to child's index
 o.index = numChildren++;
// Set this new child's index into the parent's childMenu's array, with that id.
 childMenus[o.index] = o.id;
