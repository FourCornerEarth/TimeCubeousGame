#define __rt_fhidden_init
/*
    Initializes global variables and soft-coded values
    for ease-of-access.
    
    This should be called at the game initialization.
    
    Jargon:
        Trigger -   The object that specifies what actual physical input 
                    should be checked, that is to say the "trigger" to check.
        Timer   -   The actual timed note that will expect a given trigger to match.
        Sequence-   The list of timer objects to use when analysing input
        Rank    -   The levels of accuracy accepted via trigger
        
    Constants:
        rt_notrigger = -1   -> Null return for trigger grabbing
        rt_keyboard = 0     -> Check keyboard for input
        rt_mouse = 1        -> Check mouse for input
        rt_norank = -2      -> Null return for rank grabbing
        rt_miss = -1        -> Rank miss
        
    Warnings:
        The object __rt_ohidden_controller is used as the controller! Make sure to take note when
        using deactivation scripts.
 */
enum TRIGGER_T
{
    script,
    const
}
enum TRIGGER
{
    // Soft-coded in case I change the name later
    none = rt_notrigger,
    markerValue = 7588,
    marker = 0, // Position of the marker
    id = 1,     // Position of the id of the trigger
    type = 2,   // Position to store the trigger type
    action = 3, // Position to store the script / constant
    isArg = 4,  // Position of argument flag
    arg = 5,     // Position of argument value
    usingGraphics = 6, // Position of the graphics flag
    size = 7 // Size of the array
}

enum TIME
{
    dSamples = 4 //Number of samples to take before averaging
}

enum TIMER
{
    trigger = 0, // Position of the trigger
    time = 1,     // Position of the time
    usingGraphics = 2, // Position of the graphics flag
    size = 3,
}

enum SEQUENCE
{
    markerValue = -188,
    marker = 0,     // Position of the marker
}
 
globalvar   __rt_g_triggerList,
            __rt_g_triggerLast,
            __rt_g_sequence,
            __rt_g_timeStart,
            __rt_g_timerCurrent,
            
            __rt_g_timeDeltaTotal,
            __rt_g_timeDeltaAvg,
            __rt_g_timeDeltaSample,
            
            __rt_g_rankList,
            __rt_g_return,
            
            __rt_g_missTime,
            __rt_g_rankQueue,
            
            __rt_g_isStrict,
            __rt_g_functionTrigger,
            
            __rtg_enabled;

// Toggles whether the graphical system will be used
__rtg_enabled = false;

// The function to call (if any) when a trigger is performed.
__rt_g_functionTrigger = noone;
            
// Holds the list of triggers for reference later.
__rt_g_triggerList = ds_list_create();

// Holds the list of all possible timed ranks when activating triggers:
__rt_g_rankList = ds_list_create();

// Holds the queue of ranks triggered by the player
__rt_g_rankQueue = ds_queue_create();

// Contains the index of the last trigger activated
__rt_g_triggerLast = TRIGGER.none;

// The list currently being timed
__rt_g_sequence = noone;

// The ID of the timer we are currently waiting for:
__rt_g_timerCurrent = noone;

// The time the sequence was started
__rt_g_timeStart = -1;

// The total added times passed before averaging
__rt_g_timeDeltaTotal = 0;

// The average of time passed between steps. Used to try and compensate for lag with trigger times.
__rt_g_timeDeltaAvg = 0;

// Number of samples taken since last average:
__rt_g_timeDeltaSample = 0;

// Holds custom script returns
__rt_g_return = false;

// The amount of milliseconds to pass until a timer is "missed"
__rt_g_missTime = 0;

// Whether or not "playful" out-of-timed triggers are permitted:
__rt_g_isStrict = false;

// Check to make sure the user imported the object.
// This is really only useful for the non-YYC modules.
if (asset_get_index("__rt_ohidden_controller") == -1)
    show_error("Rhythm Trigger:(FATAL): Controller object not found! Make sure all resources have been imported from the Rhythm Trigger extension before compiling!", true);
#define __rt_fhidden_find_trigger
/*
    Retrieves the array of values given the ID.
    
    Argument0   -   id to grab
    Returns     -   array, or TRIGGER.none if error
 */
 
if (argument0 < 0)
    return TRIGGER.none;

