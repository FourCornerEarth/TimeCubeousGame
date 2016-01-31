/// scr_notifyPersistent(knownState.nameOfState)

// run by gameState itself

for (var i = 0; i < ds_list_size(registry); i++) {

    registry[i].stateChanged = 1;
}
