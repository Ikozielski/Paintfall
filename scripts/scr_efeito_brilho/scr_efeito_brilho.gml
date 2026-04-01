//Você usa essa função para inicializar as varáveis necessárias para utilizar o efeito brilho
function inicia_efeito_brilho(){
    xscale = 1;
    yscale = 1;
    direcao = 1;
    alpha_brilho = 0;
    cor_brilho = c_white;
}

//Aplicando o efieto de brilho
//Você usa essa função para fazer ele brilhar
function aplica_efeito_brilho(_cor = c_white, _intensidade = 1){
    
     //Você tambem pode definir a intensidade do brilho 
    //1 é mais forte, e 0 é inexistente
    alpha_brilho = _intensidade;
    
    //Você também pode definir uma cor aqui
    cor_brilho = _cor;
}

//Retornando para a cor inicial
//Você usa essa função no step, pra ele deixar de brilhar 
//Você pode diminuir a velocidade que ele diminui o brilho
//1 é instantaneo e 0 nunca faz nada
function retorna_efeito_brilho(_velocidade = .1){
    
    alpha_brilho = lerp(alpha_brilho, 0, _velocidade);
}

//Função para desenhar o efeito do brilho
//Você deve usar essa função DEPOIS de desenhar a sua sprite
//Você também pode fazer ela manualmente usando as variaveis 
//alpha_brilho no alpha e cor_brilho no image_blend 
function desenha_efeito_brilho(){
    
    if (alpha_brilho <= .01) return;
        
    shader_set(sh_muda_cor);
    draw_sprite_ext(sprite_index, image_index, x, y, xscale * direcao, yscale, image_angle, cor_brilho, alpha_brilho);
    shader_reset();
}
