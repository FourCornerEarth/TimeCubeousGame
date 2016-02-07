//textbox_var_get(pointer)
//gets the value of the variable under the specified pointer 
//and returns the value as a string
var pointer;

pointer = argument0;

switch(pointer)
{
  case "name": return (string(global.name)); break;
  default: return ("!ERROR!");
}
