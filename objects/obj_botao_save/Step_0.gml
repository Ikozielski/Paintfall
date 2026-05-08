var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre){
    image_alpha = .9;
    
    sprite = spr_player_movendo;
    
    
    if(_mouse_click){
        
        //Defino save atual
        global.saveAtual = save;
        
         //Deleta o Save 
        //file_delete("save1.json");
        
         //Carrego o Jogo
         carregar_save_jogo();
       
         //Crio transição pra room destino 
        cria_transicao_inicia(global.roomAtual);
        
    }
  
    
    
} else{
    image_alpha = .6;
    sprite = spr_player_idle;
}