if (argument0 < ds_list_size(__rt_g_triggerList))
{
    var __a = __rt_g_triggerList[| argument0];
    
    // Found it:
    if (__a[TRIGGER.id] == argument0)
        return __a;
        
    // If ID is larger than pos, then one was deleted:
    if (__a[TRIGGER.id] > argument0)
    {
        // Scan down the list for the correct ID!
        for (var i = argument0 - 1; i >=0; --i)
        {
            __a = __rt_g_triggerList[| i];
            if (__a[TRIGGER.id] == argument0)
                return __a;
                
            // Check if we passed its position (thus it doesn't exist)
            if (__a[TRIGGER.id] < argument0)
                break;
        }
    }
    
    // No need to check the other direction, as we never insert new values.
}
else
{
    // It is possible it still exists, but others were deleted.
    // We just have to scan the whole list.
    var __size = ds_list_size(__rt_g_triggerList) - 1;
    for (var i = __size; i >= 0; --i)
    {
        __a = __rt_g_triggerList[| i];
            if (__a[TRIGGER.id] == argument0)
                return __a;
                
        // Check if we passed its position (thus it doesn't exist)
        if (__a[TRIGGER.id] < argument0)
            break;
    }
}

return TRIGGER.none;
#define __rt_fhidden_check_trigger
/*
    Checks if a trigger is being triggered.
    Argument0   -   The trigger to check
    Returns     -   Whether or not the trigger was activated
 */
 
var __trigger = __rt_fhidden_find_trigger(argument0);

if (!is_array(__trigger))
    return false;
    
if (__trigger[TRIGGER.type] == TRIGGER_T.script)
{
    if (__trigger[TRIGGER.isArg])
        script_execute(__trigger[TRIGGER.action], __trigger[TRIGGER.arg]);
    else
        script_execute(__trigger[TRIGGER.action]);
    
    var __ret = rt_return_get();
    rt_return_false();
    return __ret;
}
else
{
    if (__trigger[TRIGGER.action] == rt_keyboard)
        return keyboard_check_pressed(__trigger[TRIGGER.arg]);
    if (__trigger[TRIGGER.action] == rt_mouse)
        return mouse_check_button_pressed(__trigger[TRIGGER.arg]);
}

return false;
#define rt_return_true
///rt_return_true()
/*
    Marks the return value as true
 */
__rt_g_return = true;
return undefined;
#define rt_return_false
///rt_return_false()
/*
    Marks the return value as false
 */
__rt_g_return = false;
return undefined;
#define rt_return_get
///rt_return_get()
/*
    Returns the current return value
 */
return __rt_g_return;
#define rt_system_setstrict
///rt_system_setstrict(strict)
/*
    Sets whether the system timing should be strict or not.
    
    Argument0   -   Whether or not to make the system strict
    Returns     -   N/A
 */
 
__rt_g_isStrict = argument0;
return undefined;
#define rt_system_getstrict
///rt_system_getstrict()
/*
    Returns if the system is currently set to strict or not
 */
 
return __rt_g_isStrict;
#define rt_system_hasrank
///rt_system_hasrank()
/*
    Returns whether or not there is a rank to retrieve
    from the queue.
 */
 
return (ds_queue_size(__rt_g_rankQueue) != 0);
#define rt_system_getrank
///rt_system_getrank()
/*
    Returns and deletes the rank from the queue.
    If the queue is empty, rt_norank is returned
 */
if (!rt_system_hasrank())
    return rt_norank;
    
return ds_queue_dequeue(__rt_g_rankQueue);
#define rt_system_time_getremainder
///rt_system_time_getremainder()
/*
    Returns the amount of time left (in ms) until the next
    timer. Throws error if no sequence is playing.
    
    + means before, - means you are late
 */
 
if (!instance_exists(__rt_ohidden_controller))
{
    show_error("Rhythm Timer:(FATAL): Cannot retrieve time from non-existing sequence.", true);
    return undefined;
}
    
var __id = __rt_ohidden_controller.id;
var __timer = __id._sequence[| __id._currentTimer];

return (__timer[TIMER.time] - (current_time - __id._timeStart));
#define rt_system_settriggerfunction
///rt_system_settriggerfunction([STRING] function)
/*
    Sets a function to be called when a trigger is activated.
    The function must take 4 arguments.
        0   -   The rank id
        1   -   The sequence being run
        2   -   The trigger id
        3   -   The time of the timer
    
    Argument0   -   The function name to call, or noone to clear
    Returns     -   the id of the function set, or noone if error
 */
 
if (!is_string(argument0))
{
    __rt_g_functionTrigger = noone;
    return __rt_g_functionTrigger;
}

if (asset_get_type(argument0) != asset_script)
{
    show_error("Rhythm Trigger:(argument0): Incorrect type! Expected type [function]", false);
    __rt_g_functionTrigger = noone;
    return __rt_g_functionTrigger;
}

