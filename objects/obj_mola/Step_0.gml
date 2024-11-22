/// @description Controle da mola
// Detecta o jogador, ativa a mola e troca o sprite durante o uso

// Detecta colisão com o jogador
var _player = instance_place(x, y - 3, Obj_Player);

if (_player) {
    // Troca o sprite para o estado de movimento
    muda_sprite(spr_mola_movimento);
    flag_colisao = true;
    
    // Aplica força para o jogador e reseta os pulos
    _player.velv = -forca_mola;
    _player.qtd_pulos = _player.max_pulos;
    _player.qtd_pulos--; // Diminui 1 pulo após o uso da mola
}

// Retorna a mola ao estado original após a animação terminar
if (flag_colisao && image_index >= image_number - 1) {
    muda_sprite(spr_mola);
    flag_colisao = false;
}
