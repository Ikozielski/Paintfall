pegaImput();
checaChao();
ativaDebug();
movimento();
ajusta_escala();
retorna_efeito_squash();
passaPorta();
retorna_efeito_brilho(.01);
removendo_colisao_one_way();
coyote_jump();
bufferPulo();
if(global.powerUp_correr) ativa_correr();
    
caixa_empurrando = instance_place(x + (direcao * 5), y, obj_caixa);

if(caixa_empurrando && velocidadeHorizontal != 0 && estado != estado_inicia_empurro && estado != estado_empurrando){
    
    
   // direcao_empurro = sign(velocidadeHorizontal);
    estado = estado_inicia_empurro;
} 
    
show_debug_message(estado);

estado();


//if(keyboard_check_pressed(ord("B"))) cor_brilho = c_white;
//if(keyboard_check_pressed(ord("C"))) cor_brilho = c_gray;
//if(keyboard_check_pressed(ord("Y"))) cor_brilho = c_yellow;
//if(keyboard_check_pressed(ord("K"))) aplica_efeito_brilho();
    //

//if (keyboard_check_pressed(ord("G"))) chaves++;

