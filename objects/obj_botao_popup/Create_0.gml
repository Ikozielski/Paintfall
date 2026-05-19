image_alpha = .9

largura_botao = 20;
altura_botao = 10;

botao_sim_x = x - 15;
botao_nao_x = x + 10;

botao_y = y;

save = 0;

cancela_animacao = function (){
    
    if(instance_exists(botao_lixo)){ 
            botao_lixo.clicou = false;
            botao_lixo.image_speed = 0; 
            botao_lixo.image_alpha = .6;
        }
            instance_destroy();
}