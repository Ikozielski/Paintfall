metodo_generico = function (_player){
    instance_destroy(_player);
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