//textbox_cmd_execute(command)
//executes the command specified
var i, i2, temp_input, temp_type, temp_udata, temp_data, temp_strwidth, temp_cutin, temp_part;

//Init temp vars
temp_input=argument0; //input
temp_type=""; //contains data on which command is specified
temp_udata=""; //the unprocessed, unseparated arguments
//show_message(temp_input);
for (i=0; i<4; i+=1)
{
  temp_data[i]=""; //arguments for the commands
}

//returns a failure if an innacurate command is given
if (string_count(":",temp_input)==0)
{
  return (0);
}

//gets the command type
i=0;
while (string_char_at(temp_input,i)!=":")
{
  i+=1;
}
temp_type=string_copy(temp_input,1,i-1); //removes case-sensetivity

//gets the unprocessed arguments
i2=0;
while (i+i2<string_length(temp_input))
{
  i2+=1;
}
temp_udata=string_copy(temp_input,i+1,i2+1);

//processes the arguments
i=0;
i2=0;
while (string_count(",",temp_udata)>0) //checks whether there are any more arguments to process
{
  while (string_char_at(temp_udata,i2)!=",") //keep going until we reach the next argument
  {
    i2+=1;
  }
  temp_data[i]=string_copy(temp_udata,1,i2-1); //load the argument
  temp_udata=string_delete(temp_udata,1,i2); //clear the recently loaded argument from the data
  i+=1;
  i2=0;
}
temp_data[i]=temp_udata; //there are no more commas, so this catches the last argument

