//Iniciando as coisas
inicia_efeito_squash();
inicia_efeito_brilho();

#region Variaveis


velocidadeHorizontal        = 0;
velocidadeHorizontalMaxima  = 1.6;
velocidadeVertical          = 0;
velocidadeVerticalMaxima    = 4;
gravidade                   = .2;
velocidadeCorrendo          = 2.5;
velocidadeAndando           = 1.6;
powerUp = global.powerUp_tinta;
chaves = 0;
minhasChaves = [];
gasteiChave = false;
transicao_criada = false;
teste = 0;
//Variaveis do Coyote Jump
coyote_timer = FPS * .1;
coyote_timer_atual = coyote_timer;

//Variaveis Buffer Pulo 
pulo_timer = FPS * .1;
pulo_timer_atual = 0;

//Variaveis Corner Correction 
corner_pixels = 8;


//quantidadePulos = 2;
//quantidadePulosAtual = quantidadePulos;


////Variaveis do Shaders
//cor_brilho = c_white;
//alpha_brilho = 0;

//Lista de Sprites
lista_sprites = [spr_player_parando, spr_player_idle];
indice_sprite = 0;

//Direcao que estou olhando 
direcao = 1;

//Variáveis com a minha lista de colisões
//Pegar a layer do tilemap pra fazer a colisao
var _layer = layer_tilemap_get_id("tl_level");

tileTinta = layer_tilemap_get_id("tl_tinta");

colisoes = [obj_parede, _layer, obj_caixa];

//Variaveis de Imput
direita = 0;
esquerda = 0;
jump = 0; 
chao = 0;
poder = 0;
corre = 0;

//Varaveis de Estado
estado = noone;


#endregion

#region Métodos


//Criar um método que vai checar se o player precisa mudar a posição inicial dele 
//Criar variaveis globais que vão definir a posição inicial do player 
//Rodar esse medodo no create dele (usando a variavel hub_player que só será true no hub world)

inicia_player = function (){
    
    if (!hub_player) return;
    
    x = global.player_x;
    y = global.player_y;
}

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

pega_chave = function (){
    chaves++;
}

//Tirei o pulo duplo pq não gosto, e pra esse jogo não precisa 
//puloDuplo = function (){
     //if(jump && quantidadePulosAtual > 0){
        ////Ajustando as Sprites 
        //lista_sprites = [spr_player_jump_inicia, spr_player_pulo_cima];
        //transicao_sprites();
        //
        //velocidadeVertical = -velocidadeVerticalMaxima;
        //quantidadePulosAtual--;
    //}
//}

bufferPulo = function (){
    checaChao();
    pegaImput();
    
    if(!chao){
        if (jump) pulo_timer_atual = pulo_timer;
            
        pulo_timer_atual--;
    }
}

//Criando Metodo de Coyote Jump 
coyote_jump = function (){
    checaChao();
    if (!chao){
        coyote_timer_atual--;
    } else{
        coyote_timer_atual = coyote_timer;
    }
}

