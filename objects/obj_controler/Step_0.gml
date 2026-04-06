if keyboard_check_pressed(ord("R")) {
    cria_transicao_inicia(room);
    resetarGlobais();
}

if(keyboard_check_pressed(vk_f11)){
    //Pegando se a tela está cheia 
    var _full = window_get_fullscreen();
    
    //Tocando entre tela cheia ou não 
    window_set_fullscreen(!_full);
}