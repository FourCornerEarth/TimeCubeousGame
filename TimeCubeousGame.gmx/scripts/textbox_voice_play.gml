//textbox_voice_play(index, speed mode)
//gets the sound to play and plays it
var temp_voice, temp_speed;

//variables get their information from how they were called,
//voice is picked by index number and the speed is picked by speed cases
//you can note below that it's been arranged for specific numbers 
//for sound quality. Comments left are by the original coder
temp_voice=argument0;
temp_speed=argument1;

//with the current sound effects, if you play it every step, it sounds terrible.
//so, checking the speed and only playing it on certain steps makes it easier on the ears.
switch(temp_speed)
{
  case 1: if (current_chr mod 4!=0) {return (1);} break;
  case 4: if (current_chr mod 2!=0) {return (1);} break;
  //checks for a space to not play noise
  case 12: if (textbox_specialchar_check(string_char_at(output_text,current_chr))) {return (1);} break;
}

switch(temp_voice)
{
  //no sound
  case 0: /*no sound is played*/ break;
  //low voice
  case 1: audio_play_sound(snd_voicelow,1,0); break;
  //medium voice, default if none selected
  case 2: audio_play_sound(snd_voicemed,1,0); break;
  //high voice
  case 3: audio_play_sound(snd_voicehigh,1,0); break;
  //thought voice
  case 4: audio_play_sound(snd_voicelow,1,0); break;
  //if none is selected, returns false for selection to play default
  default: return (0);
}
