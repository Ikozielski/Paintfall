//draw_self();
draw_sprite_ext(sprite_index, image_index, x, y, xscale * direcao, yscale, image_angle, image_blend, image_alpha);

shader_set(sh_muda_cor);
draw_sprite_ext(sprite_index, image_index, x, y, xscale * direcao, yscale, image_angle, cor_brilho, alpha_brilho);
shader_reset();

draw_text(x, y, chaoTinta);




//desenha_efeito_squash();


//Desenhando a mascara de colisao do player
if(global.debug) draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);