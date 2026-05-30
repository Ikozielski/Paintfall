show_debug_message("ROOM START: " + room_get_name(room));

switch(room)
{
    case rm_mundo:
        tocar_musica(msc_mundo);
        break;

    case rm_level_1_fase_1:
    case rm_level_1_fase_2:
    case rm_level_1_fase_3:
        tocar_musica(msc_level1);
        break;

    case rm_level_2_fase_1:
    case rm_level_2_fase_2:
    case rm_level_2_fase_3:
        tocar_musica(msc_level2);
        break;
    
    case rm_level_3_fase_1:
    case rm_level_3_fase_2:
    case rm_level_3_fase_3:
         tocar_musica(msc_level3);
        break;
        
    case rm_Tela_Final:
        tocar_musica(msc_creditos);
        break;
    
    case rm_Tela_Inicial:
        tocar_musica(msc_saves);
        break;
    
    case rm_tutorial_1:
    case rm_tutorial_2:
    case rm_tutorial_3:
        tocar_musica(msc_tutorial);
        break;    
        
    default: 
        show_debug_message("Room sem musica configurada: " + room_get_name(room));
        break;
}