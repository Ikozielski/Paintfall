

var _mouse_sobre = position_meeting(mouse_x, mouse_y, id);

var _mouse_click = mouse_check_button_pressed(mb_left);

if(_mouse_sobre){
    image_speed = 1;
    image_alpha = .9;
    
    if(_mouse_click){
        
        if(instance_exists(obj_botao_popup)){ 
            
            with (obj_botao_popup) {
            	instance_destroy();
            }
            clicou = false;
            image_alpha = .6; 
            image_speed = 0;    
            
        } else{
            
            //image_speed = 1;
            //image_alpha = .9;
          
             excluindo = true;
            
             var _popup = instance_create_layer(x + 40, y + 20, "Dialogo", obj_botao_popup);
            
            _popup.save = save;
            _popup.botao_lixo = id;
             
             //Deleta o Save 
             //file_delete(_texto);
            
            clicou = true;
            image_alpha = .6; 
            image_speed = 0;  
        }

    }
    
}else{
    if(!clicou){
        image_alpha = .6; 
        image_speed = 0;    
    }
}