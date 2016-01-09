//textbox_cutin_sprite_set(cut-in id, sprite)
//gets the sprite pointer output by the command parser and changes it to an actual sprite
var i, cutin_id, temp_input;

cutin_id=argument0
temp_input=argument1;

switch(temp_input)
{
  case CUTIN_TEST_NORMAL:
  {
    textbox_cutin_parts[cutin_id]=3;
    textbox_cutin_sprite[cutin_id,0]=spr_TEST_cutin1; //body
      textbox_cutin_anim_wait[cutin_id,0]=0;
      textbox_cutin_anim_index[cutin_id,0]=0;
      textbox_cutin_anim_speed[cutin_id,0]=0;
      textbox_cutin_anim_subimgs[cutin_id,0]=0;
      textbox_cutin_part_x_offset[cutin_id,0]=0;
      textbox_cutin_part_y_offset[cutin_id,0]=0;
    textbox_cutin_sprite[cutin_id,1]=spr_TEST_cutin1_mouth; //mouth
      textbox_cutin_anim_index[cutin_id,1]=0;
      textbox_cutin_anim_speed[cutin_id,1]=.15;
      textbox_cutin_anim_wait[cutin_id,1]=0;
      textbox_cutin_anim_subimgs[cutin_id,1]=4;
      textbox_cutin_part_x_offset[cutin_id,1]=-7;
      textbox_cutin_part_y_offset[cutin_id,1]=-115;
    textbox_cutin_sprite[cutin_id,2]=spr_TEST_cutin1_eyes; //eyes
      textbox_cutin_anim_index[cutin_id,2]=0;
      textbox_cutin_anim_speed[cutin_id,2]=.30;
      textbox_cutin_anim_wait[cutin_id,2]=120;
      textbox_cutin_anim_subimgs[cutin_id,2]=4;
      textbox_cutin_part_x_offset[cutin_id,2]=-7;
      textbox_cutin_part_y_offset[cutin_id,2]=-142;
      for (i=0; i<textbox_cutin_parts[cutin_id]; i+=1) //misc common variables
      {
        textbox_cutin_anim[cutin_id,i]=0;
        textbox_cutin_anim_loop[cutin_id,i]=0;
        textbox_cutin_anim_time_waited[cutin_id,i]=0;
      }
    break;
  }
  case CUTIN_TEST_ANGRY:
  {
    textbox_cutin_parts[cutin_id]=3;
    textbox_cutin_sprite[cutin_id,0]=spr_TEST_cutin2; //body
      textbox_cutin_anim_wait[cutin_id,0]=0;
      textbox_cutin_anim_index[cutin_id,0]=0;
      textbox_cutin_anim_speed[cutin_id,0]=0;
      textbox_cutin_anim_subimgs[cutin_id,0]=0;
      textbox_cutin_part_x_offset[cutin_id,0]=0;
      textbox_cutin_part_y_offset[cutin_id,0]=0;
    textbox_cutin_sprite[cutin_id,1]=spr_TEST_cutin2_mouth; //mouth
      textbox_cutin_anim_index[cutin_id,1]=0;
      textbox_cutin_anim_speed[cutin_id,1]=.15;
      textbox_cutin_anim_wait[cutin_id,1]=0;
      textbox_cutin_anim_subimgs[cutin_id,1]=4;
      textbox_cutin_part_x_offset[cutin_id,1]=-10;
      textbox_cutin_part_y_offset[cutin_id,1]=-128;
    textbox_cutin_sprite[cutin_id,2]=spr_TEST_cutin2_eyes; //eyes
      textbox_cutin_anim_index[cutin_id,2]=0;
      textbox_cutin_anim_speed[cutin_id,2]=.30;
      textbox_cutin_anim_wait[cutin_id,2]=120;
      textbox_cutin_anim_subimgs[cutin_id,2]=4;
      textbox_cutin_part_x_offset[cutin_id,2]=-13;
      textbox_cutin_part_y_offset[cutin_id,2]=-139;
      for (i=0; i<textbox_cutin_parts[cutin_id]; i+=1) //misc common variables
      {
        textbox_cutin_anim[cutin_id,i]=0;
        textbox_cutin_anim_loop[cutin_id,i]=0;
        textbox_cutin_anim_time_waited[cutin_id,i]=0;
      }
    break;
  }
}

return (1);
