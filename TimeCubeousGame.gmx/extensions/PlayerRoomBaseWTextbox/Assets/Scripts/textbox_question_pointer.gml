/* Use this to allow you to change textboxes dynamically by giving a pointer. */


//textbox_question_pointer(pointer)
//gets the textbox specified by the pointer
var pointer, temp_fname, temp_text_pointer;
//temp_text_pointer is how many lines to skip


pointer = argument0;

//depending on the answer, it will change where the textbox goes next, even the text file
switch(pointer)
{
  case 1: temp_fname="11cutin_test"; temp_text_pointer=0; break;
  case 2: temp_fname="12variable_test"; temp_text_pointer=0; break;
  case 3: temp_fname="13textfilemerging_test"; temp_text_pointer=2; break;
  case 4: temp_fname="13textfilemerging_test"; temp_text_pointer=6; break;
  default: return (0);
}

//adds .txt to the extension
temp_fname+=TEXT_FILE_EXTENSION;

//uses loadbox to load up the text
//might have to retire this
textbox_loadbox(temp_fname, temp_text_pointer);

return (1);
