
//Se ele ainda não é o meu alvo
if(alvo == noone){
    
    //Coloco o player no estado correto
    other.pega_powerUp();
    //Defino o meu alvo
    alvo = other.id;
    
    other.play_audio(sfx_powerUp, 2, 0);
    
    //Vou para a posição correta
    movendo();
    explosao();
    
    //global.powerUp_tinta = true;
    //other.powerUp = true;
    
    variable_global_set(powerUp, true);
    
    other.ativa_power_up();
}


