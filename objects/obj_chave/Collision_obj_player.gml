if(seguePlayer) exit;
    
//Me colocando no array Minhas chaves do player 
other.minhasChaves[other.chaves] = id;



other.pega_chave();


seguePlayer = true;
alvo = other.id;

numeroChaves = alvo.chaves;

//instance_destroy();
