    
if (MENU_ORIENTATION.MO_RIGHT) {  
    ITERATE_UP = vk_up;
    ITERATE_DOWN = vk_down;
    ITERATE_LEFT = vk_left;
    ITERATE_RIGHT = vk_right;
    BACK = ord("C");
    ENTER = vk_enter;
}

else if (MENU_ORIENTATION.MO_LEFT) {  
    ITERATE_UP = ord("W");
    ITERATE_DOWN = ord("S");
    ITERATE_LEFT = ord("A");
    ITERATE_RIGHT = ord("D");
    BACK = ord("C");
    ENTER = vk_shift;
}
