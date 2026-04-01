pegaImput();
checaChao();
ativaDebug();
movimento();
ajusta_escala();
retorna_efeito_squash();
passaPorta();

alpha_brilho = lerp(alpha_brilho, 0, .1);

estado();



if(keyboard_check_pressed(ord("B"))) cor_brilho = c_white;
if(keyboard_check_pressed(ord("C"))) cor_brilho = c_gray;
if(keyboard_check_pressed(ord("Y"))) cor_brilho = c_yellow;
if(keyboard_check_pressed(ord("K"))) aplica_efeito_brilho(c_aqua, .5);
    

if (keyboard_check_pressed(ord("G"))) global.chaves += 1;