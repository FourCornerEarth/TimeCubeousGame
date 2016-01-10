//textbox_cmd_load(str)
//returns the pos and contents of the current input_text's cmds
var temp_text, start_pos, end_pos, success;

temp_text=argument0;
success=0;

while(string_pos("[",temp_text)>0)
{
  start_pos=string_pos("[",temp_text);
  end_pos=(string_pos("]",temp_text)-start_pos)+1; //if you don't add one, it won't delete the final bracket
  ds_queue_enqueue(cmd_data_queue,string_copy(temp_text,start_pos+1,end_pos-2)); //crops out the brackets on both ends and loads into the command queue
  temp_text=string_delete(temp_text,start_pos,end_pos);
  ds_queue_enqueue(cmd_pos_queue,start_pos-1); //loads the command position into the command queue
  success=1; //so that the script can return a pass
}

return (success);
