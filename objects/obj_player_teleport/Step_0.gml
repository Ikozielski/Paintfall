var _distancia = point_distance(x, y, destino_x, destino_y);

if(_distancia > 2){
    
    
    //Criando o rastro do player 
    //Salvando o rastro criado em uma variavel
    var _rastro = instance_create_depth(x, y, -100, obj_rastro_player);
    _rastro.sprite_index = sprite;
    _rastro.image_xscale = xscale;
    
    
    //Quando eu cair no buraco, vou fazer a camera me seguir
    camera_set_view_target(view_camera[0], id);
    
    //Vou pro meu destino x e y
    x = lerp(x, destino_x, .11);
    y = lerp(y, destino_y, .11);
    
} else{
    if(instance_exists(obj_player)){
        obj_player.x = destino_x;
        obj_player.y = destino_y;
        
        camera_set_view_target(view_camera[0], obj_player);
        
        instance_destroy();
        
        with (obj_player) {
            troca_estado(estado_parado());	
        }
    }
}