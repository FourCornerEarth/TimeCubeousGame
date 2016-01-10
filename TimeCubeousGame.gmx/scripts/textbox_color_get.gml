//textbox_color_get(color)
//gets the color output by the text commands and returns the actual color value
var temp_color;

temp_color=argument0;

switch(temp_color)
{
  case CMD_TEXTCOLOR_BLACK: return ($000000); break;
  case CMD_TEXTCOLOR_RED: return ($0000ff); break;
  case CMD_TEXTCOLOR_GREEN: return ($00ff00); break;
  case CMD_TEXTCOLOR_BLUE: return ($ff0000); break;
  case CMD_TEXTCOLOR_GRAY: return ($7f7f7f); break;
  default: return ($ffffff); //defaults to white if the color is not known
}
