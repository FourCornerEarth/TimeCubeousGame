// Control the start menu items

switch(cursorPos) {

    // If Start Game, start the game.
    case 0: 
    {
        room_goto(rm_nameSelection);
        break;
    }
    
    // Otherwise, exit.
    case 1: game_end(); break;
    default: break;

}
