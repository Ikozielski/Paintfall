//Só vou rodar o código, se eu tiver um alvo 

if(!alvo) exit;
    
image_xscale = lerp(image_xscale, speed * 3, .1);
image_angle = direction;

    

if (!voltar){
    speed -= .05;
    if(speed <= 0) {
        voltar = true
        
    //Só rodo isso depois de ter perdido toda a minha velocidade 
    //Deixando a direção mais aleatória 
    var _x = alvo.x + random_range(-5, 5);
    var _y = alvo.y -12  + random_range(-5, 5);
    var _direcao =  point_direction(x, y, _x, _y);
    direction = _direcao;
    }
} else {
    
    speed += .05;
    
    //Se eu colidi com o player, eu me destruo 
    var _player = instance_place(x, y, obj_player);
    
    if (_player) {
        
        with (_player) {
            var _xscale = random_range(-.3, .3); 
            var _yscale = random_range(-.3, .3);
            efeito_squash(1 + _xscale, 1 + _yscale);
        }
        instance_destroy();
    }
 }
    

   

