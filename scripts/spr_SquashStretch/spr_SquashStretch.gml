
function inicia_efeito_squash(){
		xscale = 1;
		yscale = 1;	
}

function efeito_squash(_xscale = 1, _yscale = 1){
	xscale = _xscale;
	yscale = _yscale;
}

function retorna_efeito_squash(_quantidade = .1){
	xscale = lerp(xscale, 1, _quantidade);
	yscale = lerp(yscale, 1, _quantidade);
}

function desenha_efeito_squash(){
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_alpha, image_blend, image_alpha);
}