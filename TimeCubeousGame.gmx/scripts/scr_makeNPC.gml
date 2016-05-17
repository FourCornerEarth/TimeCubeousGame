/// makeNPC(name) -- takes the name of the NPC as a string
show_debug_message("Trying to run scr_makeNPC");
image_speed = 0.1;
justSpoke = 0;
timesspokento=0;
ctimesspokento=0;
iscorrupt=0;
enddialogue=0;
//name = argument0; //argument0

show_debug_message("Trying to open file.");
var file = file_text_open_read("npc_information.txt");
var st = argument0;
st = "[SE:" + st;
var checkDone = 0;
var tCheck;
var tQ = ds_queue_create();

show_debug_message("Trying to find the thing in question.");
while (!checkDone) {
      tCheck = file_text_readln(file);
      show_debug_message("tCheck: " + string(tCheck));
      if (string_count(st, tCheck) > 0) checkDone = 1;
      if (file_text_eof(file)) {show_error("CAN'T FIND UR SHIT!", 1); exit;}
      else { 
           file_text_readln(file);
           //show_debug_message("cDone Else: " + string(cline));
      }
}

show_debug_message("Entering loopEnd.");
var loopEnd = 0;
var doneWInt = 0;

while (!loopEnd) {
      if (checkDone) { 
         tmpTxt = tCheck;
         show_debug_message("tCheck: " + string(tCheck));  
         checkDone = 0;
      }
      tmpTxt = file_text_readln(file);
      show_debug_message("tmpTxt readln is: " + string(tmpTxt));  
      if (string_char_at(tmpTxt, 1) == "#") continue;    
      if (string_count("[E:0]", tmpTxt) > 0) { doneWInt = 1; continue; }
      if (string_count("[E:X]", tmpTxt) > 0 || file_text_eof(file)) loopEnd = 1;
      if (string_count("[BTL:", tmpTxt) > 0) { doneWInt = 0; continue; }
      
      
      if (!doneWInt) {
         //show_debug_message("tmpTxt readln is: " + string(tmpTxt));         
         tmpTxt = file_text_read_real(file);
         show_debug_message("tmpTxt read_real is: " + string(tmpTxt));
      }
      else {
         //tmpTxt = file_text_readln(file);
         //show_debug_message("tmpTxt readln is: " + string(tmpTxt));         
         tmpTxt = file_text_read_string(file);
         show_debug_message("tmpTxt read_real is: " + string(tmpTxt));
      }
      ds_queue_enqueue(tQ, tmpTxt);

}

file_text_close(file);

isDead = ds_queue_dequeue(tQ);
canFightNow = ds_queue_dequeue(tQ);
currentSynchLevel = ds_queue_dequeue(tQ);
synchLVLForCorrupt = ds_queue_dequeue(tQ);
synchLVLForXtremeCorrupt = ds_queue_dequeue(tQ);
maxBattles = ds_queue_dequeue(tQ);
timesFought = ds_queue_dequeue(tQ);
timesLost = ds_queue_dequeue(tQ);
likeThreshold = ds_queue_dequeue(tQ);
hateThreshold = ds_queue_dequeue(tQ);
for (var i = 0; i < 5; i++) {
    attrWeight[i] = ds_queue_dequeue(tQ);
}
numAnim = ds_queue_dequeue(tQ);
formula = ds_queue_dequeue(tQ);
desc = ds_queue_dequeue(tQ);
regSprite = ds_queue_dequeue(tQ);
maxSpd = ds_queue_dequeue(tQ);
ableToRun = ds_queue_dequeue(tQ);
numAttacks = ds_queue_dequeue(tQ);
HP = ds_queue_dequeue(tQ);
synchLVLAtBTLStart = ds_queue_dequeue(tQ);
synchLVLForCure = ds_queue_dequeue(tQ);
synchLVLForMercy = ds_queue_dequeue(tQ);
atk = ds_queue_dequeue(tQ);
for (var i = 0; i < 2; i++) {
    enemyBattleOps[i] = ds_queue_dequeue(tQ);
    enemyBTLOpsText[i] = ds_queue_dequeue(tQ);
}

effectItems[0] = ds_queue_dequeue(tQ);
effectItmTxt[0] = ds_queue_dequeue(tQ);
ds_queue_destroy(tQ);
