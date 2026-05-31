randomise();

if (!audio_group_is_loaded(audio_group_musicas))
{
    audio_group_load(audio_group_musicas);
}

if (!audio_group_is_loaded(audio_group_soud_effects)){
    audio_group_load(audio_group_soud_effects);
}

if (room == rm_Tela_Inicial)
{
    tocar_musica(msc_saves);
}

transicao_criada = false;



resetarGlobais = function (){
    obj_player.chaves = 0;
    global.powerUp_correr = false;
    global.powerUp_tinta = false;
}


function  tocar_musica (_som){
    
    
    if(global.musica_atual != _som){
        
        if(audio_is_playing(global.musica_atual)){
            
            audio_stop_sound(global.musica_atual);
            
        }
        
        audio_play_sound(_som, 0, true);
        global.musica_atual = _som
        
    }
    
}


