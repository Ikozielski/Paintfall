
global.debug = false;

//Deinir powerUp pra sempre 
global.powerUp_tinta = false;
global.powerUp_correr  = false;


global.leveis = [ 
    {room: rm_tutorial_1, nome: "Tutorial 1", concluida: false},
    {room: rm_tutorial_2, nome: "Tutorial 2", concluida: false},
    
];

global.faseAtual = 0;




//Globais fases
global.tutorialConcluido = false;
global.level_1_concluido = false;


//Posição inicial do player 
global.player_x = 712;
global.player_y = 560;
global.roomAtual = rm_mundo;


global.saveAtual = 1;