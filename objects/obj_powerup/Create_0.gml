//Indo para a cabeça do player

alvo = noone;

movendo = function (){
    //Só rodo se eu tiver um alvo
    if(!alvo) return;
        
    x = alvo.x;
    y = alvo.y - 34;
    
    
}


//Explosão de particulas 
explosao = function(){
    //Criando Particulas
    var _quantidade = irandom_range(20, 30);
    repeat (_quantidade){
        var _particulas = instance_create_layer(x, y, "Enfeites", obj_particula_powerUp);
        
        _particulas.direction = random_range(0, 359);
        _particulas.speed = random_range(3, 4);
        _particulas.alvo = alvo;
    }
    
}

