var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre){
    image_alpha = .9;
    
    sprite = spr_player_movendo;
    
    
    if(_mouse_click){
        
        switch (identificador) {
        	
            case 1: cria_transicao_inicia(global.roomAtual);
            break;
            
            case 2: cria_transicao_inicia();
            break; 
        }
        
    }
  
} else{
    image_alpha = .6;
    sprite = spr_vazio;
}