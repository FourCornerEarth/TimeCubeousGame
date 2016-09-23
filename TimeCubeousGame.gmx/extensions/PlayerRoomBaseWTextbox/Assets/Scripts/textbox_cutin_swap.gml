//textbox_cutin_swap(index, new cut-in id)
//moves cut-in index to the new cut-in id
var i, ci_ind1, ci_ind2;

//first cutin
ci_old=argument0;
//the new id
ci_new=argument1;

//fetches the values of the old cutin to place on the new
textbox_cutin_draw[ci_new]=textbox_cutin_draw[ci_old];
textbox_cutin_x[ci_new]=textbox_cutin_x[ci_old];
textbox_cutin_flipped[ci_new]=textbox_cutin_flipped[ci_old];
textbox_cutin_alpha[ci_new]=textbox_cutin_alpha[ci_old];
textbox_cutin_parts[ci_new]=textbox_cutin_parts[ci_old];

//starts replacing these for all the parts of the new cutin
for (i=0; i<textbox_cutin_parts[ci_new]; i+=1)
{
  textbox_cutin_sprite[ci_new,i]=textbox_cutin_sprite[ci_old,i]; //sprite
  textbox_cutin_anim_index[ci_new,i]=textbox_cutin_anim_index[ci_old,i]; //animation index
  textbox_cutin_anim_speed[ci_new,i]=textbox_cutin_anim_speed[ci_old,i]; //speed
  textbox_cutin_anim_wait[ci_new,i]=textbox_cutin_anim_wait[ci_old,i]; //wait time
  textbox_cutin_anim_subimgs[ci_new,i]=textbox_cutin_anim_subimgs[ci_old,i]; //subimages
  textbox_cutin_part_x_offset[ci_new,i]=textbox_cutin_part_x_offset[ci_old,i]; //offset x
  textbox_cutin_part_y_offset[ci_new,i]=textbox_cutin_part_y_offset[ci_old,i]; //offset y
  textbox_cutin_anim[ci_new,i]=textbox_cutin_anim[ci_old,i]; //animation
  textbox_cutin_anim_loop[ci_new,i]=textbox_cutin_anim_loop[ci_old,i]; //if there is looping animation
  textbox_cutin_anim_time_waited[ci_new,i]=textbox_cutin_anim_time_waited[ci_old,i]; //time it has waited already
}

return (1);
