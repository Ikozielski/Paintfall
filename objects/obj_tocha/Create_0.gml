ps = part_system_create(ps_brilho_chamas);

part_system_position(ps, x, y);

//Quando eu sou criada, eu crio a sprite da tocha na layer "Decoracoes_fundo"

layer_sprite_create("Decoracoes_fundo", x, y, spr_tocha);