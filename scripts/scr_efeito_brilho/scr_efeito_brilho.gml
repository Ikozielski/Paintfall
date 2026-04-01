//Você usa essa função para inicializar as varáveis necessárias para utilizar o efeito brilho
function inicia_efeito_brilho(){
    xscale = 1;
    yscale = 1;
    direcao = 0;
    alpha_brilho = 0;
    cor_brilho = c_white;
}

//Aplicando o efieto de brilho
//Você usa essa função para fazer ele brilhar
function aplica_efeito_brilho(_cor = c_white, _intensidade = 1){
    
     //Você tambem pode definir a intensidade do brilho 
    //1 é mais forte, e 0 é inexistente
    alpha_brilho = _intensidade;
    
    //Você também pode definir uma cor aqui
    cor_brilho = _cor;
    
   
    
    
}