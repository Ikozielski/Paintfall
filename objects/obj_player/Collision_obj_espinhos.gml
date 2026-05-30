if(colidiuEspinhos) exit;

if(!podePassar){
    
    play_audio(sfx_dano2, 2, 0);
    estado = estado_morrendo;
    
    colidiuEspinhos = true;
}