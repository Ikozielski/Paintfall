//Iniciando as coisas
inicia_efeito_squash();
inicia_efeito_brilho();

#region Variaveis


velocidadeHorizontal        = 0;
velocidadeHorizontalMaxima  = 1.5;
velocidadeVertical          = 0;
velocidadeVerticalMaxima    = 4;
gravidade                   = .2;


////Variaveis do Shaders
//cor_brilho = c_white;
//alpha_brilho = 0;

//Direcao que estou olhando 
direcao = 1;

//Variáveis com a minha lista de colisões
//Pegar a layer do tilemap pra fazer a colisao
var _layer = layer_tilemap_get_id("tl_level");

tileTinta = layer_tilemap_get_id("tl_tinta");

colisoes = [obj_parede, _layer];

//Variaveis de Imput
direita = 0;
esquerda = 0;
jump = 0; 
chao = 0;
poder = 0;

//Varaveis de Estado
estado = noone;




#endregion

#region Métodos

aplicaVelocidade  = function (){
    
    checaChao();
    
    //Aplicando Imputs na Velocidade Horizontal
    velocidadeHorizontal = (direita - esquerda) * velocidadeHorizontalMaxima;
    
    //Aplicando a Gravidade no Player
    aplicaGravidade();
    puloPlayer();
    
}

movimento = function (){
    //Aplicando Velocidade no X
    move_and_collide(velocidadeHorizontal, 0, colisoes, 4);
    move_and_collide(0, velocidadeVertical, colisoes, 12);
}

puloPlayer = function (){
    if (chao && jump) velocidadeVertical = -velocidadeVerticalMaxima; 
}

aplicaGravidade = function (){
    // Se não estiver tocando no chão, aplica a gravidade 
    
    if(!chao){ 
        velocidadeVertical += gravidade;
    } else{
        velocidadeVertical = 0;
        y = round(y);
    }
    
    //Limitando a velocidade vertical do player 
    velocidadeVertical = clamp(velocidadeVertical, -velocidadeVerticalMaxima, velocidadeVerticalMaxima);
    
}
checaChao = function (){
    chao = place_meeting(x, y + 1, colisoes);
    
    chaoTinta = place_meeting(x, y + 1, tileTinta)
}

pegaImput = function (){
    
    //Pegando Imputs
    direita = keyboard_check(vk_right); 
    esquerda = keyboard_check(vk_left);
    jump = keyboard_check_pressed(vk_up);
    poder = keyboard_check_pressed(vk_space);
}

criaParticulasProfundidade = function (_x, _y, _profundidade, _objeto){
    instance_create_depth(_x, _y, _profundidade, _objeto);
}

ajusta_escala = function (){ 
    //Se minha velocidade Horizontal for diferente de 0, ele vai colocar o sinal (+ ou -) no imagem xscale, pra 
    //saber o lado de virar a sprite 
   if (velocidadeHorizontal != 0) direcao = sign(velocidadeHorizontal);
}

pega_powerUp = function (){
   
    estado = estado_powerUp_inicio;
    //if(acabou_animacao()) other.instance_destroy();
}

passaPorta = function (){
    //Preciso checar se a porta esta no estado de fechada, pra poder fazer isso :
    var porta = instance_place(x + velocidadeHorizontal, y, obj_porta);
    
    if(global.chaves > 0 && porta && porta.estado == porta.estado_fechada){  
        
        global.chaves -= 1;
        porta.estado = porta.estado_abrindo;
        //Não vai destruir mais a porta, e sim mandar ela para o estado "abrindo"
        //instance_destroy(obj_porta.id);
    }
}

#region Funções de estado

acabou_animacao = function (){
    var _speed = sprite_get_speed(sprite_index) / FPS
    
    if(image_index + _speed >= image_number){
        return true;
    }
}

troca_sprite = function (_sprite = spr_parede){
    
    if(sprite_index != _sprite){
      sprite_index = _sprite;
      image_index = 0;   
    }
}

estado_parado = function (){
    
    velocidadeHorizontal = 0;
    aplicaVelocidade();
    
    troca_sprite(spr_player_idle);
    
    //Andei
    if(direita != esquerda){ 
        estado = estado_movendo;
    }
    
    //Pulei
    if(jump) {
        estado = estado_pulando; 
        criaParticulasProfundidade(x, y, depth - 1, obj_particula_pulo);
        efeito_squash(.4, 1.6);
    }
    
    //Quando eu apertar o botao de poder, eu entro na tinta 
    //Se eu estou no TileMap da tinta eu entro na tinta
    if(poder && global.pegueiPowerUp && chaoTinta){
        estado = estado_tinta_entrar;
    }
    
}

