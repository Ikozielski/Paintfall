//Só vou rodar o código, se eu tiver um alvo 

if(!alvo) exit;
    
if (!voltar){
    speed -= .05;
    if(speed <= 0) voltar = true;
} else {
    
    speed += .05;
    //Só rodo isso depois de ter perdido toda a minha velocidade 
   direction = point_direction(x, y, alvo.x, alvo.y);
}
    

   

