//draw_self();
draw_sprite_ext(sprite_index, image_index, x, y, xscale * direcao, yscale, image_angle, image_blend, image_alpha);

desenha_efeito_brilho();

draw_text(x, y, coyote_timer_atual);




//desenha_efeito_squash();


//Desenhando a mascara de colisao do player
if(global.debug) draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);