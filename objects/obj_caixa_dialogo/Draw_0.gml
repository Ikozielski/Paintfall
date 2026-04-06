draw_self();

//Se eu não tenho que desenhar o texto, eu saio fora 
if (!desenha_texto) exit;


/*
//Definindo a Fonte
draw_set_font(fnt_dialogo);

//Alianhando o texto
draw_set_halign(0);
draw_set_valign(0);

 */
//Fazendo o texto voltar metade da sprite (pq a sprite está top center)
var _margem = 3;
var _x = x - (sprite_width / 2) + _margem;
var _y = y - (sprite_height / 2) + _margem;
var _larg = (sprite_height * 10) - (_margem * 20);

//Escrevendo
//draw_text_ext_transformed(_x, _y, texto, 60, _larg, .1, .1, 0);

//Resetando a Fonte
//draw_set_font(-1);

//Comentei o por codigo pra fazer usando a biblioteca Scribble
//Criando o texto com scribble
var _texto = scribble(texto).starting_format("fnt_dialogo", c_white);
//Dando o tamanho da escala do texto
_texto = _texto.scale(.1);

//Limitando as bordas do texto para caber dentro da caixa de texto
_texto = _texto.wrap(sprite_width - _margem * 2);

//Desenhando o texto (sempre fazer isso no final de tudo)
_texto.draw(_x, _y, typist);