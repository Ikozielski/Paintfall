draw_self();

if(global.save_excluido)
{
    draw_set_font(fnt_popup);
    draw_text_transformed(160, 165, "Save excluído com sucesso!", .2, .2, 0);
    draw_set_font(-1);
}