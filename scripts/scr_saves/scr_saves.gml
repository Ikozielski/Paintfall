
//Função para salvar o jogo
function salvar_jogo (){
    var _struct_power_ups = {
        power_up_tinta  : global.powerUp_tinta,
        power_up_correr : global.powerUp_correr,
    } 
    
    var _struct_info_player = {
        player_x   : global.player_x,
        player_y   : global.player_y,
        room_atual : global.roomAtual
    }
        
    var _struct = {
        power_ups   : _struct_power_ups,
        info_player : _struct_info_player
    }
    
    var _buff = buffer_create(0, buffer_grow, 1); 
    
    //Convertendo as informações da minha struct em um texto 
    var _string = json_stringify(_struct);


    //Colocando o texto dentro do buffer
    buffer_write(_buff, buffer_string, _string);
    
    //Salvando no arquivo
    buffer_save(_buff, string("save{0}.json", global.saveAtual));
    
    //Deletando o buffer depois de ter usado ele 
    
    buffer_delete(_buff);
    
}



//Preciso: 

//Criar uma função que faz isso tudo 
//Carregar o Arquivo que salvei 
function carregar_save_jogo (){
    
    //Carregando as informações do jogo 
    var _buff = buffer_load(string("save{0}.json", global.saveAtual));
    
    if(_buff == -1) return;
        
    //(Se consegui carregar o arquivo):
    //Converter o Arquivo para texto
    var _string = buffer_read(_buff, buffer_string);
    
    //Converter o Texto para Struct 
    var _struct = json_parse(_string);
    
    //Passar as informações das Structs para as variáveis globais 
    var _struct_power_up     = _struct.power_ups;
    var _struct_info_player  = _struct.info_player;
    
    global.player_x = _struct_info_player.player_x;
    global.player_y = _struct_info_player.player_y;
    global.roomAtual = _struct_info_player.room_atual;
    
    global.powerUp_correr = _struct_power_up.power_up_correr;
    global.powerUp_tinta  = _struct_power_up.power_up_tinta;
    
    buffer_delete(_buff);
}


carregar_save_jogo();


//Criando buffer 
//var _buff = buffer_create(0, buffer_grow, 1); 
//O primeiro parametro é o tamanho do buffer, defini 0 pq com o buffer_grow,
//O tamanho aumenta dependendo da quantidade de dados que tenho que salvar naquele buffer 
//O terceiro parametro é o tipo de dado, nesse caso "string" é 1


//Criando a struct com as informações do meu arquivo.
//var _struct  = {
    //nome : "Juca da Silva", 
    //idade : 72,
    //genero : "Masculino"
//}

////Convertendo as informações da minha struct em um texto 
//var _string = json_stringify(_struct);
//
//
////Colocando o texto dentro do buffer
//buffer_write(_buff, buffer_string, _string);
//
////Salvando no arquivo
//buffer_save(_buff, string("save{0}.json", global.saveAtual));
//
////Deletando o buffer depois de ter usado ele 
//
//buffer_delete(_buff);