aplicaGravidade = function (){
    // Se não estiver tocando no chão, aplica a gravidade 
    
    if(!chao){ 
        velocidadeVertical += gravidade;
    } else{
        velocidadeVertical = 0;
        y = round(y);
        
        if(jump || pulo_timer_atual){
            velocidadeVertical = -velocidadeVerticalMaxima;
            pulo_timer_atual = 0;
        }
        
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
    direita  = keyboard_check(vk_right); 
    esquerda = keyboard_check(vk_left);
    jump     = keyboard_check_pressed(vk_up);
    //jump_r   = keyboard_check_released(vk_up);
    poder    = keyboard_check_pressed(vk_space);
    corre    = keyboard_check(vk_shift);
}

ativa_correr = function (){
    if(corre){
        velocidadeHorizontalMaxima = velocidadeCorrendo;
    }else{
        velocidadeHorizontalMaxima = velocidadeAndando;
    }
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
    var _porta = instance_place(x + velocidadeHorizontal, y, obj_porta);
    
    if(_porta){
        
       if(chaves > 0 && _porta.estado == _porta.estado_fechada && !gasteiChave){  
        
            chaves -= 1;
            //_porta.estado = _porta.estado_abrindo;
            
            //Não vai destruir mais a porta, e sim mandar ela para o estado "abrindo"
            //instance_destroy(obj_porta.id);
            
            //Vou destruir a ULTIMA chave da minha lista de chaves 
            //instance_destroy(minhasChaves[chaves])
            
            //Vai avisar pra ULTIMA chave que ela tem que ir até a porta para abri-la 
            
            minhasChaves[chaves].abrindoPorta = true;
        
            minhasChaves[chaves].porta_alvo = _porta;
        }  
    }
   
}

//Se estou dentro da one way, eu tiro a colisao dela

removendo_colisao_one_way = function (){
    //Checando se estou colidindo com a one way
    if (instance_place(x, y, obj_parede_one_way)){
        //Checar se ele está na minha lista de colisões 
        if(array_contains(colisoes, obj_parede_one_way)){
            //Se ele está na minha lista de colisoes, vou tirar de lá 
            //Pegando o index dele na lista 
            var _indice = array_get_index(colisoes, obj_parede_one_way);
            //Removendo ele da lista de colisoes 
            array_delete(colisoes, _indice, 1);
        }
    }
}

//Método para fazer a transição de sprites 
transicao_sprites = function (){
     troca_sprite(lista_sprites[indice_sprite]);
    
    if (acabou_animacao()){
        
        //Checando se o array ainda tem sprites
        var _quantidadeSprites = array_length(lista_sprites) - 1;
        
        //Se indice da sprite ainda não chegou no limite do meu array, eu posso avançar na lista
        if(indice_sprite < _quantidadeSprites) indice_sprite++;
    }
}

ativa_power_up = function (){
    powerUp = global.powerUp_tinta;
}

#region Funções de estado

troca_estado = function (_estado = estado_parado, _listaSprites = [spr_player_parando, spr_player_idle]){
    estado = _estado;
    indice_sprite = 0;
    lista_sprites = _listaSprites;
}

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

//Criando um estado que o player não tem controle 
estado_sem_controle = function (){
    transicao_sprites();
    visible = false;
}

estado_morrendo = function (){
    velocidadeHorizontal = 0;
    velocidadeVertical = 0;
    
    ScreenShake(1.5);
    
    troca_sprite(spr_player_morrendo);
    
    if(acabou_animacao() && !transicao_criada){
        image_speed = 0;
        cria_transicao_inicia(room); 
        transicao_criada = true; 
        //show_debug_message(instance_number(obj_transicao));
    } 
    
}

estado_parado = function (){
    
    visible = true;
    
    if(pulo_timer_atual == 0) velocidadeVertical = 0;
    velocidadeHorizontal = 0;
    aplicaVelocidade();
    
    transicao_sprites();
     
    //Andei
    if(direita != esquerda){ 
        troca_estado(estado_movendo, [spr_player_iniciando_movimento, spr_player_movendo]);
        
        //estado = estado_movendo;
        //indice_sprite = 0;
        ////Passando a minha lista de sprites
        //lista_sprites = [spr_player_iniciando_movimento, spr_player_movendo];
    }
    
    //Pulei
    if(jump || pulo_timer_atual) {
        troca_estado(estado_pulando, [spr_player_jump_inicia, spr_player_pulo_cima]);
        
        criaParticulasProfundidade(x, y, depth - 1, obj_particula_pulo);
        efeito_squash(.4, 1.6);
    }
    
    //Quando eu apertar o botao de poder, eu entro na tinta 
    //Se eu estou no TileMap da tinta eu entro na tinta
    if(poder && global.powerUp_tinta && chaoTinta){
        estado = estado_tinta_entrar;
    }
    
}

estado_movendo = function (){
    aplicaVelocidade();
    
    transicao_sprites();
    
    if(velocidadeHorizontal == 0) {
        troca_estado(estado_parado, [spr_player_parando, spr_player_idle]);
        
        //estado = estado_parado;
        ////Atualizo a lista e zero o indice da sprite 
        //indice_sprite = 0;
        //lista_sprites = [spr_player_parando, spr_player_idle];
    }
    
    if(jump){ 
        troca_estado(estado_pulando, [spr_player_jump_inicia, spr_player_pulo_cima]);
        criaParticulasProfundidade(x, y, depth - 1, obj_particula_pulo);
        efeito_squash(.4, 1.6);
    }
    
    if(!chao) estado = estado_pulando;
    
    if(poder && global.powerUp_tinta && chaoTinta){
        estado = estado_tinta_entrar;
    }
}

estado_pulando = function (){
    
    static _inicia_pulo = true;
    
    if(_inicia_pulo){
        _inicia_pulo = false;
       // quantidadePulosAtual--;
        
    }
    
    aplicaVelocidade();
    
    if(coyote_timer_atual >= 0 && jump){
        velocidadeVertical = -velocidadeVerticalMaxima;
        
        coyote_timer_atual = 0;
        
        criaParticulasProfundidade(x, y, depth - 1, obj_particula_pulo);
        efeito_squash(.4, 1.6);
        
    }
    
    
    //troca_sprite(spr_player_pulo_cima);
    
    //Como sei que vou usar a sprite do pulo pra cima
    //Como sei que vou usar a sprite do pulo pra baixo
    var _layer = layer_tilemap_get_id("tl_level")
    var _colisoes = [obj_parede, _layer];
    //Colidindo com o teto para cima ou para baixo
    if (place_meeting(x, y + sign(velocidadeVertical), _colisoes)){
        
        //Se eu estou 'pulando pra cima', eu vou checar se eu preciso fazer uma 
        //Corner Correction 
        var _parar = true;
        if(velocidadeVertical < 0) {//Estou indo pra cima
            //Checando os pixels da minha borda (la ele)
            
            //Checando para a direita
            for(var _i = 0; _i < corner_pixels; _i++){
                //Checando se eu NÃO estou colidindo em algum pixel do limite 
                var _livre = !place_meeting(x + _i, y + velocidadeVertical, _colisoes);
                
                if(_livre){
                    _parar = false;
                    x += _i;
                    
                    break;
                }
            }
            
            //Corner Correction para a Esquerda
            for(var _i = 0; _i < corner_pixels; _i++){
                var _livre = !place_meeting(x - _i, y + velocidadeVertical, _colisoes);
                
                //se tem espaço livre, eu movo o player para a esquerda
                if(_livre){
                    //Não preciso parar a velocidade vertical
                    _parar = false;
                    
                    //Vou mudar a posição x do player para a esquerda
                    x -= _i;
                    
                    break;
                }
            }
        }
        
        if(_parar) velocidadeVertical = 0;
    }
    
    
    //colisoes[2] = obj_parede_one_way;
    if (velocidadeVertical < 0){
        transicao_sprites();
        //Removendo a One Way da lista de colisoes 
        
        if (array_contains(colisoes, obj_parede_one_way)){
             var _indice = array_get_index(colisoes, obj_parede_one_way);
             array_delete(colisoes, _indice, 1);
        }
        //Funciona nesse caso, mas da ruim se o que eu quero deletar nao for a ultima posicao do array
        //if (array_contains(colisoes, obj_parede_one_way)) array_pop(colisoes);
        
        //colisoes[2] = obj_parede;
        
        //Fazer o player pular mais alto se segurar o botão, eu tirei pq nao gosto disso 
        //if(jump_r){
            ////Corto a velocidade Vertical dele pela metade 
            //velocidadeVertical *= .5;
        //}
        
        
        
    } else { // Estou Caindo, velocidadeVertical é positiva
        lista_sprites = [spr_player_jump_inicio_queda, spr_player_pulo_baixo];
        transicao_sprites();
        //troca_sprite(spr_player_pulo_baixo);
        //Se não estou tocando na parede one way
        //Preciso checar que NÃO estou colidindo com a parede one way
        if (!place_meeting(x, y, obj_parede_one_way)){
            
            if (!array_contains(colisoes, obj_parede_one_way)) array_push(colisoes, obj_parede_one_way);
            //Fazendo a mesma coisa com o push
            //colisoes[2] = obj_parede_one_way;
        } 
      }
    
   //puloDuplo();
    
    //Como sei que voltei pro estado parado?
    if (chao){
        _inicia_pulo = true;
        //Resetando a quantidade de pulos 
        //quantidadePulosAtual = quantidadePulos;
        
        troca_estado(estado_parado, [spr_playe_pousando, spr_player_idle]);
        criaParticulasProfundidade(x, y, depth - 1, obj_particula_pouso); 
        efeito_squash(1, .5);
    }
}

estado_powerUp_inicio = function (){
    
    troca_sprite(spr_player_powerUp_inicio);
    
    velocidadeHorizontal = 0;
    velocidadeVertical = 0;
    
    powerUp = true;
    
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
       troca_estado(estado_parado, [spr_player_idle]);
    } 
}

