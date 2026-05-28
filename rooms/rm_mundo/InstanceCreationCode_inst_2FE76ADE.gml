if (global.tutorialConcluido) direcao = -1;


if (global.level_1_concluido){
    
    direcao = -1;
    global.powerUp_tinta = true;
    
} 

if(global.level_2_concluido){
        direcao = 1;
        global.powerUp_correr = true;
        global.powerUp_tinta = true;
}

if(global.level_3_concluido){
        direcao = -1;
        global.powerUp_correr = true;
        global.powerUp_tinta = true;
}
