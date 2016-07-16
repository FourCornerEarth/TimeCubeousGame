//textbox_loadbysearch(fname, searchtag)
//loads variables vital to the textbox's functions

//file name, searchtag, the file and a check
var temp_fname, temp_searchtag, file, checkfinished;

temp_fname=argument0; //file name
temp_searchtag=argument1; //search tag, how we will find the thing
checkfinished = 0;

current_text=0; //the current textbox that is being drawn
current_chr=0; //the current character for the "typewriting" effect
current_line=0; //the line of text that is currently being drawn
//runs this for the amount of lines the textbox has
for (i=0; i<textbox_maxlines; i+=1)
{
  line_text[i]=""; //what text is being drawn to the specified line
  line_chr[i]=0; //how many characters are in the specified line of text
}
//runs this for the amount of colors
for (i=0; i<textbox_maxcolors; i+=1)
{
  current_color_chr_start[i]=0; //what character the colored text starts at
  current_color_chr_end[i]=0; //what character the colored text ends at
}
//setting defaults

current_colors=0; //the current amount of colors used
//current_cutins=0; Relocated to alarm[0] event for the ability to keep cutins after a question is answered
waiting_time=1;  //the amount of steps passed; used for altering text speed
text_draw_speed=1; //1 = Normal, 3 = Slow, 8 = Slower
text_voice=2; //0 = Null, 1 = Low, 2 = Med, 3 = High, 4 = Thought
pause_time_waited=0; //the amount of steps passed while waiting for a pause to finish
pause_time_to=0; //the amount of steps needed to wait for a pause to finish
drawing_color=0; //if the text being drawn is a color other than the default

//this run per amount of colors on the textbox
for (i=0; i<textbox_maxcolors; i+=1)
{
  color_id[i]=0; //so the text color changer knows which part of the text is which color
  color_x[i]=0; //positioning of the colored text
  color_y[i]=0; //same as above
  color_text[i]=""; //what the colored text contains
  color_text_line[i]=0; //which line of text the colored text is on
}
question_amount=0; //the total number of questions

text_queue=ds_queue_create(); //queue for loading into the array
file=file_text_open_read(temp_fname); //the file name

//NEW: search engine
//previous code below
/*repeat(temp_pointer)
{
  file_text_readln(file);
}*/
//now new code
//adding searchtag in full to not be confused with any text that might contain the
//variable
temp_searchtag = "[SE:" + temp_searchtag;
//checks for the searchtext
while(!checkfinished)
{
    //puts it as temporary text to run a check
    //here we insert the current line on the string
    var testcheck =file_text_read_string(file);
    //if it matches the search at least once
    if (string_count(temp_searchtag,testcheck)>0)
    {
    //we have found our text
      checkfinished = 1;
    } else if (file_text_eof(file)) {
        show_error("Name not found", 1); exit;
    } else{
    //reads next line of file
    file_text_readln(file);
    }
}

loop_end=0;

//while the end of the loop is false
while (!loop_end)
{
   //read the file line 
   //due to a bug i am still testing it will not pick up a line
   //if it has been read already, so we will perform a check if it's the first time 
   //the while loops to compensate
   //this is unacceptable as final code unless we find no other way
   if (checkfinished)
   {
        temp_text=testcheck;
        checkfinished = 0;
   }else{
        temp_text=file_text_read_string(file);
  }
  //puts it on the queue
  ds_queue_enqueue(text_queue,temp_text);
  //reds next line
  file_text_readln(file);
  //checks for the end of the reading or the end of the file
  if (string_count("[E:0]",temp_text)>0 || file_text_eof(file))
  {
    loop_end=1;
  }
}
//closes the file
file_text_close(file);


total_boxes=ds_queue_size(text_queue)-1; //for checking array sizes
for (i=0; i<total_boxes+1; i+=1) //inits the input text array for bug prevention
{
  input_text[i]=ds_queue_dequeue(text_queue); //inserts the input text from the queue
}
ds_queue_destroy(text_queue); //free the data structure

//creates structures
cmd_data_queue=ds_queue_create();
cmd_pos_queue=ds_queue_create();

//inserts edited text from the input text that has been modified
for (i=0; i<total_boxes+1; i+=1)
{
  edited_text[i]=textbox_cmd_delete(input_text[i]);
}
textbox_cmd_load(input_text[current_text]); //parses the current text line for commands, then loads these into the respective queues
next_cmd_pos=ds_queue_head(cmd_pos_queue);
output_text=string_copy(edited_text[current_text],1,current_chr); //sets the final text to be outputted
