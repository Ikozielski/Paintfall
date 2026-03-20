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
    //Criando 20 Particulas
    repeat (20){
        var _particulas = instance_create_layer(x, y, "Enfeites", obj_particula_powerUp);
        
        _particulas.direction = random_range(0, 359);
        _particulas.speed = random_range(3, 4);
        _particulas.alvo = alvo;
    }
    
}

