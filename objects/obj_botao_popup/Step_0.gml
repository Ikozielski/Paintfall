
if(mouse_check_button_pressed(mb_left))
{
    if(point_in_rectangle(mouse_x, mouse_y, botao_sim_x, botao_y, botao_sim_x + largura_botao, botao_y + altura_botao))
    {
        var _arquivo = "Save" + string(save) + ".json";
        
        file_delete(_arquivo);
        
        global.save_excluido = true;
        
        alarm[0] = FPS;
        
        cancela_animacao();
    }

    if(point_in_rectangle(mouse_x, mouse_y, botao_nao_x, botao_y, botao_nao_x + largura_botao, botao_y + altura_botao))
    {
        cancela_animacao();
        instance_destroy();
    }
}