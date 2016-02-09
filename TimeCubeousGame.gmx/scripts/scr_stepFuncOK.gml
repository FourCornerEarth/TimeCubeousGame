/// Is step function OK to run in this item?

for (var i = 0; i < array_length_1d(global.state); i++) {
    if (i != objStateID && global.state[i]) {return 0;}
}

return 1; //Ok to do step function
