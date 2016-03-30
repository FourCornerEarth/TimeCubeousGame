/// End the battle, update all necessary items, and delete all relevant objects.
// run by battle object.

show_debug_message("INSIDE END BATTLE FUNCTION. DELETING BATTLE ITEMS.");
global.state[obj_battle.objStateID] = 0;

show_debug_message("DELETING PLAYER TURN REGISTRY DS LIST.");
ds_list_destroy(global.playerTurnReg);

show_debug_message("DELETING BATTLE REGISTRY DS LIST.");
ds_list_destroy(global.btlReg);

show_debug_message("Destroying all birdblobs.");
with(obj_birdBlob) {
    instance_destroy();
}
show_debug_message("Destroying all item ops, if any.");
with(battle_itemOps) {
    instance_destroy();
}
show_debug_message("Destroying all item menus, if any.");
with(battle_itemMenu) {
    instance_destroy();
}
show_debug_message("Destroying all interact menus, if any.");
with(battle_interactMenu) {
    instance_destroy();
}
show_debug_message("Destroying all battle menus, if any.");
with(menu_battleMenu) {
    instance_destroy();
}
show_debug_message("Destroying all player turn objects, if any.");
with(battle_playerTurn) {
    instance_destroy();
}
show_debug_message("Destroying all enemy turn objects, if any.");
with(battle_enemyTurn) {
    instance_destroy();
}
instance_destroy();
room_goto(global.currentLocation);

