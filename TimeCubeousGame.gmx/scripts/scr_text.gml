/// Pull up a text box
// Final method call should look like scr_text("text", speed, x, y);
// Note that the argument names are argument0, argument1, argument2, argument3.

// Final call
// scr_text("text", textbox_img, textbox_img_index, speed, x, y);

// txt is assigned the ID of the instance created here.
txt = instance_create(argument2, argument3, obj_text);

with (txt) { //with the text object we just made, let's do stuff
     padding = 16;
     maxlength = view_wview[0]; // max length text can be before scrolling
     text = argument0;
     spd = argument1;
     font = fnt_codercrux;
     
     text_length = string_length(text);
     font_size = font_get_size(font);
     
     draw_set_font(font);
     
     text_width = string_width_ext(text, font_size+(font_size/2), maxlength);
     text_height = string_height_ext(text, font_size+(font_size/2), maxlength);
     
     box_width = text_width + (padding*2);
     box_height = text_height + (padding*2);
     
     
}
