metodo_generico = function (_player){
    
    //Resolução do TP
    //with (_player) {
        //instance_destroy();
        //
        //var _player_teleport = instance_create_depth(x, y, 0, obj_player_teleport);
        //
        //var _sinwave =  sin(current_time / 1000);
         //
        //_player_teleport.x = lerp(xstart, 192, .001);
        //_player_teleport.y = lerp(ystart, 256, .001);
        //
        //if(_player_teleport. x == 192 && _player_teleport.y == 256){
            //instance_destroy(_player_teleport);
            //var _player_normal = instance_create_depth(192, 256, 0, obj_player);
        //}
        //
    //}
    if(!instance_exists(obj_player_teleport)){
        
        var _teleport = instance_create_layer(_player.x, _player.y, layer, obj_player_teleport);
        _teleport.destino_x = 192;
        _teleport.destino_y = 256;
    }
    
    
}