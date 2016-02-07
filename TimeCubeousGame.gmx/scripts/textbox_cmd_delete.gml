//textbox_cmd_delete(str)
//deletes textbox commands and returns the edited string
var temp_text, start_pos, end_pos;

//this starts the designation of variables. The text to delete, where it starts and how
//many characters are left to delete.
temp_text=argument0;
start_pos=0; //the start position of a text to delete
end_pos=0; // the amount of characters to delete

//this loop goes through the text to delete, so long as it still exists.
while(string_pos("[",temp_text)>0)
{
  //fetches start position of text to delete
  start_pos=string_pos("[",temp_text);
  //fetches final position. The +1 is there so it deletes the last bracket as well
  //as otherwise it will delete up to the bracket instead.
  end_pos=(string_pos("]",temp_text)-start_pos)+1; 
  //deletes the string
  temp_text=string_delete(temp_text,start_pos,end_pos);
}

return (temp_text);
