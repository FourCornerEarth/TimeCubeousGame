switch(menu_IsArray) {

    case 0: {
            
            if (cursorPos < 0) {
               cursorPos = ds_list_size(menu);
            }
            if (cursorPos > ds_list_size(menu)) {
               cursorPos = 0;
            }
            break;
    }
    
    default: 
    {
        
        if (cursorPos < 0) {
              cursorPos = array_length_1d(menu) - 1;
        }
        if (cursorPos >= array_length_1d(menu)) {
              cursorPos = 0;
        }
        break;
    }
    
}