__rt_g_functionTrigger = asset_get_index(argument0);

return __rt_g_functionTrigger;
#define rt_system_setpaused
///rt_system_setpaused(paused)
/*
    Sets whether or not the system should be paused.
    
    Argument0   -   If true, the system will pause
 */
 
if (!instance_exists(__rt_ohidden_controller))
{
    show_error("Rhythm Timer: Cannot pause / unpause the system when no sequence is active!", false);
    return false;
}

__rt_ohidden_controller._paused = argument0;
return true;

#define rt_system_getpaused
///rt_system_getpaused()
/*
    Returns whether the current system is paused or not.
 */
 
if (!instance_exists(__rt_ohidden_controller))
    return false;
return __rt_ohidden_controller._paused;

#define rt_bpmtoms
///rt_bpmtoms(bpm)
/*
    Converts the BPM rate to the number of milliseconds in
    one of those beats.
    
    Argument0   -   The bpm to use
    Returns     -   The number of ms in a beat
 */
return 60000 / argument0;

#define rt_sequence_create
///rt_sequence_create()
/*
    Creates a sequence object so that you can add timers
    to search for.
    
    Returns the id of the sequence
 */
 
var __l = ds_list_create();
ds_list_add(__l, SEQUENCE.markerValue); // pos 0

return __l;
#define rt_sequence_destroy
///rt_sequence_destroy(sequence)
/*
    Destroys a sequence.
    
    Returns     -   N/A
 */
 
if (ds_list_size(argument0) == 0)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return undefined;
}

if (argument0[| SEQUENCE.marker] != SEQUENCE.markerValue)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return undefined;
}

ds_list_destroy(argument0);

return undefined;
#define rt_sequence_start
///rt_sequence_start(sequence)
/*
    Starts one of the sequence timers. If a sequence is currently being
    processed, this function will not create a new one until the last one is finished.
    
    Argument0   -   Sequence to start
    Returns     -   Whether succesful
 */
 
if (ds_list_size(argument0) == 0)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return false;
}

if (argument0[| SEQUENCE.marker] != SEQUENCE.markerValue)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return false;
}

if (debug_mode && ds_list_size(__rt_g_rankList) == 0)
    show_error("Rhythm Trigger:(WARNING): You have no ranks defined! All timers will be marked as missed.", false);
 
// Quit early if a sequence is already going.
if (instance_exists(__rt_ohidden_controller))
   return false;
 
var __id = instance_create(0, 0, __rt_ohidden_controller);

__id._timeStart = current_time;
__id._sequence = argument0;
__id._currentTimer = 1;         // Base 1, not base 0
__id._endTimer = ds_list_size(argument0); // Timer to stop at. 
#define rt_sequence_playing
///rt_sequence_playing()
/*
    Returns -   The current sequence playing, or noone if none
 */
 
if (!instance_exists(__rt_ohidden_controller))
    return noone;
    
return __rt_ohidden_controller._sequence;
#define rt_sequence_isplaying
///rt_sequence_isplaying(sequence)
/*
    Returns whether a specific sequence is playing or not:
    
    Argument0   -   The sequence to check for
    Returns     -   Whether or not it is playing
 */
 

if (ds_list_size(argument0) == 0)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return false;
}

if (argument0[| SEQUENCE.marker] != SEQUENCE.markerValue)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return false;
}

return (rt_sequence_playing() == argument0);
#define rt_sequence_stop
///rt_sequence_stop([OPTIONAL] sequence)
/*
    Stops all sequences playing if no argument is provided.
    If an argument is provided, then only that sequence will
    be stopped (if it exists)
    
    Argument0   -   [OPTIONAL] the sequence to stop. If not specified, all will be stopped.
    Returns     -   N/A
 */
 
if (argument_count > 1)
{
    show_error("Rhythm Trigger: Incorrect argument count!", false);
    return undefined;
}

if (argument_count == 1)
{
    if (ds_list_size(argument[0]) == 0)
    {
        show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
        return false;
    }
    var __arg0 = argument[0];
    if (__arg0[| SEQUENCE.marker] != SEQUENCE.markerValue)
    {
        show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
        return false;
    }
}

if (instance_exists(__rt_ohidden_controller))
    return undefined;
    
if (argument_count == 1)
{
    if (__rt_ohidden_controller._sequence == argument[0])
        rt_sequence_stop();
    return undefined;
}

with (__rt_ohidden_controller)
    instance_destroy();
    
