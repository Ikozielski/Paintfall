//Create do OBJ: 

#region debug

view_player = noone;

rodaDebug = function (){ 
    
    if (!global.debug) exit;
        
    show_debug_overlay(1);

    view_player = dbg_view("View player", 1, 60, 80, 300, 400);
     
    dbg_watch(ref_create(id, "velocidadeVertical"), "VelocidadeVertical"); 
    dbg_slider(ref_create(id, "velocidadeVerticalMaxima"), 0, 10, "Velocidade Maxima", .1);
    dbg_slider(ref_create(id, "gravidade"), 0, 3, "Gravidade", .001);
    dbg_slider(ref_create(id, "velocidadeAndando"), 0, 3, "Velocidade Andando", .1);
    dbg_slider(ref_create(id, "velocidadeCorrendo"), 0, 4, "Velocidade Correndo", .2);
    
    global.powerUp_correr = true;
    global.powerUp_tinta = true;
    
}

ativaDebug = function (){
    
    if(!DEBUG_MODE) return;
  
    if(keyboard_check_pressed(vk_tab)){
        global.debug = !global.debug;
        
        if(global.debug){
            rodaDebug();
        }else{
            show_debug_overlay(0);
            if(!dbg_view_exists(view_player)){ 
                dbg_view_delete(view_player);
                view_player = noone;
            }            
        } 
    }
}


#endregion