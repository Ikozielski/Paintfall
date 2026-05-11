//draw_self();
draw_sprite_ext(sprite_index, image_index, x, y, xscale * direcao, yscale, image_angle, image_blend, image_alpha);

desenha_efeito_brilho();

draw_text(x, y, global.powerUp_tinta);

var _alvo = place_meeting(x + (sign(velocidadeHorizontal) * 15), y, obj_caixa);

show_debug_message(_alvo);



//desenha_efeito_squash();


//Desenhando a mascara de colisao do player
if(global.debug) draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);