//textbox_cmd_load(str)
//returns the position and contents of the current input_text's cmds
//temp_text is our text, start_pos is the starting point
//end_pos is where the string ends
//success is merely a true/false that lets us know if it worked
var temp_text, start_pos, end_pos, success;

//argument0 being the inputted text, success we start as false
//all bools need a variable so they don't throw garbage
temp_text=argument0;
success=0;

//loop will run while it goes through the string
while(string_pos("[",temp_text)>0)
{
  //starting position attained
  start_pos=string_pos("[",temp_text);
  //ending position attained, adding a number to include/delete the final bracket
  end_pos=(string_pos("]",temp_text)-start_pos)+1; 
  //inserts the text into the command queue while removing the brackets
  ds_queue_enqueue(cmd_data_queue,string_copy(temp_text,start_pos+1,end_pos-2)); 
  //removes temporary string
  temp_text=string_delete(temp_text,start_pos,end_pos);
  ds_queue_enqueue(cmd_pos_queue,start_pos-1); 
  //bool is made true to inform user that the entry was successful
  success=1; //so that the script can return a pass
}

return (success);
