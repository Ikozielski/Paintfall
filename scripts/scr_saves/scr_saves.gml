
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