var _variacaoFogo = random_range(0, .02);

gpu_set_blendmode(bm_add);

draw_sprite_ext(spr_brilho_tocha, 0, x, y, .3 + _variacaoFogo, .3 + _variacaoFogo, 0, c_white, .2);

gpu_set_blendmode(bm_normal);