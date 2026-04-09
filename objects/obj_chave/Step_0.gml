//Se eu tenho que seguir o player
//Vou fazer o meu X seu igual ao X do meu alvo (preciso ter alvo)
//Vou fazer o meu Y sem mais ou menos igual ao Y do alvo 


if(abrindoPorta){
    //Meu código de ir até a porta e abrir ela 
      
    //Existe minha porta alvo? Se sim, vou pra minha porta algo 
    if(instance_exists(porta_alvo)){
        x = lerp(x, porta_alvo.x, .1);
        y = lerp(y, porta_alvo.y - porta_alvo.sprite_height / 2, .1);
        obj_player.gasteiChave = true;
    }
    
    //Se a minha distancia do X da porta for menor que 2, eu abro a aporta e me destruo
    
    var _distancia_X = abs(x - porta_alvo.x);
    if(_distancia_X < 2){
        porta_alvo.estado = porta_alvo.estado_abrindo;
        obj_player.gasteiChave = false;
        ScreenShake(20);
        instance_destroy();
    }
    
       
       
    //Vou sair do evento pq não preciso seguir o player mais 
    exit;
}

segue_player();