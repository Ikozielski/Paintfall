estado = noone;
alarme_pulo = false;
alarme_x = false;

#region Maquina de Estados

function estado_parado_pulo(){
    image_index = 0;
    
    mask_index = sprite_index;
    
    if(!alarme_pulo){
        alarm[0] = tempo_parado; 
        alarme_pulo = true;
    }
    
}

function estado_transicao_to_x(){
    if(image_index >= 8) estado = estado_parado_x;
    
}
function estado_parado_x(){
    image_index = 10;
    
    mask_index = spr_vazio;
    
    if(!alarme_x){
        alarm[1] = tempo_parado; 
        alarme_x = true;
    }
}

function estado_transicao_to_pulo(){
    if(image_index >= image_number -1) estado = estado_parado_pulo;
}

#endregion

estado = estado_parado_pulo;
if(estado_inicial == "estado_parado_x"){
    estado = estado_parado_x;
}
