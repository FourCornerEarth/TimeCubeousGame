/// End the battle, update all necessary items, and delete all relevant objects.
// run by battle object.

global.state[obj_battle.objStateID] = 0;
with(obj_birdBlob) {
    instance_destroy();
}

instance_destroy();
room_goto(global.currentLocation);

