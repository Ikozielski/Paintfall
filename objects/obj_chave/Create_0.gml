//Saiba se ele precisa seguir o alvo (o Player)
seguePlayer = false;
alvo = noone;
abrindoPorta = false;
porta_alvo = noone;

numeroChaves = 0;

segue_player = function (){
    if (instance_exists(alvo)){
        
        var _distancia_X = abs(x - alvo.x);
        var _margem_X = (20 * numeroChaves) * -alvo.direcao;
        
        if(_distancia_X != _margem_X){
            x = lerp(x, (alvo.x + _margem_X), .05);
        }
        
        var _sinwave = 12 * sin(4 * current_time / 1000);
        y = lerp(y, alvo.y - alvo.sprite_height / 1.5 + _sinwave * (numeroChaves * random_range(.1, .2)), .1);   
    }
}
