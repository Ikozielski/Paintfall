estado = noone;


estado_aberta = function (){
    vspeed = 0;
    
}

estado_abrindo = function (){
   vspeed = -.3;
    //Se subi mais que o tamanho da sprite, vou pro estado aberta
    if(y < ystart - 33){
        estado = estado_aberta;
    }
}

//Estado fechada

estado_fechada = function (){
   
}

//Estado abrindo
//A porta vai subir até liberar o caminho do jogador 

//estado aberta 

//Se a toda porta for iniciada como fechada, o codigo que esta no passaPorta() do player, vai analisar somente a porta
//da frente dele
estado = estado_fechada;