return undefined;
#define rt_trigger_create
///rt_trigger_create([CONST / STRING] script, [OPTIONAL] arg1)
/*
    Creates a new trigger that can be used to check and
    mark input.
    
    Argument0   -   Can either be a constant, which will require the argument1, or
                    a string of a script that was custom written where the argument
                    is optional.
                    If passing a script name, the return value MUST be set via
                    rt_return_*() functions
    Argument1   -   A static value that will be passed to the script when called.
    Returns     -   Trigger id or rt_notrigger if error
 */
 
if (argument_count < 1 || argument_count > 2)
{
    show_error("Rhythm Trigger: Incorrect argument count!", false);
    return TRIGGER.none;
}
 
// Custom function:
if (is_string(argument[0]))
{
    // -- STUB -- // Check to see if appropriate type:
    if (asset_get_type(argument[0]) != asset_script)
    {
        show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [script] or [const].", false);
        return TRIGGER.none;
    }
    
    // Generate the array needed to store the trigger.
    var __a  = 0;
    if (argument_count == 2)
        __a[TRIGGER.arg] = argument[1];
    __a[TRIGGER.usingGraphics] = false;
    __a[TRIGGER.isArg] = (argument_count == 2);
    __a[TRIGGER.action] = asset_get_index(argument[0]); // Grab the script ID.
    __a[TRIGGER.type] = TRIGGER_T.script;
    __a[TRIGGER.id] = ds_list_size(__rt_g_triggerList);
    __a[TRIGGER.marker] = TRIGGER.markerValue;
    ds_list_add(__rt_g_triggerList, __a);
    return __a[TRIGGER.id]; // Return the ID of the trigger
}
else
{
    // Must have an argument if a constant, as it specifies the key to look for.
    if (argument_count != 2)
    {
        show_error("Rhythm Trigger: Incorrect argument count!", false);
        return TRIGGER.none;
    }
    
    if (!is_real(argument[1]))
    {
        show_error("Rhythm Trigger:(argument1): Incorrect argument type. Expected type [real].", false);
        return TRIGGER.none;
    }
    
    if (argument[0] != 0 && argument[0] != 1)
    {
        show_error("Rhythm Trigger:(argument0): Unexpected value! Expected [const] rt_keyboard or rt_mouse.", false);
        return TRIGGER.none;
    }
    
    var __a = 0;
    __a[TRIGGER.usingGraphics] = false;
    __a[TRIGGER.arg] = argument[1];
    __a[TRIGGER.isArg] = true;
    __a[TRIGGER.action] = argument[0];
    __a[TRIGGER.type] = TRIGGER_T.const;
    __a[TRIGGER.id] = ds_list_size(__rt_g_triggerList);
    __a[TRIGGER.marker] = TRIGGER.markerValue;
    ds_list_add(__rt_g_triggerList, __a);
    return __a[TRIGGER.id]; // Return the ID of the trigger
}

// Should never be reached:
return TRIGGER.none;
#define rt_timer_add
///rt_timer_add(sequence, trigger, time)
/*
    Creates and adds a new timer to a given sequence.
    
    Argument0   -   Sequence to add to
    Argument1   -   Trigger to use
    Argument2   -   Time (in ms) to set the timer at
    
    Returns     -   whether or not succesful
 */

if (ds_list_size(argument0) == 0)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return false;
}

if (argument0[| SEQUENCE.marker] != SEQUENCE.markerValue)
{
    show_error("Rhythm Trigger:(argument0): Incorrect argument type! Expected type [sequence].", false);
    return false;
}

var __trigger = __rt_fhidden_find_trigger(argument1);

if (!is_array(__trigger))
{
    show_error("Rhythm Trigger:(argument1): Incorrect argument type! Expected type [trigger].", false);
    return false;
}

  
if (__trigger[TRIGGER.marker] != TRIGGER.markerValue)
{
    show_error("Rhythm Trigger:(argument1): Incorrect argument type! Expected type [trigger].", false);
    return false;
}

// Generate the trigger value:
var __a = 0;

__a[TIMER.usingGraphics] = false;
__a[TIMER.time] = argument2;
__a[TIMER.trigger] = argument1;

// Add to the sequence:
ds_list_add(argument0, __a);

return true;
#define rt_rank_create
///rt_rank_create(time)
/*
    Creates a new rank and returns its ID.
    Argument0   -   The time (in ms) that the rank covers
    Returns     -   The id of the rank
 */ 
 
// If there is a miss, a -1 will be returned
var __id = ds_list_size(__rt_g_rankList);
ds_list_add(__rt_g_rankList, argument0);

// Update the miss time:
if (argument0 > __rt_g_missTime)
    __rt_g_missTime = argument0;

return __id;
