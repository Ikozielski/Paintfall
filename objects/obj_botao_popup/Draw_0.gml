draw_sprite_ext(spr_caixa_dialogo, 0, x + 10, y, 1.9, 1, 0, c_white, 1);


var _texto = "Deseja excluir o Save?"
var _verde = make_color_rgb(0, 255, 0);

draw_set_halign(0);
draw_set_valign(0);

draw_set_font(fnt_popup);

draw_text_transformed(x - 18, y - 14, _texto, .1, .1, 0);


// BOTÃO SIM
draw_set_color(_verde);
draw_rectangle(botao_sim_x, botao_y, botao_sim_x + largura_botao, botao_y + altura_botao, false);
draw_set_color(-1);

draw_set_color(c_black);

//draw_sprite_ext(spr_caixa_dialogo, 0, x, y, 0.5, 0.5, 0, c_green, 1);

draw_text_transformed(botao_sim_x + 4, botao_y + 1, "SIM", .1, .1, 0);

draw_set_color(c_white);


// BOTÃO NÃO
draw_set_color(c_red);

draw_rectangle(botao_nao_x, botao_y, botao_nao_x + largura_botao, botao_y + altura_botao, false);

draw_set_color(c_white);

draw_set_color(c_black);

draw_text_transformed(botao_sim_x + 29, botao_y + 1, "NÃO", .1, .1, 0);

draw_set_color(c_white);

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);