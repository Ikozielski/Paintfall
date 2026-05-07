metodo_generico = function (_player){
    instance_destroy(_player);
}

metodo_define_posicao_player = function (_player){
    global.player_x = destino_x;
    global.player_y = destino_y;
    
    instance_destroy();
}

metodo_trava_player = function (_player){
     with (_player) {
        velocidadeHorizontal = 0;
    	troca_estado(estado_sem_controle);
    }
}

metodo_retorna_player = function (_player){
    
    if(!instance_exists(obj_player_teleport)){
    
        
        //Passando as informações do player para o objeto MOVE PLAYER     
        var _sprite = _player.sprite_index;
        var _xscale = _player.direcao;
         
        var _teleport = instance_create_layer(_player.x, _player.y, layer, obj_player_teleport);
        _teleport.destino_x = destino_x; //192;
        _teleport.destino_y = destino_y; //256;
        _teleport.sprite = _sprite;
        _teleport.xscale = _xscale;
    }
}

//Dependendo do modo escolhido, o meu metodo vai ser trava player
// ou o metodo retorna player 

//switch (modo) {
	//
    //case "metodo_trava_player": metodo_generico = metodo_trava_player; break;
//
    //case "metodo_retorna_player": metodo_generico = metodo_retorna_player; break;
//}

//Vou pegar minha variável de método com base no meu modo 
var _modoString = variable_instance_get(id, modo);

metodo_generico = _modoString;


