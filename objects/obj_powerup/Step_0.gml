
if (alvo){
    image_alpha -= .007;
    
    if(image_alpha <= 0){
        
        instance_destroy();
    }
     
}

if(powerUp == "powerUp_correr") image_blend = c_aqua;