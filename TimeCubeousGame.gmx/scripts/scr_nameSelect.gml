/// When you've chosen an option from the name menu, this script runs.
// scr_nameSelect();

// If you've chosen a letter character
if (cursorPos <= ord("z")) {
   // If the name is longer than 7, don't add more letters.
   if (string_length(name) > 7) {
      name = string_copy(name, 1, 7);
   }
   // Otherwise
   else { // Add that char to the name.
        name += chr(cursorPos);
        // Name now has a char, so say that it is not empty.
        nameEmpty = 0;
   }
}

// Otherwise, if you've chosen "back", remove last letter.
else if (cursorPos == (ord("z")+1)) {
     name = string_copy(name, 1, string_length(name)-1);
}

// If you've chosen to confirm this name.
else {
     // Make sure name isn't empty, if so, return immediately.
     if (name == "") {
        nameEmpty = 1;
        return 0;
     }
     // If name is good, destroy this object and move to next room.
     instance_destroy();
     room_goto(rm_day_street);
}
