texto = "Bom dia!"

desenha_texto = false;

me_destruir = false;

image_alpha = 0;
image_xscale = .1;
image_yscale = .1;

//Modificando animações do texto
scribble_anim_wave(1, .3, .1);


//Meu metodo de iniciar 

iniciando = function (){
    image_xscale = lerp(image_xscale, 2.5, .1);
    image_yscale = lerp(image_yscale, 1, .1);
    image_alpha = lerp(image_alpha, .8, .1);

    y = lerp(y, ystart - 30, .1);
    
    //Checando se o y chegou perto do valor final dele, para aí sim escrever o texto
    
    if (y <= ystart - 17) desenha_texto = true;
}

//Meu metodo de destruir 
destruindo = function (){
     y = lerp(y, ystart, .1);
    
    image_xscale = lerp(image_xscale, 0, .2);
    
    image_yscale = lerp(image_yscale, 0, .2);
    
    image_alpha = lerp(image_alpha, 0, .1);
    
    desenha_texto = false;
    
    if(image_alpha <= 0.01) instance_destroy();
}