//Now it's time for actually executing the command!
switch(temp_type)
{
  case CMD_TEXTSPEED:
  {
    switch (temp_data[0])
    {
      case CMD_TEXTSPEED_NORMAL: text_draw_speed=1; break;
      case CMD_TEXTSPEED_SLOW: text_draw_speed=4; break;
      case CMD_TEXTSPEED_SLOWER: text_draw_speed=12; break;
      default: return (0);
    }
    break;
  }
  case CMD_TEXTVOICE:
  {
    switch(temp_data[0])
    {
      case CMD_TEXTVOICE_NULL: text_voice=0; break;
      case CMD_TEXTVOICE_LOW: text_voice=1; break;
      case CMD_TEXTVOICE_MED: text_voice=2; break;
      case CMD_TEXTVOICE_HIGH: text_voice=3; break;
      case CMD_TEXTVOICE_THOUGHT: text_voice=4; break;
      default: return (0);
    }
    break;
  }
  case CMD_TEXTPAUSE:
  {
    pause_time_to=real(temp_data[0]);
    break;
  }
  case CMD_TEXTVARIABLE:
  {
    edited_text[current_text]=string_insert(textbox_var_get(temp_data[0]),edited_text[current_text],current_chr+1); //+1 for proper placing
    break;
  }
  case CMD_TEXTVARIABLESET:
  {
    textbox_var_set(temp_data[0],temp_data[1]);
    break;
  }
  case CMD_TEXTEFFECT:
  {
    switch(temp_data[0])
    {
      case CMD_TEXTEFFECT_SFX: textbox_sfx_play(temp_data[1]); break;
    }
    break;
  }
  case CMD_TEXTCOLOR:
  {
    if (temp_data[0]==CMD_TEXTCOLOR_CLEAR) //checks if the command is clearing the color
    {
      drawing_color=0;
    }
    else if (current_colors<textbox_maxcolors) //stops bugs when a user tries to add too many colors
    {
      drawing_color=1;
      current_color_chr_start[current_colors]=current_chr+1;
      color_id[current_colors]=textbox_color_get(real(temp_data[0]));
      color_text_line[current_colors]=current_line;
      temp_strwidth=string_width(line_text[current_line]); //initialize this so we can check it before we add it to color_x
      if (temp_strwidth==1) //this fixes any problems with the color_x being offset by one pixel on the first character of text
      {
        temp_strwidth=0;
      }
      color_x[current_colors]=textbox_text_x+temp_strwidth; //set up where to draw the colored text
      color_y[current_colors]=textbox_text_y+(textbox_font_height*current_line);
      current_colors+=1;
    }
    break;
  }
  case CMD_TEXTNAME:
  {
    if (temp_data[0]==CMD_TEXTNAME_NULL)
    {
      textbox_name_enabled=0;
      textbox_name_text="";
    }
    else
    {
      textbox_name_enabled=1;
      textbox_name_text=temp_data[0];
    }
    break;
  }
  case CMD_TEXTQUESTION:
  {
    switch(temp_data[0])
    {
      case CMD_TEXTQUESTION_YN:
      {
        textbox_question_enabled=1;
        question_amount=2;
        textbox_question_text_width=string_width(textbox_question_text[0]);
        textbox_question_text_x[1]=textbox_question_text_x[0]+textbox_question_text_width+textbox_question_text_x_separation; //sets it so that the two questions can be separated
        textbox_question_text_y=textbox_text_y+textbox_question_text_y_offset+(textbox_font_height*(current_line+1)); //so that the question text displays on the last line of the textbox
        for (i=0; i<2; i+=1)
        {
          textbox_question_cursor_x[i]=textbox_question_text_x[i]-textbox_question_cursor_x_offset-textbox_question_cursor_sprite_xsize;
        }
        textbox_question_cursor_y=textbox_question_text_y+textbox_question_cursor_y_offset;
        break;
      }
      case "1": 
      {
        textbox_question_enabled=0;
        return (0); //really?  putting one option in a question box?
      }
      case "2": 
      {
        textbox_vnquestion_enabled=1;
        question_amount=2;
        break;
      }
      case "3": 
      {
        textbox_vnquestion_enabled=1;
        question_amount=3;
        break;
      }
      case "4": 
      {
        textbox_vnquestion_enabled=1;
        question_amount=4;
        break;
      }
      case "5": 
      {
        textbox_vnquestion_enabled=1;
        question_amount=5;
        break;
      }
      case "6": 
      {
        textbox_vnquestion_enabled=1;
        question_amount=6;
        break;
      }
      default: return (0);
    }
    textbox_vnquestion_y_offset=-((textbox_vnquestion_height/2)*(question_amount-4))
    break;
  }
  case CMD_TEXTQUESTIONTEXT:
  {
    textbox_question_text[real(temp_data[0])]=temp_data[1]; //text setting
    break;
  }
  case CMD_TEXTQUESTIONPOINTER:
  {
    textbox_cursor_option_pointer[real(temp_data[0])]=real(temp_data[1]);
    break;
  }
  case CMD_CUTINCLEAR:
  {
    if (temp_data[0]==CMD_CUTINCLEAR_ALL)
    {
      for (i=0; i<textbox_maxcutins; i+=1)
      {
        textbox_cutin_draw[i]=0;
      }
      if (!textbox_cutin_fade)
      {
        current_cutins=0;
      }
    }
    else
    {
      temp_cutin=real(temp_data[0]);
      textbox_cutin_draw[temp_cutin]=0;
      if (!textbox_cutin_fade)
      {
        current_cutins-=1;
      }
    }
    break;
  }
  case CMD_CUTINNEW:
  {
    temp_cutin=real(temp_data[0]);
    textbox_cutin_draw[temp_cutin]=1;
    textbox_cutin_sprite_set(temp_cutin,real(temp_data[1])); //this script also sets sprite parts
    if (temp_data[2]=="Y")
    {
      textbox_cutin_flipped[temp_cutin]=CMD_CUTIN_FLIPPED;
    }
    else
    {
      textbox_cutin_flipped[temp_cutin]=CMD_CUTIN_UNFLIPPED;
    }
    textbox_cutin_x[temp_cutin]=real(temp_data[3]);
    current_cutins+=1;
    break;
  }
  case CMD_CUTINOLD:
  {
    temp_cutin=real(temp_data[0]);
    textbox_cutin_sprite_set(temp_cutin,real(temp_data[1])); //this script also sets sprite parts
    if (temp_data[2]=="Y")
    {
      textbox_cutin_flipped[temp_cutin]=CMD_CUTIN_FLIPPED;
    }
    else
    {
      textbox_cutin_flipped[temp_cutin]=CMD_CUTIN_UNFLIPPED;
    }
    break;
  }
  case CMD_CUTINMOVE:
  {
    temp_cutin=real(temp_data[0]);
    textbox_cutin_x[temp_cutin]=real(temp_data[1]);
    break;
  }
  case CMD_CUTINANIMATE:
  {
    temp_cutin=real(temp_data[0]);
    temp_part=real(temp_data[1]);
    textbox_cutin_anim[temp_cutin,temp_part]=1;
    if (temp_data[2]=="Y")
    {
      textbox_cutin_anim_loop[temp_cutin,temp_part]=1;
    }
    else
    {
      textbox_cutin_anim_loop[temp_cutin,temp_part]=0;
      if (temp_data[3]!="Y") //putting this in here makes sure the textbox doesn't lock up because of user stupidity
      {
        textbox_text_paused=1;
      }
    }
    break;
  }
  case CMD_CUTINANIMATESTOP:
  {
    temp_cutin=real(temp_data[0]);
    if (temp_data[1]=="A")
    {
      for (i=0; i<textbox_cutin_parts[temp_cutin]; i+=1)
      {
        textbox_cutin_anim[temp_cutin,i]=0;
        textbox_cutin_anim_index[temp_cutin,i]=0;
      }
    }
    else
    {
      temp_part=real(temp_data[1]);
      textbox_cutin_anim[temp_cutin,temp_part]=0;
      textbox_cutin_anim_index[temp_cutin,temp_part]=0;
    }
    break;
  }
  case CMD_CUTINSWAP:
  {
    textbox_cutin_swap(real(temp_data[0]),real(temp_data[1]));
    break;
  }
  case CMD_END:
  {
    //lol nothing at all
    break;
  }
  default:
  {
    return (0);
  }
}

return (1);
