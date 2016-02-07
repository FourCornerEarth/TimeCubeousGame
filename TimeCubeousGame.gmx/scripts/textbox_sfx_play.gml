//textbox_sfx_play(effect)
//plays the indicated sound effect
var temp_effect;

//fetches effect
temp_effect=argument0;

//checks which effect is selected
//the only default rn is shock sound
//more can be added here
switch (temp_effect)
{
  case CMD_TEXTEFFECT_SFX_SHOCK: audio_play_sound(snd_textbox_sfx_shock,1,0); break;
  default: return (0);
}

return (1);
