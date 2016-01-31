/** 
    Variables to set the default keys for use with most menus.
**/

MENU_KEY_LEFT_1 = vk_left;
MENU_KEY_LEFT_2 = ord("A");
MENU_KEY_RIGHT_1 = vk_right;
MENU_KEY_RIGHT_2 = ord("D");
MENU_KEY_UP_1 = vk_up;
MENU_KEY_UP_2 = ord("W");
MENU_KEY_DOWN_1 = vk_down;
MENU_KEY_DOWN_2 = ord("S");
MENU_CONFIRM_1 = vk_enter;
MENU_CONFIRM_2 = ord("Z");
MENU_BACK_LEFT = vk_left;
MENU_BACK = ord("X");
MENU_BACK_UP = vk_up;
MENU_EXIT = ord("C");
MENU_OPEN = ord("C");


/** 
    Variables to declare the default drawGUI for use with most GUIs.   
**/

// Vertical gap between top of first menu and top of subsequent menus to give a "staggered" look.
VGAP = 64;
   
// Gap between sprites of different menus
GAP = 30; 
   
// The sum of the widths of the previous menus. May need to sum previous menu sprites.
WID = sprite_get_width(spr_gameMenu);
  
// Where on the menu sprite you want the pointer to be drawn or the horizontal offset of the pointer/text.
HBORDER = 16;

// Where on the menu sprite you want the height of the text to be, or the vertical offset of pointer/text.
VBORDER = 30;
   
// The size of the pointer so you know where to place the text.
PSIZE = sprite_get_width(spr_pointer);

// The vertical offset so the pointer appears to point in the correct area.
VPOINTEROFFSET = 15;
   
// The horizontal offset so the pointer appears to point in the correct area.
HPOINTEROFFSET = 0;

