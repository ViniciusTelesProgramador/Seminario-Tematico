// código onde controla a colisão
var _colx, _coly;

// Verifica colisão horizontal (eixo X) e vertical (eixo Y)
_colx = instance_place(x + velh, y, Obj_Bloco);
_coly = instance_place(x, y + velv, Obj_Bloco);

if (_colx) {
    // Colisão à direita
    if (velh > 0) {
        x = _colx.bbox_left - (bbox_right - x);
    }

    // Colisão à esquerda
    if (velh < 0) {
        x = _colx.bbox_right - (bbox_left - x);
    }
    
    velh = 0;
}

if (_coly) {
    // Colisão abaixo
    if (velv > 0) {
        y = _coly.bbox_top - (bbox_bottom - y); // Corrigido para usar _coly
    }

    // Colisão acima
    if (velv < 0) {
        y = _coly.bbox_bottom - (bbox_top - y); // Corrigido para usar _coly
    }

    velv = 0;
}

// Atualiza as posições finais
x += velh;
y += velv;
