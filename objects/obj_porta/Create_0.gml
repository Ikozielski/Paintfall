estado = noone;
//ps = noone;
//ps_porta_subindo
ps = part_system_create();
part_system_draw_order(ps, true);

//Emitter
ptype1 = part_type_create();
part_type_shape(ptype1, pt_shape_smoke);
part_type_size(ptype1, 1, 1, 0, 0);
part_type_scale(ptype1, 0.1, 0.1);
part_type_speed(ptype1, 0.1, 0.1, 0, 0);
part_type_direction(ptype1, 14, 183, 0, 0);
part_type_gravity(ptype1, 0, 270);
part_type_orientation(ptype1, 0, 0, 0, 0, false);
part_type_colour3(ptype1, $333333, $4C4C4C, $000000);
part_type_alpha3(ptype1, 1, 1, 1);
part_type_blend(ptype1, true);
part_type_life(ptype1, 20, 40);


estado_aberta = function (){
    vspeed = 0;
    
    x = xstart;
    
    //part_system_destroy(ps);
}

estado_abrindo = function (){
   vspeed = -.3;
    
    ScreenShake(3);
    
    x = xstart + random_range(-1, 1);
    
    //Criar a particula se ela ainda não existe 
    //if (!part_system_exists(ps)) {
        //ps = part_system_create(ps_porta_subindo);
        //part_system_position(ps, x, y - sprite_height / 2);
    //}
    
    //Criar particula por código
    var _x = x + random_range(-sprite_width / 1.5, sprite_width / 1.5);
    part_particles_create(ps, _x, ystart - sprite_height, ptype1, 1);
    
    //Se subi mais que o tamanho da sprite, vou pro estado aberta
    if(y < ystart - 33){
        estado = estado_aberta;
        alarm[0] = FPS;
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