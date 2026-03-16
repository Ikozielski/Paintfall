#region Variaveis

velocidadeHorizontal = 0;
velocidadeHorizontal_Maxima = 1.5;


//Variaveis de Imput
right = false;
left = false;
jump = false; 



#endregion

#region Métodos

pegaImput = function (){
    
    //Pegando Imputs
    right = keyboard_check(vk_right); 
    left = keyboard_check(vk_left);
}

movimentacao  = function (){
    
    //Aplicando Imputs na Velocidade Horizontal
    velocidadeHorizontal = (right - left) * velocidadeHorizontal_Maxima;
    
    //Aplicando Velocidade no X
    move_and_collide(velocidadeHorizontal, 0, obj_parede);
    
}




#endregion

