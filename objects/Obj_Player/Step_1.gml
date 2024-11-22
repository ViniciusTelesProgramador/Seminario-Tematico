/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if(move_checkpoint){

	velh = 0;
	velv = 0;
	
	
	if(image_index >= image_number-1)
	{
		var _to_start = true;
		
		if(instance_exists(obj_chekpoint)){
			if(obj_chekpoint.flag_ativa){
				x=obj_chekpoint.x;
				y=obj_chekpoint.y-5;
				_to_start = false;
			}
		}
		
		if(_to_start){
			x = obj_start.x;
			y = obj_start.y;
		}
		
		muda_sprite(spr_player_entrando);
	}

	if(sprite_index == spr_player_entrando){
		if(image_index >= image_number-1){
			move_checkpoint = false;	
		}
	}
	
}	
