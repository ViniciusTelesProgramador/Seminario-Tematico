event_inherited();

// variáveis de movimento e gravidade
velocidade = 5;
gravidade = .3;
forca_pulo = -7;

qtd_pulos = 0;
max_pulos = 2;
sprite_run= spr_astronauta_Run;
sprite_idle = spr_astronauta_Idle;
sprite_wall_jump= spr_astronauta_Wall_Jump;
sprite_jump = spr_astronauta_Jump;
sprite_double_jump = spr_astronauta_Double_Jump;
sprite_fall = spr_astronauta_Fall;

move_checkpoint = false;



function input_player() {
    var _left, _right, _jump, _xDirection;

    _left = keyboard_check(ord("A"));
    _right = keyboard_check(ord("D"));
	
    _jump = keyboard_check_pressed(vk_space);

	_xDirection = _right - _left;
	
    var _velh = (_right - _left) * velocidade;

    var _no_chao = place_meeting(x, y+1, Obj_Bloco);
	var _na_parede = place_meeting(x+(_xDirection),y, Obj_Bloco);
	
	
	if(_xDirection != 0){
		image_xscale = _xDirection;
	}
	
	
    if (_no_chao) {
		
			if(_xDirection != 0){
			sprite_index = sprite_run;
		}
		else{
			sprite_index = sprite_idle;
		}
	}
	else if(_na_parede)
	{
		sprite_index = sprite_wall_jump;
	}
	else{
		if(qtd_pulos == (max_pulos-1))
		{
			sprite_index = sprite_jump;
		}else{
			sprite_index = sprite_double_jump;
		}
		if(velv >0){
			sprite_index = sprite_fall
		}
	}
	
	
	if(_no_chao)
	{
		qtd_pulos = max_pulos;
        if (_jump) {
            velv = forca_pulo;
			qtd_pulos--;
        }
		
    } 
	else {
			
		if(_jump && qtd_pulos == 1){
			velv = forca_pulo;
			qtd_pulos--;
		}
		
        velv += gravidade;
		
		//código do wall jump 
		if(_na_parede){
			velv =1;
			
			if(_jump){
				velv = forca_pulo;
				velh = (10* _xDirection) *-1;
			}
		}
    }
	velh = lerp(velh,_velh, .1);
}  
                                      