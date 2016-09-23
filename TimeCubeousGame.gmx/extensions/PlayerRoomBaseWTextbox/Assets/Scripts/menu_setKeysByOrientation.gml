/// Pass new orientation and change to a certain set of default keys.

if (argument0 == 1) {
// If left right orientation
   MENU_KEY_UP_1 = vk_left;
   MENU_KEY_UP_2 = ord("A");
   MENU_KEY_DOWN_1 = vk_right;
   MENU_KEY_DOWN_2 = ord("D");
   MENU_BACK = vk_up;  
   
}

else {
// If up down orientation
   MENU_KEY_UP_1 = vk_up;
   MENU_KEY_UP_2 = ord("W");
   MENU_KEY_DOWN_1 = vk_down;
   MENU_KEY_DOWN_2 = ord("S");
   MENU_BACK = vk_left;
  
}
