var _placa = place_meeting(x + 1, y , obj_player);





if (_placa){
    
    if(!instance_exists(minha_caixa_dialogo))
    minha_caixa_dialogo = instance_create_layer(x, y - 40, "Dialogo", obj_caixa_dialogo); 
    minha_caixa_dialogo.image_alpha = 0.8; 
    
}
