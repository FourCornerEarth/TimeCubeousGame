//textbox_specialchar_check(char)
//returns true if the specified character is a special character
//and by special character this means a space
//its various purposes include checking if there is a space on the text to
//not play sound when that character shows
var temp_chr;

temp_chr=argument0;

switch(temp_chr)
{
  case " ": return (1); break;
  default: return (0);
}
