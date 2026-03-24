
if (alvo){
    image_alpha -= .007;
    
    if(image_alpha <= 0){
        instance_destroy();
    }
     
}