estado_movendo = function (){
    aplicaVelocidade();
    
    troca_sprite(spr_player_movendo);
    
    if(velocidadeHorizontal == 0) {
        estado = estado_parado;
    }
    
    if(jump){ 
        estado = estado_pulando; 
        criaParticulasProfundidade(x, y, depth - 1, obj_particula_pulo);
    }
    
    if(!chao) estado = estado_pulando;
    
    if(poder && global.pegueiPowerUp && chaoTinta){
        estado = estado_tinta_entrar;
    }
}

estado_pulando = function (){
    aplicaVelocidade();
  //troca_sprite(spr_player_pulo_cima);
    
    //Como sei que vou usar a sprite do pulo pra cima
    //Como sei que vou usar a sprite do pulo pra baixo
    
    
    //colisoes[2] = obj_parede_one_way;
    if (velocidadeVertical < 0){
        troca_sprite(spr_player_pulo_cima);
        //Removendo a One Way da lista de colisoes 
        
        if (array_contains(colisoes, obj_parede_one_way)){
             var _indice = array_get_index(colisoes, obj_parede_one_way);
             array_delete(colisoes, _indice, 1);
        }
        //Funciona nesse caso, mas da ruim se o que eu quero deletar nao for a ultima posicao do array
        //if (array_contains(colisoes, obj_parede_one_way)) array_pop(colisoes);
        
        //colisoes[2] = obj_parede;
        
    } else { // Estou Caindo, velocidadeVertical é positiva
        troca_sprite(spr_player_pulo_baixo);
        //Se não estou tocando na parede one way
        //Preciso checar que NÃO estou colidindo com a parede one way
        if (!place_meeting(x, y, obj_parede_one_way)){
            
            if (!array_contains(colisoes, obj_parede_one_way)) array_push(colisoes, obj_parede_one_way);
            //Fazendo a mesma coisa com o push
            //colisoes[2] = obj_parede_one_way;
        } 
      }
    
    //Como sei que voltei pro estado parado?
    if (chao){
       estado = estado_parado;
       criaParticulasProfundidade(x, y, depth - 1, obj_particula_pouso); 
        efeito_squash(1, .5);
    }
}

estado_powerUp_inicio = function (){
    
    troca_sprite(spr_player_powerUp_inicio);
    
    velocidadeHorizontal = 0;
    velocidadeVertical = 0;
    
    global.pegueiPowerUp = true;
    
    if(acabou_animacao()) estado = estado_powerUp_meio;
    
}

estado_powerUp_meio = function (){
    troca_sprite(spr_player_powerUp_meio);
    //if(acabou_animacao()) estado = estado_powerUp_fim;
    //Só vai para o PowerUp fim se não existir mais particulas do power up 
    if(!instance_exists(obj_particula_powerUp)) estado = estado_powerUp_fim;
}

estado_powerUp_fim = function (){
    troca_sprite(spr_player_powerUp_fim);
    if(acabou_animacao()){
       estado = estado_parado; 
    } 
}

estado_tinta_loop = function (){
    troca_sprite(spr_player_tinta_loop);
    
    aplicaVelocidade();
    
    mask_index = spr_player_tinta_loop;
    
     //var _obstaculoCima = place_meeting(x, y - 10, colisoes); 
    var _obstaculoCima = collision_rectangle (bbox_left, bbox_top - 20, bbox_right, bbox_top, colisoes, false, true);
    
    
    //Se na minha frente e embaixo de mim nao tiver chão, eu zero meu velh
    var _parar = !place_meeting(x + (velocidadeHorizontal * 10), y + 1, tileTinta);
    if(_parar){
        velocidadeHorizontal = 0;
    }
    
    if(poder){
        if (_obstaculoCima) exit;
        instance_create_depth(x, y, depth - 1, obJ_tinta_sair_particulas);
        estado = estado_tinta_sair;
    }
}

//Estado loop da tinta
//Entrando no estado loop da tinta 
estado_tinta_entrar = function (){
    
    velocidadeHorizontal = 0;
    troca_sprite(spr_player_tinta_entrar);
    
     if (image_index == 0){ 
        instance_create_depth(x, y, depth - 1, obj_tinta_entrar_particulas);
    }
    
    if (acabou_animacao()) estado = estado_tinta_loop;

}

//Quando eu clicar Z ele vai para o estado de sair da tinta 

estado_tinta_sair = function (){
    
    
    velocidadeHorizontal = 0;
    troca_sprite(spr_player_tinta_sair);
    mask_index = spr_player_idle;
    if(acabou_animacao()) estado = estado_parado; 
    
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