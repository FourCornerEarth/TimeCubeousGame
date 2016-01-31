/// scr_createNewMenuModule(nameOfModule, isComingFromMain)

// Called by the parent object when they create the new module.
/* NOT TO BE CONFUSED WITH STARTNEWMODULE WHICH IS RUN BY THE CHILD MODULE */


// nameOfModule is the name of the module to create
// isComingFromMain is a bool saying whether this is coming from the base menu or not

// Make the child object
o = instance_create(0, 0, argument0);

// If coming from main, child object's parent = "NONE"
if (argument1) { 
   o.parent = "NONE";
   is_menuModule_ON[numModules++] = 1;
   o.index = numModules;

}

// if coming from another module, parent = this module
// increment necessary variables
else {
     o.parent = id;
     o.index = numChildren++;
     childMenus[o.index] = o.id;
}