estado_tinta_loop = function (){
    transicao_sprites();
    
    aplicaVelocidade();
    
    //Não poder pular quando estou no tinta loop
    velocidadeVertical = 0;
    
    mask_index = spr_player_tinta_loop;
    
     //var _obstaculoCima = place_meeting(x, y - 10, colisoes); 
    var _obstaculoCima = collision_rectangle (bbox_left, bbox_top - 20, bbox_right, bbox_top, colisoes, false, true);
    
    
    //Se na minha frente e embaixo de mim nao tiver chão, eu zero meu velh
    var _parar = !place_meeting(x + (sign(velocidadeHorizontal) * 10), y + 1, tileTinta);
    if(_parar) velocidadeHorizontal = 0;
    
    if(poder){
        if (_obstaculoCima) exit; 
            
        troca_estado(estado_tinta_sair, [spr_tinta_fim, spr_player_tinta_sair]);
        instance_create_depth(x, y, depth - 1, obJ_tinta_sair_particulas);
        
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
    
    if (acabou_animacao()) {
        troca_estado(estado_tinta_loop, [spr_tinta_inicio, spr_player_tinta_loop]);
    }
        //estado = estado_tinta_loop;

}

//Quando eu clicar Z ele vai para o estado de sair da tinta 

estado_tinta_sair = function (){
    
    
    velocidadeHorizontal = 0;
    mask_index = spr_player_idle;
    
    var _quantidadeArray = array_length(lista_sprites) - 1
    if(acabou_animacao() && indice_sprite >= _quantidadeArray) {
        troca_estado(estado_parado, [spr_player_idle]);
    }
    transicao_sprites();
    
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
    dbg_slider(ref_create(id, "velocidadeAndando"), 0, 3, "Velocidade Andando", .1);
    dbg_slider(ref_create(id, "velocidadeCorrendo"), 0, 4, "Velocidade Correndo", .2);
    
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

//Definindo a minha posição inicial 
inicia_player();