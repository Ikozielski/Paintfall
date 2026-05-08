draw_self();

//Desenhando a sprite do player
var _player_x = x - 60;
var _player_y = y + 11;
draw_sprite_ext(sprite, current_time / 100, _player_x, _player_y, .85, .85, 0, c_white, image_alpha);



var _texto = string("Save {0}", save);

draw_set_halign(1);
draw_set_valign(1);

draw_set_font(fnt_save);

draw_text(x, y, _texto);

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);