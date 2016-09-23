// This is to reset the text settings to the default 
// for continuing the game.

// Should be called at the end of every event that changes the following
// draw_set_color
// draw_set_font
// draw_set_halign
// draw_set_valign

// There may be others.

draw_set_color(c_white);
draw_set_font(fnt_PkmDPPT);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
corrupt = 0;
