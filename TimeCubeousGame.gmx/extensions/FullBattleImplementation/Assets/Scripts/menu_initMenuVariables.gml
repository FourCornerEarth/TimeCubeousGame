///menu_customizeMenu()

/* Customize the menu variables here. */

enum MENU_ORIENTATION {
     MO_RIGHT,
     MO_LEFT
}

enum MENU_DIRECTION {
   MD_UP_DOWN,
   MD_LEFT_RIGHT,
   MD_GRID
}

enum MENU_STRUCTURE {
     MENU_IS_NOT_ARRAY,
     MENU_IS_ARRAY
}

HAS_SPRITE = 0;
HAS_POINTER = 0;

/* Customization needed for all menus */
MENU_FONT = 0;
MENU_COLOR = 0;

/* More specific variables if you have sprites and pointers. */
POINTER_SIZE = 0;
POINTER_OFFSET_V = 0;
POINTER_OFFSET_H = 0;
SPRITE_OFFSET = 0;
BORDER_OFFSET_V = 0;
BORDER_OFFSET_H = 0;
ITEM_SPACE_V = 0;
ITEM_SPACE_H = 0;

ITERATE_UP = vk_up
ITERATE_DOWN = vk_down
ITERATE_LEFT = vk_left
ITERATE_RIGHT = vk_right
