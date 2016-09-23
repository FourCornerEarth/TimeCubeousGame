///scr_food_step()

//if fetch quest is not active it DIES
if (!global.questFlags[0]){
    instance_destroy();
}

//vanished to the shadow realm
if (global.foodFlags[flagNum] == 0){
    instance_destroy();
    exit;
}

//checks if MC is around obj
if(collision_circle(x, y, 90, game_player, false, true) > 0)
{ //if we wanna talk to her
    if(keyboard_check_released(vk_space)) {
    
        //if (state_stepFuncOK(global.wState)) {global.wState = state_toggleStepFunc(global.wState);}
        // Make sure obj is already running text.
        // global.wState[objStateID]
        if (state_stepFuncOK(global.wState) && !instance_exists(game_textbox) && (justSpoke == 0))
        {
            // Sends data to npc script
            if (iscorrupt) {
                // Objects cannot be corrupt! DELETE LATER!
                scr_NPC_speak(NPC_name, ctimesspokento, iscorrupt);
                switch (timesspokento)
                {
                    case 0:
                        enddialogue = 1;
                        break;
                }
            } else {
                //not corrupt npc
                scr_NPC_speak(NPC_name, timesspokento, iscorrupt);
                //noncorrupt times spoken to
                switch (timesspokento)
                {
                    default: 
                             inv_copy_item(id);
                             //meat is 10 in list, flagging that its been picked up
                             global.foodFlags[flagNum] = 0;
                             enddialogue=1;
                             break;
                       
                }
            }
            //halts dialogue autostart by pressing space and destroying the tbox
            //without this it will bring up the tbox again
            justSpoke = 20; 
            
            //corrupt times spoken to
            if (!enddialogue)
            {
                timesspokento++;
            }  
        }//end check to see if you can talk to her
    }//end spacebar check
}//end circle check

//checking if she is corrupt to change her sprite
if (iscorrupt)
{
    image_blend = c_red;
}


