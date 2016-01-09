//textbox_var_get(pointer)
//gets the value of the variable under the specified pointer and returns the value as a string
var pointer;

pointer=argument0;

switch(pointer)
{
  case "test_level": return (string(test_level)); break;
  default: return ("!ERROR!");
}
