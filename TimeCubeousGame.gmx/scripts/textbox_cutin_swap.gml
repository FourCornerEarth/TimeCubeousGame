//textbox_cutin_swap(index, new cut-in id)
//moves cut-in index to the new cut-in id
var i, ci_ind1, ci_ind2;

ci_old=argument0;
ci_new=argument1;

textbox_cutin_draw[ci_new]=textbox_cutin_draw[ci_old];
textbox_cutin_x[ci_new]=textbox_cutin_x[ci_old];
textbox_cutin_flipped[ci_new]=textbox_cutin_flipped[ci_old];
textbox_cutin_alpha[ci_new]=textbox_cutin_alpha[ci_old];
textbox_cutin_parts[ci_new]=textbox_cutin_parts[ci_old];
for (i=0; i<textbox_cutin_parts[ci_new]; i+=1)
{
  textbox_cutin_sprite[ci_new,i]=textbox_cutin_sprite[ci_old,i];
  textbox_cutin_anim_index[ci_new,i]=textbox_cutin_anim_index[ci_old,i];
  textbox_cutin_anim_speed[ci_new,i]=textbox_cutin_anim_speed[ci_old,i];
  textbox_cutin_anim_wait[ci_new,i]=textbox_cutin_anim_wait[ci_old,i];
  textbox_cutin_anim_subimgs[ci_new,i]=textbox_cutin_anim_subimgs[ci_old,i];
  textbox_cutin_part_x_offset[ci_new,i]=textbox_cutin_part_x_offset[ci_old,i];
  textbox_cutin_part_y_offset[ci_new,i]=textbox_cutin_part_y_offset[ci_old,i];
  textbox_cutin_anim[ci_new,i]=textbox_cutin_anim[ci_old,i];
  textbox_cutin_anim_loop[ci_new,i]=textbox_cutin_anim_loop[ci_old,i];
  textbox_cutin_anim_time_waited[ci_new,i]=textbox_cutin_anim_time_waited[ci_old,i];
}

return (1);
