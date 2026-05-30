if(seguePlayer) exit;
    
if(coletada) exit;
    
coletada = true;
 
   
//Me colocando no array Minhas chaves do player 
other.minhasChaves[other.chaves] = id;

other.play_audio(sfx_chave,2,0);

other.pega_chave();


seguePlayer = true;
alvo = other.id;

numeroChaves = alvo.chaves;

//instance_destroy();
