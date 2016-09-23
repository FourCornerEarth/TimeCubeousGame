//textbox_var_set(pointer,val)

//sets the value of the variable under the specified pointer
var pointer, new_val;

//sets the variables
pointer=argument0;
new_val=argument1;

//checks where the pointer is, sets variable
switch(pointer)
{
  case "test_level": test_level=real(new_val); break;
  default: return (0);
}

return (1);
