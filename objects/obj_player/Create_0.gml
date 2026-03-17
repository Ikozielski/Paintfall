#region Variaveis

velocidadeHorizontal        = 0;
velocidadeHorizontalMaxima  = 1.5;
velocidadeVertical          = 0;
velocidadeVerticalMaxima    = 4;
gravidade                   = .2;

//Variaveis de Imput
direita = 0;
esquerda = 0;
jump = 0; 
chao = 0;

//Varaveis de Estado
estado = noone;


#endregion

#region Métodos

aplicaVelocidade  = function (){
    
    //Aplicando Imputs na Velocidade Horizontal
    velocidadeHorizontal = (direita - esquerda) * velocidadeHorizontalMaxima;
    
    //Aplicando a Gravidade no Player
    aplicaGravidade();
    puloPlayer();
    
}

movimento = function (){
    //Aplicando Velocidade no X
    move_and_collide(velocidadeHorizontal, 0, obj_parede, 4);
    move_and_collide(0, velocidadeVertical, obj_parede, 12);
}



puloPlayer = function (){
    if (chao && jump) velocidadeVertical = -velocidadeVerticalMaxima; 
}

aplicaGravidade = function (){
    // Se não estiver tocando no chão, aplica a gravidade 
    
    if(!chao){ 
        velocidadeVertical += gravidade;
    } else{
        y = round(y);
        velocidadeVertical = 0;
    }
    
}
checaChao = function (){
    chao = place_meeting(x, y + 1, obj_parede);
    
}

pegaImput = function (){
    
    //Pegando Imputs
    direita = keyboard_check(vk_right); 
    esquerda = keyboard_check(vk_left);
    jump = keyboard_check(vk_space);
}

#region Funções de estado

troca_sprite = function (_sprite = spr_parede){
    if(sprite_index != _sprite){
      sprite_index = _sprite;
      image_index = 0;   
    }
    
}

estado_parado = function (){
    
    troca_sprite(spr_player_idle);
    
    //Andei
    if(direita != esquerda){ 
        estado = estado_movendo;
    }
    
    //Pulei
    if(jump) estado = estado_pulando;
}

estado_movendo = function (){
    aplicaVelocidade();
    
    troca_sprite(spr_player_movendo);
    
    if(velocidadeHorizontal == 0) estado = estado_parado;
}

estado_pulando = function (){
    aplicaVelocidade();
  //troca_sprite(spr_player_pulo_cima);
    
    //Como sei que vou usar a sprite do pulo pra cima
    //Como sei que vou usar a sprite do pulo pra baixo
    if (velocidadeVertical < 0){
        troca_sprite(spr_player_pulo_cima);
    } else {
        troca_sprite(spr_player_pulo_baixo);
      }
    
    //Como sei que voltei pro estado parado?
    if (chao) estado = estado_parado;
}

estado_powerUp_inicio = function (){
    troca_sprite(spr_player_powerUp_inicio);
}

estado_powerUp_meio = function (){
    troca_sprite(spr_player_powerUp_meio);
}

estado_powerUp_fim = function (){
    troca_sprite(spr_player_powerUp_fim);
}



#endregion



#region debug

view_player = noone;

rodaDebug = function (){ 
    
    if (!global.debug) exit;
        
    show_debug_overlay(1);

    view_player = dbg_view("View player", 1, 60, 80, 300, 400);
     
    dbg_watch(ref_create(id, "velocidadeVertical"), "VelocidadeVertical"); 
    dbg_slider(ref_create(id, "velocidadeVerticalMaxima"), 0, 10, "Velocidade Maxima", .1);
    dbg_slider(ref_create(id, "gravidade"), 0, 3, "Gravidade", .001);
    
}

ativaDebug = function (){
    
    if(!DEBUG_MODE) return;
  
    if(keyboard_check_pressed(vk_tab)){
        global.debug = !global.debug;
        
        if(global.debug){
            rodaDebug();
        }else{
            show_debug_overlay(0);
            if(!dbg_view_exists(view_player)){ 
                dbg_view_delete(view_player);
                view_player = noone;
            }            
        } 
    }
}


#endregion

#endregion


//Final do Create
estado = estado_parado;