//scr_NPC_speak(npclabel, timesspoken, corruption)

var name=argument0;
var times=argument1; 
var corrupt=argument2;
var inst;

inst = instance_create(0,0, obj_textbox);
with (inst){
    if (!corrupt)
        {
            //not corrupt, fetches the label based on the name and amount of times
            name = string_insert(string(times), name, string_length(name)+1);
            obj_textbox.corrupt = 0;
        }
    else
        {
            //corrupt, adds a C
            name = string_insert("C", name, string_length(name)+1);
            name = string_insert(string(times), name, string_length(name)+1);
            obj_textbox.corrupt = 1;
        }
        obj_textbox.start_pointer = name;
}

