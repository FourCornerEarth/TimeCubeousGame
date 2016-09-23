/// End the battle, update all necessary items, and delete all relevant objects.
// run by battle object.

show_debug_message("INSIDE END BATTLE FUNCTION. DELETING BATTLE ITEMS.");
global.state[game_battle.objStateID] = 0;

show_debug_message("DELETING PLAYER TURN REGISTRY DS LIST.");
ds_list_destroy(global.playerTurnReg);

show_debug_message("DELETING ENEMY TURN REGISTRY DS LIST.");
ds_list_destroy(global.enmyTurnReg);

show_debug_message("DELETING BATTLE REGISTRY DS LIST.");
ds_list_destroy(global.btlReg);

//they dont exist anymore

show_debug_message("Destroying all birdblobs.");
with(NPC_birdBlob) {
    instance_destroy();
}

show_debug_message("Destroying all battle menus, if any.");
if object_exists(menub_battleMenu){
    with(menub_battleMenu) {
        instance_destroy();
    }
}
show_debug_message("Destroying all player turn objects, if any.");
if object_exists(battle_playerTurn){
    with(battle_playerTurn) {
        instance_destroy();
    }
}
show_debug_message("Destroying all enemy turn objects, if any.");
if object_exists(battle_enemyTurn){
    with(battle_enemyTurn) {
        instance_destroy();
    }
}

show_debug_message("Destroying all tokens objects, if any.");
if object_exists(rikuToken){
    with(rikuToken) {
        instance_destroy();
    }
}

show_debug_message("Destroying all UNDO objects, if any.");
if object_exists(UNDO){
    with(UNDO) {
        instance_destroy();
    }
}

show_debug_message("Destroying all UNDO_hard objects, if any.");
if object_exists(UNDO_hard){
    with(UNDO_hard) {
        instance_destroy();
    }
}

show_debug_message("Destroying bars, if any.");
if object_exists(cont_hpnsynch){
    with(cont_hpnsynch) {
        instance_destroy();
    }
}

if object_exists(cont_glitches){
    with(cont_glitches) {
        instance_destroy();
    }
}

show_debug_message("Destroying glitches, if any.");
if object_exists(obj_glitch){
    with(obj_glitch) {
        instance_destroy();
    }
}

show_debug_message("Destroying shield, if any.");
if object_exists(obj_shield){
    with(obj_shield) {
        instance_destroy();
    }
}

show_debug_message("Destroying core, if any.");
if object_exists(obj_Core){
    with(obj_Core) {
        instance_destroy();
    }
}

instance_destroy();
room_goto(global.currentLocation);

