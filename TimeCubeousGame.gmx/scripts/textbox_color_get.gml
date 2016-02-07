//textbox_color_get(color)
//gets the color output by the text commands and returns the actual color value
var temp_color;

temp_color=argument0;

//fetches the color that has been selected
//the hex here are basics, we can change it later at our convinence if we like different greys
//blues, red, and green
//or if we want to add more colors
switch(temp_color)
{
  case CMD_TEXTCOLOR_BLACK: return ($000000); break; //black
  case CMD_TEXTCOLOR_RED: return ($0000ff); break; //red
  case CMD_TEXTCOLOR_GREEN: return ($00ff00); break; //green
  case CMD_TEXTCOLOR_BLUE: return ($ff0000); break; //blue
  case CMD_TEXTCOLOR_GRAY: return ($7f7f7f); break; //grey
  default: return ($ffffff); //defaults to white if the color is not known
}
