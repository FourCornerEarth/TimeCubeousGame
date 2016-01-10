//textbox_cmd_delete(str)
//deletes textbox commands and returns the edited string
var temp_text, start_pos, end_pos;

temp_text=argument0;
start_pos=0; //the start position of a text to delete
end_pos=0; // the amount of characters to delete

while(string_pos("[",temp_text)>0)
{
  start_pos=string_pos("[",temp_text);
  end_pos=(string_pos("]",temp_text)-start_pos)+1; //if you don't add one, it won't delete the final bracket
  temp_text=string_delete(temp_text,start_pos,end_pos);
}

return (temp_text);
